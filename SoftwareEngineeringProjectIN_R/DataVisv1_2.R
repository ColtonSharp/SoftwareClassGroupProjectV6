
# # or just readxl
#install.packages("readxl")
#install.packages("plotly")
#install.packages("ggplot2")
############################################LOAD ALL PACKAGES###############################################
############################################LOAD ALL PACKAGES###############################################
############################################LOAD ALL PACKAGES###############################################
library("readxl")
library("plotly")
library("ggplot2")




############################################LOAD ALL DATA FILES###############################################
############################################LOAD ALL DATA FILES###############################################
############################################LOAD ALL DATA FILES###############################################
my_data <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List")
head(my_data)

Keyword <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(1))
Rank <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "numeric", range = cell_cols(2))
Title <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(3))
Description <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(4))
Link <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(5))
Count_Link <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "numeric", range = cell_cols(6))
Count_Description <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "numeric", range = cell_cols(7))
Count_Title <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "numeric", range = cell_cols(8))
Count_Total <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "numeric", range = cell_cols(9))
Domain_Only <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(10))
Ip_Address <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(11))
Key_Word_Key <- read_excel("/Users/Sharp_Col/PycharmProjects/SoftwareClassGroupProject/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List",col_types = "text", range = cell_cols(11))

head(Rank)


RankList <- as.array(Rank$Rank)
DomainList <- as.array(Domain_Only$`Domain Only`)
CntTotalList <- as.array(Count_Total$`Count Total`)
CntLinkList <- as.array(Count_Link$`Count Link`)
CntDescrList <- as.array(Count_Description$`Count Description`)
CntTitleList <- as.array(Count_Title$`Count Title`)



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

DomainRankBarChart

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

DomainRankScatterPlot


data <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)


