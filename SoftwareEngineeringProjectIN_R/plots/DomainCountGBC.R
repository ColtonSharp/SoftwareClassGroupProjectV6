data <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)

DomainCountGroupedBarGraphMain <- plot_ly(data, x = ~CntTotalList, y = ~DomainList, type = 'bar',orientation = 'h', name = 'Count Total'
,width = 1000,height = 1000) %>%
  add_trace(x = ~CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraphMain






