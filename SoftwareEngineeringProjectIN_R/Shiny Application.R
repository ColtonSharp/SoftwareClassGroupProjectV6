
library(shiny)
library(data.table)
library(RMySQL)
library(ggplot2)
library(lubridate)
library(plotly)
library(forecast)
library(flexdashboard)
library(shinydashboard)
library(shinyjs)
library(DT)

# Connect to the database and retrieve data
source(file.path("data", "LoadDataBase.r"),  local = TRUE)$value
source(file.path("data", "DataVisv1_2.r"),  local = TRUE)$value
source(file.path("server", "MasterServerFunction.r"),  local = TRUE)$value
# Connect to the PLOT and retrieve data

source(file.path("plots", "PlotsMaster.r"),  local = TRUE)$value
source(file.path("plots", "DomainCountGBC.r"),  local = TRUE)$value
source(file.path("plots", "DomainRankBC.r"),  local = TRUE)$value
source(file.path("plots", "DomainRankSP.r"),  local = TRUE)$value
df <- data.frame(DomainList, RankList)
#aggregate( RankList ~ DomainList, df, mean)
df <- aggregate( RankList ~ DomainList, df, mean)
df2 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df2 <-aggregate( CntDescrList ~ DomainList, df2, sum)

df3 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df3 <-aggregate( CntLinkList ~ DomainList, df3, sum)
df4 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df4 <-aggregate( CntTitleList ~ DomainList, df4, sum)
df5 <- data.frame(DomainList, CntTotalList, CntLinkList,CntDescrList,CntTitleList)
df5 <-aggregate( CntTotalList ~ DomainList, df5, sum)


df6 <- data.frame(df2$DomainList,df2$CntDescrList,df3$CntLinkList,df4$CntTitleList,df5$CntTotalList,df$RankList)
df7 <- df6 %>% filter(df5.CntTotalList >= 18)
df7

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



## ui.R ##
library(shinydashboard)
library(shiny)


dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)




## app.R ##

