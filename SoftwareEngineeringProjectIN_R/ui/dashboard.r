tabPanel("Dashboard",
  tabsetPanel(
    tabPanel("Dashboard 1",
             fluidRow(
               plotlyOutput("DomainRankSP", height = 'auto', width = 'auto' )
             ),
         fluidRow(
           column(12, box( width = 12,
             title = "Prime Interest, Federal Interest, and Mortgage Rates", background = "light-blue", solidHeader = TRUE,
             plotlyOutput("DomainRankSP", height = 'auto', width = 'auto' )))
           
         ), HTML('<hr style="color: white;">')
    ), #tabPanel end
    
    tabPanel("Dashboard 2",
             fluidRow(
                column(3,box(flexdashboard::gaugeOutput("mortgageDebtGauge"),width= 12,title="Mortgage Debt")),
                column(3,box(flexdashboard::gaugeOutput("nationalHPIGauge"),width= 12,title="National HPI")),
                column(3,box( width = 12,
                             infoBoxOutput("dashboardValueBoxMortgageDebt"),br()
                             ,actionButton("showMortgageDebt", "Summary"))),
                column(3,box( width = 12,
                               infoBoxOutput("dashboardNationalHPIValueBox"),br()
                               ,actionButton("showNationalHPI", "Summary")))
               ),
         fluidRow(
           column(12, box( width = 12,
                           title = "Mortgage Debt and National HPI", background = "light-blue", solidHeader = TRUE,plotlyOutput("dashboardDebtHPIPlot")) #combine hpi
         )),

         
         HTML('<hr style="color: white;">')
         ), #tabPanel end
    tabPanel("Dashboard 3",
             fluidRow(
               column(3,box( width = 12,
                             infoBoxOutput("dashboardMortgageLoans"),br()
                             ,actionButton("showMortgageLoans", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("dashboardCreditCardLoans"),br()
                               ,actionButton("showCreditCardLoans", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("dashboardAutoLoans"),br()
                               ,actionButton("showAutoLoans", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("dashboardStudentLoans"),br()
                               ,actionButton("showStudentLoans", "Summary")
               )
               )
             ),
         fluidRow(
           column(3,box(flexdashboard::gaugeOutput("mortgageLoansGauge"),width= 12,title="Mortgage")),
           column(3,box(flexdashboard::gaugeOutput("creditCardLoansGauge"),width= 12,title="Credit Card")),
           column(3,box(flexdashboard::gaugeOutput("autoLoansGauge"),width= 12,title="Automotive")),
           column(3,box(flexdashboard::gaugeOutput("studentLoansGauge"),width= 12,title="Student"))
           
         ),
         fluidRow(
           column(12,box( width = 12,
                          title = "Loans by Type", background = "light-blue", solidHeader = TRUE, plotlyOutput("dashboardLoanTypes"))
           
         )),
         
         HTML('<hr style="color: white; ">')
         
    ), #tabPanel end
    
    tabPanel("Dashboard 4",
             fluidRow(
               column(3,box( width = 12,
                             infoBoxOutput("dashUnemploymentValueBox"),br()
                             ,actionButton("showUnemployment", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("dashFSIValueBox"),br()
                               ,actionButton("showFSI", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("approvalBox11"),br()
                               ,actionButton("showDebtIncome", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("approvalBox12"),br()
                               ,actionButton("showVacancyRate", "Summary")
               )
               )
             ),
             fluidRow(
               
               column(3,box(flexdashboard::gaugeOutput("unemploymentRateGauge"),width= 12,title="Unemployment")),
               column(3,box(flexdashboard::gaugeOutput("plt12"),width= 12,title="FSI")),
               column(3,box(flexdashboard::gaugeOutput("plt13"),width= 12,title="Debt-to-Income Ratio")),
               column(3,box(flexdashboard::gaugeOutput("plt14"),width= 12,title="Vacancy Rate"))
               
             ),
             fluidRow(
               column(12, box( width = 12,
                               title = "Unemployment Rate", background = "light-blue", solidHeader = TRUE,plotlyOutput("dashboard4Combination"))
               )),
             HTML('<hr style="color: white; ">')
    ), #tabPanel end
    
    tabPanel("Dashboard 5",
             fluidRow(
               column(3,box( width = 12,
                             infoBoxOutput("approvalBox13"),br()
                             ,actionButton("showDowJones", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("approvalBox14"),br()
                               ,actionButton("showSilver", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("approvalBox15"),br()
                               ,actionButton("showCrudeOil", "Summary")
               )
               ),column(3,box( width = 12,
                               infoBoxOutput("approvalBox16"),br()
                               ,actionButton("showPetroleum", "Summary")
               )
               )
             ),
             fluidRow(
               
               column(3,box(flexdashboard::gaugeOutput("plt15"),width= 12,title="Dow Jones")),
               column(3,box(flexdashboard::gaugeOutput("plt16"),width= 12,title="Silver")),
               column(3,box(flexdashboard::gaugeOutput("plt17"),width= 12,title="Crude Oil")),
               column(3,box(flexdashboard::gaugeOutput("plt18"),width= 12,title="Petroleum"))
               
             ),
             fluidRow(
               column(12, box( width = 12,
                               title = "Competing Markets", background = "light-blue", solidHeader = TRUE,plotlyOutput("dashboardCompetingMarkets"))
               )),

             HTML('<hr style="color: white; ">')
    ) #tabPanel end
  ) #end tabset
) #end dashboard
