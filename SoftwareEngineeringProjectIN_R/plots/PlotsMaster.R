DomainRankScatterPlot <- plot_ly(type = 'scatter',x = RankList, y = DomainList, orientation = 'h', mode = 'markers',
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


DomainRankBarChart <- plot_ly(type = 'bar',x = RankList, y = DomainList, orientation = 'h', #mode = 'markers',
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

data <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)

DomainCountGroupedBarGraph <- plot_ly(data, x = ~CntTotalList, y = ~DomainList, type = 'bar',orientation = 'h', name = 'Count Total'
                                      ) %>%
  add_trace(x = ~CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraph


DomainRankBarChartCompOnly <- plot_ly(type = 'bar',x = df7$df.RankList, y = df7$df2.DomainList, orientation = 'h',width = 1000,height = 1000,
                                      transforms = list(
                                        list(
                                          type = 'aggregate',
                                          groups = df7$df2.DomainList,
                                          aggregations = list(
                                            list(
                                              target = 'y', func = 'avg', enabled = T
                                            )
                                          )
                                        )
                                      )
)%>%
  layout(title = "Domain By Rank", xaxis = list(title = "Rank"),yaxis = list(title = "Domain Name"))

DomainRankBarChartCompOnly

DomainRankScatterPlotCompOnly <- plot_ly(type = 'scatter',x = df7$df.RankList, y = df7$df2.DomainList, orientation = 'h', mode = 'markers',width = 1000,height = 1000,
                                         transforms = list(
                                           list(
                                             type = 'aggregate',
                                             groups = df7$df2.DomainList,
                                             aggregations = list(
                                               list(
                                                 target = 'y', func = 'avg', enabled = T
                                               )
                                             )
                                           )
                                         )
)%>%
  layout(title = "Domain By Rank", xaxis = list(title = "Rank"),yaxis = list(title = "Domain Name"))

DomainRankScatterPlotCompOnly

datacomponly <- data.frame(df7$df2.DomainList,df7$df5.CntTotalList,df7$df3.CntLinkList,df7$df2.CntDescrList,df7$df4.CntTitleList)

DomainCountGroupedBarGraphCompOnly <- plot_ly(datacomponly, x = ~df7$df5.CntTotalList, y = ~df7$df2.DomainList, type = 'bar',orientation = 'h', name = 'Count Total',width = 1000,height = 1000
) %>%
  add_trace(x = ~df7$df3.CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~df7$df2.CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~df7$df4.CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraphCompOnly