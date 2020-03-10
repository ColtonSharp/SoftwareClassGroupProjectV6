DomainRankBarChartMain <- plot_ly(type = 'bar',x = RankList, y = DomainList, orientation = 'h',width = 1000,height = 1000,
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

DomainRankBarChartMain
