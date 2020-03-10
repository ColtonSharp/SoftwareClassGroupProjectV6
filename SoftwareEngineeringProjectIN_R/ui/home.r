tabPanel("Home", value = "home",
         
         sidebarLayout(
           sidebarPanel(id = "sidebar", style = "position: fixed; width:25%;",
                        tags$a(href = "#intro", "Introduction"),
                        br(),
                        tags$a(href = "#features", "Features")
           ),
           mainPanel(
             tags$section( id = "intro",
                           h1("Introduction"),
                           p("In an effort to avoid experiencing another financial crisis, the development of a system that will serve to assist the recognition of 
                             conditions that may lead to financial troubles indicated by certain factors that this capstone group has 
                             deemed significant by statistical data represented in the project models in the application. This application 
                             will alert the financial sectors of the government and private enterprises of the financial market. 
                             This capstone group will allow the financial sectors a three month alert time to self correct for potential
                             increases and decreases in the relevant markets that lead to mortgage defaultment. ")
                                        ),
                          br(),
                          tags$section( id = "features",
                                        h3("Features"),
                                        p("The primary feature of the application will alert the financial sectors of the government and private enterprises of the financial market. 
                                          This capstone group will allow the financial sectors a three month alert time to self correct for potential increases 
                                          and decreases in the relevant markets that lead to mortgage defaultment. This three month alert time will allow relevant 
                                          financial sectors or mortgage investors to self correct based on prime interest rate changes, the Dow Jones opening and
                                          closing daily averages, credit card debt outstanding, auto loan debt outstanding, and student loan debt outstanding. 
                                          These prime indicators are the driving forces of mortgage loans defaultment and inability to pay back loans regardless 
                                          of loan classification.    ")
                                        )
                    )
    )
)