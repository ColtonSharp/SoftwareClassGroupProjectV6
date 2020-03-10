DomainRankScatterPlotMain <- plot_ly(type = 'scatter',x = RankList, y = DomainList, orientation = 'h', mode = 'markers',width = 1000,height = 1000,
                                 transforms = list(
                                   list(
                                     type = 'aggregate',
                                     groups = DomainList,
                                     aggregations = list(
                                       list(
                                         target = 'y', func = 'avg', enabled = T
                                       )
                                     )
                                   )
                                 )
)%>%
  layout(title = "Domain By Rank", xaxis = list(title = "Rank"),yaxis = list(title = "Domain Name"))