ui <- dashboardPage(skin = "green",
  dashboardHeader(title = "Google Search Results"),
  dashboardSidebar(
    
    sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Results", tabName = "Results", icon = icon("th"))
   

  )),
  ## Body content
  dashboardBody(
    includeCSS("www/style2.css"),
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                #box(plotlyOutput("plot1"), width=6, height=500),
                #box(plotlyOutput("plot2"), width=6, height=500),
                #box(plotlyOutput("plot3"), width=6, height=500),
                 box(id = "domainselected",width = 12,infoBoxOutput("domainselected",width = 12)),
              box(width = 12,title="SEO  Competition Statistics",status = "success", solidHeader = TRUE, collapsible = TRUE,  collapsed = TRUE,
              #########################################COLUMN###################################
                column(width = 3, box(
                  title = "Domain Selected", status = "success", solidHeader = TRUE,
                  collapsible = TRUE, width=12, 
                  selectInput("domain", "Domain Selector",
                              choices = c(df$DomainList),
                              selected = "verdurefitness.com"
                  )),
                box(
                  flexdashboard::gaugeOutput("rankavg"),width= 12 ,title="Average SEO Ranking ",status = "success", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your average ranking based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("counttotal"),width= 12,title="Total Count",status = "success", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("linkcount"),width= 12 ,title="Link Count",status = "success", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your total link count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("desccount"),width= 12,title="Description Count",status = "success", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total description count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("titlecount"),width= 12,title="Title Count",status = "success", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total title count of keywords matched based on the keywords file provided.")
              ),
              #########################################COLUMN###################################
              #########################################COLUMN###################################
              column(width = 3, box(
                title = "Domain Selector", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, width=12,
                selectInput("domain1", "Domain Selector",
                            choices = c(df$DomainList)
                )),
                box(
                  flexdashboard::gaugeOutput("rankavg1"),width= 12 ,title="Average SEO Ranking ",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your average ranking based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("counttotal1"),width= 12,title="Total Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("linkcount1"),width= 12 ,title="Link Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your total link count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("desccount1"),width= 12,title="Description Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total description count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("titlecount1"),width= 12,title="Title Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total title count of keywords matched based on the keywords file provided.")
              ),
              #########################################COLUMN###################################
              #########################################COLUMN###################################
              column(width = 3, box(
                title = "Domain Selector", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, width=12,
                selectInput("domain2", "Domain Selector",
                            choices = c(df$DomainList)
                )),
                box(
                  flexdashboard::gaugeOutput("rankavg2"),width= 12 ,title="Average SEO Ranking ",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your average ranking based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("counttotal2"),width= 12,title="Total Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("linkcount2"),width= 12 ,title="Link Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your total link count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("desccount2"),width= 12,title="Description Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total description count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("titlecount2"),width= 12,title="Title Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total title count of keywords matched based on the keywords file provided.")
              ),
              #########################################COLUMN###################################
              #########################################COLUMN###################################
              column(width = 3, box(
                title = "Domain Selector", status = "primary", solidHeader = TRUE,
                collapsible = TRUE, width=12,
                selectInput("domain3", "Domain Selector",
                            choices = c(df$DomainList)
                )),
                box(
                  flexdashboard::gaugeOutput("rankavg3"),width= 12 ,title="Average SEO Ranking ",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your average ranking based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("counttotal3"),width= 12,title="Total Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("linkcount3"),width= 12 ,title="Link Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE, footer = "This is your total link count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("desccount3"),width= 12,title="Description Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total description count of keywords matched based on the keywords file provided."),
                box(
                  flexdashboard::gaugeOutput("titlecount3"),width= 12,title="Title Count",status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,footer = "This is your total title count of keywords matched based on the keywords file provided.")
              )
              #########################################COLUMN###################################
              ),##################END OF COMP LIST BOX############
              box(width = 12,title="Main Graphs",status = "primary", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  tabBox(
                    title = "Noteable Graphs",
                    # The id lets us use input$tabset1 on the server to find the current tab
                    id = "tabset1", width = 12,height = 1200,
                    tabPanel("Count of Keyword Matched",  box(width=12,height = 1100,
                                          plotlyOutput("gbc"))),
                    tabPanel("Domain Ranking Bar Graph", box(width=12,height = 1100,
                                         plotlyOutput("bc"))),
                    tabPanel("Domain Ranking Scatter Plot", box(width=12,height = 1100,
                                         plotlyOutput("sp")))
                  )    ),
              box(width = 12,title="Competitors To Look At",status = "primary", solidHeader = TRUE, collapsible = TRUE,collapsed = TRUE,
                  tabBox(
                    title = "Noteable Graphs and Data",
                    # The id lets us use input$tabset1 on the server to find the current tab
                    id = "tabset1", width = 12,height = 1200,
                    tabPanel("Count of Keyword Matched",  box(width=12,height = 1100,
                                                              plotlyOutput("gbccomp"))),
                    tabPanel("Domain Ranking Bar Graph", box(width=12,height = 1100,
                                                             plotlyOutput("bccomp"))),
                    tabPanel("Domain Ranking Scatter Plot", box(width=12,height = 1100,
                                                                plotlyOutput("spcomp"))),
                    tabPanel("Data Table Top Competition Only", box(width=12,height = 1100,h2("Top Competition"),
                                                                    DT::dataTableOutput("dt")))
                  )
                     ),
              box(width = 12,title="Important Information Read Me",status = "warning", solidHeader = TRUE, collapsible = TRUE,
                  box(width=8, height=300,
                      
                      h1("Software Engineering Class CDIM 6330-70"),
                      h2("Search Engine Ompitmization Tool"),
                      h4("Colton Sharp"),
                      h4("Nirmala Narasimhan"),
                      h4("Elizabeth Swearingen"),
                      h4("Nicholas Aguilera"),
                      h4("Huong Thang")
                  ),
                  box(width=4, height=300,tags$img(src="https://images.pexels.com/photos/267415/pexels-photo-267415.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", height="100%", width="100%") ),
                  
                  box(width=12, height=400,
                      h1("SEO Competition Statistics"),
                      p("SEO Competition Statistics - has four columns in it, the domain you wish to choose is the first column or the column that is green. This column will indicate all the domains that you are trying to get more information about. You can use the next three columns to start comparing outliers, find why a domain did not make it in the top competition list, and start to see where your domain is failing or succeeding. "),
                      h1("Main Graphs"),
                      p("Main Graphs - has three graphs that contain all the information found by google and “Main Graphs” includes all data found. "),
                      h1("Competitors To Look At"),
                      p("Competitors To Look At - has everything that “Main Graphs” does; however it only has data that is directly competing with the selected domain. If you do not find the selected domain within these graphs or the included data table. The selected domain does not meet standards for top competitors and you should reference back to “SEO Competition Statistics” and “Main Graphs” to look for the reasons why.")
                      )
                 
              )
              
              )
              
      ),
      tabItem(tabName = "Results",
              fluidRow(
              box(width = 12,title="Results Found",status = "primary", solidHeader = TRUE, collapsible = TRUE,
               box(id = "domainselected",width = 12,infoBoxOutput("domainselected1",width = 12)),  
                
              box(
                flexdashboard::gaugeOutput("rankdiff1"),width= 4 ,title="Percent Difference Ranking",status = "success", solidHeader = TRUE,
                collapsible = TRUE, footer = "This is your percent difference between the selected domain and the top ranking domain - Ranking."),
              box(
                flexdashboard::gaugeOutput("rankdiff2"),width= 4,title="Percent Difference Total Count",status = "success", solidHeader = TRUE,
                collapsible = TRUE,footer = "This is your percent difference between the selected domain and the top ranking - Total Count."),
              box(
                flexdashboard::gaugeOutput("rankdiff3"),width= 4 ,title="Percent Difference Link Count",status = "success", solidHeader = TRUE,
                collapsible = TRUE, footer = "This is your percent difference between the selected domain and the top ranking domain - Link Count."),
              box(
                flexdashboard::gaugeOutput("rankdiff4"),width= 4,title="Percent Difference Description Count",status = "success", solidHeader = TRUE,
                collapsible = TRUE,footer = "This is your percent difference between the selected domain and the top ranking domain - Link Count."),
              box(
                flexdashboard::gaugeOutput("rankdiff5"),width= 4,title="Percent Difference Title Count",status = "success", solidHeader = TRUE,
                collapsible = TRUE,footer = "This is your percent difference between the selected domain and the top ranking domain - Title Count."),
              box(width = 12,title="What To Change", status = "info", solidHeader = TRUE, collapsible = TRUE,
                  h1("Improve Your Ranking Today"),
                  p("Above there are five boxes that will tell you where you stand in the SEO ranking currently - if there is orange or red tiles above these are the counts that need to be changed. Above you will see the percent of words that neeed to be added to the appropreiate categories. If you will focus your efferts on these categories will will have a better chance of scoring higher next time after the changes are made.")
                  
                  )
              
              ))
      ),
     
      tabItem(tabName = "AboutUs",
              
              box(width=8, height=300,
                  
                  h1("Software Engineering Class CDIM 6330-70"),
                  h2("Search Engine Ompitmization Tool"),
                  h4("Colton Sharp"),
                  h4("Input Name Here"),
                  h4("Input Name Here"),
                  h4("Input Name Here"),
                  h4("Input Name Here")
              ),
              box(width=4, height=300,tags$img(src="https://images.pexels.com/photos/267415/pexels-photo-267415.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", height="100%", width="100%") )
      )
    )
  )
)

