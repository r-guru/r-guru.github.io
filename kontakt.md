---
layout: default
title: KONTAKT
permalink: /kontakt/index.php
weight: 100
---

### KONTAKT

#### Telefon
+420 775 123 456

#### E-mail
info@r-guru.cz

#### Kontaktní formulář

{% raw %}
<?php
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];
    $from = "From: r-guru";
    $to = "stanislav.horacek@gmail.com";
    $subject = "Zpráva z r-guru";
    $body = "From: $name\n E-Mail: $email\n Message:\n $message";
    if ($_POST["submit"]) {
        if (mail ($to, $subject, $body, $from)) {
            echo "<p>Zpráva byla úspěšně odeslána. Děkujeme!</p>";
        } else {
            echo "<p>Zprávu se nezdařilo odeslat, zkuste to prosím znovu.</p>";
        }
    }
?>
{% endraw %}

<form method="post" action="index.php">
    <label>Jméno</label>
    <input name="name">

    <label>E-mail</label>
    <input name="email" type="email">

    <label>Zpráva</label>
    <textarea name="message"></textarea>

    <input id="submit" name="submit" type="submit" value="Odeslat">
</form>
