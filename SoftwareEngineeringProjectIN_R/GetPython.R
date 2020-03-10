library(shinydashboard)

ui <- dashboardPage(skin = "green",
                    dashboardHeader(title = "Google Search Results"),
                    dashboardSidebar(
                      
                      sidebarMenu(
                        menuItem("Get Files", tabName = "dashboard", icon = icon("dashboard"))
                        
                        
                      )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(width = 12,title="Important Information Read Me",status = "warning", solidHeader = TRUE, collapsible = TRUE,
                    box(width=8, height=300,
                        
                        h1("Software Engineering Class CDIM 6330-70"),
                        h2("Search Engine Ompitmization Tool"),
                        h4("Colton Sharp"),
                        h4("Input Name Here"),
                        h4("Input Name Here"),
                        h4("Input Name Here"),
                        h4("Input Name Here")
                    ),
                    box(width=4, height=300,tags$img(src="https://images.pexels.com/photos/267415/pexels-photo-267415.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", height="100%", width="100%") ),
                    
                    
                    box(width = 12,title="Files Needed",status = "warning", solidHeader = TRUE,
                        textInput("keyword", "Keyword File Path:"),
                        textInput("blankfile", "Blank File Path:"),
                        textInput("masterfile", "Database File Path:"),
                        textInput("pivotfile", "Pivot Table File Path:"),
                        textInput("domain", "Domain Used By Goole i.e www.example.com:"),
                        actionButton("submit", "Submit File Paths"))
                )
              )
              )
      
    )
  )
)

server <- function(input, output) {
  
  
}
shinyApp(ui, server)
