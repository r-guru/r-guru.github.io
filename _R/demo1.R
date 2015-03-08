init()
dta = readRDS('analysis_dta.rds')
ggplot(dta[SEA=='ROK' & variable == 'P' & PER==2085]) + geom_boxplot(aes(x=factor(q), y=DIF))+facet_grid(GCM~RCP)+theme(axis.text = element_blank())