server <- function(input, output) {
  source(file.path("server", "MasterServerFunction.r"),  local = TRUE)$value
  
  output$rankdiff1 <- flexdashboard::renderGauge({
    selecteddomain <- df6 %>% filter(df5$DomainList == input$domain)
    df7ordered <- df7[order(df7$df.RankList),]
    df7ordered <- df7ordered[1:3,]
    value1 <- selecteddomain$df.RankList
    value2 <- df7ordered[1,]$df.RankList
    a <- abs(value1 - value2)
    a <- (a * 10)
    gaugerate <- a
    gauge(round(gaugerate,digits=2), min = 0, max = 100, symbol = '%', gaugeSectors(
      success = c(33, 0), warning = c(66, 33.1), danger = c(66.1, 100)
      
    ))
  })
  output$rankdiff2 <- flexdashboard::renderGauge({
    selecteddomain <- df6 %>% filter(df5$DomainList == input$domain)
    df7ordered <- df7[order(df7$df.RankList),]
    df7ordered <- df7ordered[1:3,]
    value1 <- selecteddomain$df5.CntTotalList
    value2 <- df7ordered[1,]$df5.CntTotalList
    if (value1 <= value2){
      a <- abs(value1 - value2)
      a <- a/value2
      a <- (a * 100)
      a
    }else if (value1 >= value2){
      a <- abs(value1 - value2)
      a <- a/value1
      a <- (a * 100)*(-1)
      a
    } else if (value1 == value2){
      a <- 0
    }
    gaugerate <- a
    gauge(round(gaugerate,digits=2), min = -100, max = 100, symbol = '%', gaugeSectors(
      success = c(-100, 0), warning = c(.1, 30), danger = c(30.1, 100)
      
    ))
  })
  output$rankdiff3 <- flexdashboard::renderGauge({
    selecteddomain <- df6 %>% filter(df5$DomainList == input$domain)
    df7ordered <- df7[order(df7$df.RankList),]
    df7ordered <- df7ordered[1:3,]
    value1 <- selecteddomain$df3.CntLinkList
    value2 <- df7ordered[1,]$df3.CntLinkList
    if (value1 <= value2){
      a <- abs(value1 - value2)
      a <- a/value2
      a <- (a * 100)
      a
    }else if (value1 >= value2){
      a <- abs(value1 - value2)
      a <- a/value1
      a <- (a * 100)*(-1)
      a
    } else if (value1 == value2){
      a <- 0
    }
    gaugerate <- a
    gauge(round(gaugerate,digits=2), min = -100, max = 100, symbol = '%', gaugeSectors(
      success = c(-100, 0), warning = c(.1, 30), danger = c(30.1, 100)
      
    ))
  })
  output$rankdiff4 <- flexdashboard::renderGauge({
    selecteddomain <- df6 %>% filter(df5$DomainList == input$domain)
    df7ordered <- df7[order(df7$df.RankList),]
    df7ordered <- df7ordered[1:3,]
    value1 <- selecteddomain$df2.CntDescrList
    value2 <- df7ordered[1,]$df2.CntDescrList
    if (value1 <= value2){
      a <- abs(value1 - value2)
      a <- a/value2
      a <- (a * 100)
      a
    }else if (value1 >= value2){
      a <- abs(value1 - value2)
      a <- a/value1
      a <- (a * 100)*(-1)
      a
    } else if (value1 == value2){
      a <- 0
    }
    gaugerate <- a
    gauge(round(gaugerate,digits=2), min = -100, max = 100, symbol = '%', gaugeSectors(
      success = c(-100, 0), warning = c(.1, 30), danger = c(30.1, 100)
      
    ))
  })
  output$rankdiff5 <- flexdashboard::renderGauge({
    selecteddomain <- df6 %>% filter(df5$DomainList == input$domain)
    df7ordered <- df7[order(df7$df.RankList),]
    df7ordered <- df7ordered[1:3,]
    value1 <- selecteddomain$df4.CntTitleList
    value2 <- df7ordered[1,]$df4.CntTitleList
    if (value1 <= value2){
      a <- abs(value1 - value2)
      a <- a/value2
      a <- (a * 100)
      a
    }else if (value1 >= value2){
      a <- abs(value1 - value2)
      a <- a/value1
      a <- (a * 100)*(-1)
      a
    } else if (value1 == value2){
      a <- 0
    }
    gaugerate <- a
    gauge(round(gaugerate,digits=2), min = -100, max = 100, symbol = '%', gaugeSectors(
      success = c(-100, 0), warning = c(.1, 30), danger = c(30.1, 100)
      
    ))
  })
  
  
}

shinyApp(ui, server)

