module Jekyll
    class RMarkdownConverter < Converter
        safe true
        priority :low

    def setup
      return if @setup
      require 'rinruby'
      @setup = true
    rescue
      STDERR.puts 'do `gem install rinruby`'
      raise FatalException.new("Missing dependency: rinruby")
    end

    def matches(ext)
      ext =~ /rmd/i
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      setup
      R.eval "require(knitr)"
      R.assign "content", content
      R.eval "content <- (knitr::knit2html(text = content, fragment.only = TRUE))"
      # rinruby's pull has issue with diacritics - the string is trimmed if chars with diacritics are contained
      # ugly workaround: pull doubled string and remove the second part by the separating string
      R.eval "content <- paste0(content, '$endofknitted$', content)"
      knitted = R.pull "content"
      knitted[0 .. knitted.index("$endofknitted$") - 1]
    end
  end
end