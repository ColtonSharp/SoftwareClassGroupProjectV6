output$plot1 <- renderPlotly({DomainRankScatterPlot})
output$plot2 <- renderPlotly({DomainRankBarChart})
output$plot3 <- renderPlotly({DomainCountGroupedBarGraph})
output$gbc <- renderPlotly({DomainCountGroupedBarGraphMain})
output$bc <- renderPlotly({DomainRankBarChartMain})
output$sp <- renderPlotly({DomainRankScatterPlotMain})
output$gbccomp <- renderPlotly({DomainCountGroupedBarGraphCompOnly})
output$bccomp <- renderPlotly({DomainRankBarChartCompOnly})
output$spcomp <- renderPlotly({DomainRankScatterPlotCompOnly})
##################################################DASHBOARD COLUMN CONTROLS##################################################
output$rankavg <- flexdashboard::renderGauge({
  value1 <- df$RankList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df$DomainList == input$domain)
  gaugerate <- df$RankList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'R', gaugeSectors(
    success = c(b, c), warning = c(d,e), danger  = c(a, f)
  ))
})
output$counttotal <- flexdashboard::renderGauge({
  value1 <- df6$df5.CntTotalList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain)
  gaugerate <- df6$df5.CntTotalList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$linkcount <- flexdashboard::renderGauge({
  value1 <- df6$df3.CntLinkList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain)
  gaugerate <- df6$df3.CntLinkList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$desccount <- flexdashboard::renderGauge({
  value1 <- df6$df2.CntDescrList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain)
  gaugerate <- df6$df2.CntDescrList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$titlecount <- flexdashboard::renderGauge({
  value1 <- df6$df4.CntTitleList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain)
  gaugerate <- df6$df4.CntTitleList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
##################################################DASHBOARD COLUMN CONTROLS##################################################
##################################################DASHBOARD COLUMN CONTROLS##################################################
output$rankavg1 <- flexdashboard::renderGauge({
  value1 <- df$RankList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df$DomainList == input$domain1)
  gaugerate <- df$RankList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'R', gaugeSectors(
    success = c(b, c), warning = c(d,e), danger  = c(a, f)
  ))
})
output$counttotal1 <- flexdashboard::renderGauge({
  value1 <- df6$df5.CntTotalList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain1)
  gaugerate <- df6$df5.CntTotalList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$linkcount1 <- flexdashboard::renderGauge({
  value1 <- df6$df3.CntLinkList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain1)
  gaugerate <- df6$df3.CntLinkList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$desccount1 <- flexdashboard::renderGauge({
  value1 <- df6$df2.CntDescrList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain1)
  gaugerate <- df6$df2.CntDescrList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$titlecount1 <- flexdashboard::renderGauge({
  value1 <- df6$df4.CntTitleList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain1)
  gaugerate <- df6$df4.CntTitleList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
##################################################DASHBOARD COLUMN CONTROLS##################################################
##################################################DASHBOARD COLUMN CONTROLS##################################################
output$rankavg2 <- flexdashboard::renderGauge({
  value1 <- df$RankList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df$DomainList == input$domain2)
  gaugerate <- df$RankList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'R', gaugeSectors(
    success = c(b, c), warning = c(d,e), danger  = c(a, f)
  ))
})
output$counttotal2 <- flexdashboard::renderGauge({
  value1 <- df6$df5.CntTotalList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain2)
  gaugerate <- df6$df5.CntTotalList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$linkcount2 <- flexdashboard::renderGauge({
  value1 <- df6$df3.CntLinkList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain2)
  gaugerate <- df6$df3.CntLinkList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$desccount2 <- flexdashboard::renderGauge({
  value1 <- df6$df2.CntDescrList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain2)
  gaugerate <- df6$df2.CntDescrList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$titlecount2 <- flexdashboard::renderGauge({
  value1 <- df6$df4.CntTitleList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain2)
  gaugerate <- df6$df4.CntTitleList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
##################################################DASHBOARD COLUMN CONTROLS##################################################
##################################################DASHBOARD COLUMN CONTROLS##################################################
output$rankavg3 <- flexdashboard::renderGauge({
  value1 <- df$RankList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df$DomainList == input$domain3)
  gaugerate <- df$RankList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'R', gaugeSectors(
    success = c(b, c), warning = c(d,e), danger  = c(a, f)
  ))
})
output$counttotal3 <- flexdashboard::renderGauge({
  value1 <- df6$df5.CntTotalList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain3)
  gaugerate <- df6$df5.CntTotalList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$linkcount3 <- flexdashboard::renderGauge({
  value1 <- df6$df3.CntLinkList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain3)
  gaugerate <- df6$df3.CntLinkList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$desccount3 <- flexdashboard::renderGauge({
  value1 <- df6$df2.CntDescrList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain3)
  gaugerate <- df6$df2.CntDescrList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
output$titlecount3 <- flexdashboard::renderGauge({
  value1 <- df6$df4.CntTitleList
  a<-max(value1)
  b<-min(value1)
  c<-(a-b)/3
  d<-c*2
  e<-c+.1
  f<-d+.1
  value <-which(df6$df2.DomainList == input$domain3)
  gaugerate <- df6$df4.CntTitleList[value]
  gauge(round(gaugerate,digits=2), min = b, max = a, symbol = 'Cnt', gaugeSectors(
    success = c(f, a), warning = c(e, d), danger = c(b, c)
  ))
})
##################################################DASHBOARD COLUMN CONTROLS##################################################
output$domainselected <- renderInfoBox({
  infoBox(
    "Domain Selected", paste0(input$domain), icon = icon("google"),
    color = "black"
  )
})
output$domainselected1 <- renderInfoBox({
  infoBox(
    "Domain Selected", paste0(input$domain), icon = icon("google"),
    color = "black"
  )
})
##################################################DATE TABLE ONLY###########################################################
output$dt = DT::renderDataTable({
  df7
})

############################################################################################################################