DomainCountGroupedBarGraph <- plot_ly(data, x = ~CntTotalList, y = ~DomainList, type = 'bar',orientation = 'h', name = 'Count Total') %>%
  add_trace(x = ~CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraph
RankList <- as.array(my_data$Rank)
DomainList <- as.array(my_data$`Domain Only`)


df <- data.frame(DomainList, RankList)
#aggregate( RankList ~ DomainList, df, mean)
df <- aggregate( RankList ~ DomainList, df, mean)
which(df$DomainList == "verdurefitness.com")

df$RankList[9]



df2 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df2 <-aggregate( CntDescrList ~ DomainList, df2, sum)

df3 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df3 <-aggregate( CntLinkList ~ DomainList, df3, sum)
df4 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df4 <-aggregate( CntTitleList ~ DomainList, df4, sum)
df5 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df5 <-aggregate( CntTotalList ~ DomainList, df5, sum)


df6 <- data.frame(df2$DomainList,df2$CntDescrList,df3$CntLinkList,df4$CntTitleList,df5$CntTotalList,df$RankList)
df6


value <- df6$df5.CntTotalList
a<-max(value)
b<-min(value)
c<-(a-b)/3
d<-c*2
e<-c+.1
f<-d+.1


df7 <- df6 %>% filter(df5.CntTotalList >= 18)
df7



DomainRankBarChartCompOnly <- plot_ly(type = 'bar',x = df7$df.RankList, y = df7$df2.DomainList, orientation = 'h', #mode = 'markers',
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

DomainRankScatterPlotCompOnly <- plot_ly(type = 'scatter',x = df7$df.RankList, y = df7$df2.DomainList, orientation = 'h', mode = 'markers',
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

DomainCountGroupedBarGraphCompOnly <- plot_ly(datacomponly, x = ~df7$df5.CntTotalList, y = ~df7$df2.DomainList, type = 'bar',orientation = 'h', name = 'Count Total'
) %>%
  add_trace(x = ~df7$df3.CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~df7$df2.CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~df7$df4.CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraphCompOnly

DomainCountGroupedBarGraphTopThree <- plot_ly(datacomponly, x = ~df7$df5.CntTotalList, y = ~df7$df2.DomainList, type = 'bar',orientation = 'h', name = 'Count Total'
) %>%
  add_trace(x = ~df7$df3.CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~df7$df2.CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~df7$df4.CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraphTopThree





value <- df6$df5.CntTotalList
a<-max(value)
b<-min(value)
c<-(a-b)/3
d<-c*2
e<-c+.1
f<-d+.1
df7 <- df6 %>% filter(df5.CntTotalList >= 18)
df7

selecteddomain <- df6 %>% filter(df5$DomainList == "verdurefitness.com")
selecteddomain

df7ordered <- df7[order(df7$df.RankList),]
df7ordered
df7ordered <- df7ordered[1:3,]
df7ordered

df7ordered[1:3,]$df5.CntTotalList

datatop3 <- data.frame(df7ordered$df2.DomainList,df7ordered$df5.CntTotalList,df7ordered$df3.CntLinkList,df7ordered$df2.CntDescrList,df7ordered$df4.CntTitleList)

DomainCountGroupedBarGraphTopThree <- plot_ly(datatop3, x = ~df7ordered$df5.CntTotalList, y = ~df7ordered$df2.DomainList, type = 'bar',orientation = 'h', name = 'Count Total'
) %>%
  add_trace(x = ~df7ordered$df3.CntLinkList, name = 'Count Link') %>%
  add_trace(x = ~df7ordered$df2.CntDescrList, name = 'Count Description') %>%
  add_trace(x = ~df7ordered$df4.CntTitleList, name = 'Count Title') %>%
  layout(barmode = 'group',title = "Domain By Count", xaxis = list(title = "Count"),yaxis = list(title = "Domain Name"))

DomainCountGroupedBarGraphTopThree






selecteddomain <- df6 %>% filter(df5$DomainList == "verdurefitness.com")
df7ordered <- df7[order(df7$df.RankList),]
df7ordered <- df7ordered[1:3,]
value1 <- selecteddomain$df5.CntTotalList
value1
value2 <- df7ordered[1,]$df5.CntTotalList
value2
if (value1 <= value2){
a <- abs(value1 - value2)
a <- a/value2
a <- (a * 100)
counttotal <- a
a
}else if (value1 >= value2){
  a <- abs(value1 - value2)
  a <- a/value1
  a <- (a * 100)*(-1)
  counttotal <- a
  a
} else if (value1 == value2){
  counttotal <- 0
}
value1 <- selecteddomain$df.RankList
value1
value2 <- df7ordered[1,]$df.RankList
value2
#a <- abs(value1 - value2)
#a <- (a * 10)
if (value1 >= value2){
  a <- abs(value1 - value2)
  a <- (a * 10)
  ranking <- a
  a
}else if (value1 <= value2){
  
  ranking <- "Top Competitor"
  
}
value1 <- selecteddomain$df2.CntDescrList
value1
value2 <- df7ordered[1,]$df2.CntDescrList
value2
if (value1 <= value2){
  a <- abs(value1 - value2)
  a <- a/value2
  a <- (a * 100)
  descr <- a
  a
}else if (value1 >= value2){
  a <- abs(value1 - value2)
  a <- a/value1
  a <- (a * 100)*(-1)
  descr <- a
  a
} else if (value1 == value2){
  descr <- 0
}
value1 <- selecteddomain$df3.CntLinkList
value1
value2 <- df7ordered[1,]$df3.CntLinkList
value2
if (value1 <= value2){
  a <- abs(value1 - value2)
  a <- a/value2
  a <- (a * 100)
  linking <- a
  a
}else if (value1 >= value2){
  a <- abs(value1 - value2)
  a <- a/value1
  a <- (a * 100)*(-1)
  linking <- a
  a
} else if (value1 == value2){
  linking <- 0
}
value1 <- selecteddomain$df4.CntTitleList
value1
value2 <- df7ordered[1,]$df4.CntTitleList
value2
if (value1 <= value2){
  a <- abs(value1 - value2)
  a <- a/value2
  a <- (a * 100)
  titleing <- a
  a
}else if (value1 >= value2){
  a <- abs(value1 - value2)
  a <- a/value1
  a <- (a * 100)*(-1)
  titleing <- a
  a
} else if (value1 == value2){
  titleing <- 0
}
counttotal
ranking
descr
linking
titleing








