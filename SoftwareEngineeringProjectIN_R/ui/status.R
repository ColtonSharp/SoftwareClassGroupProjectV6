tabPanel("Status",
         fluidRow(
           column(4,box( width = 12, status = "danger", title = "Primary Factors", background = "black", solidHeader = TRUE,
           box( width = 12, background = "black", title = "Prime Interest Rate", status = "danger", solidHeader= TRUE, infoBoxOutput("statusValueBoxPrimeInterestRate")),
           box( width = 12, background = "black", title = "Federal Interest Rate", status = "danger", solidHeader= TRUE, infoBoxOutput("statusValueBoxFederalRate")),
           box( width = 12, background = "black", title = "Mortgage Interest Rate", status = "danger", solidHeader= TRUE, infoBoxOutput("statusValueBoxMortgageRate")),
           box( width = 12, background = "black", title = "Unemployment Rate", status = "danger", solidHeader= TRUE, infoBoxOutput("statusValueBoxUnemployment")),
           box( width = 12, background = "black", title = "Debt to Income Ratio", status = "danger", solidHeader= TRUE, infoBoxOutput("statusValueBoxDebtIncomeRatio")))),
           
           column(4,box( width = 12, status = "danger", title = "Secondary Factors", background = "black", solidHeader = TRUE,
           box( width = 12, background = "black", status = "danger", title = "Profitability Index", solidHeader= TRUE, infoBoxOutput("statusValueProfitabilityIndex")),
           box( width = 12, background = "black", status = "danger", title = "Financial Stress Index", solidHeader= TRUE, infoBoxOutput("statusValueBoxFSI")),
           box( width = 12, background = "black", status = "danger", title = "National HPI", solidHeader= TRUE, infoBoxOutput("statusValueBoxNationalHPI")),
           box( width = 12, background = "black", status = "danger", title = "Mortgage Debt", solidHeader= TRUE, infoBoxOutput("statusValueBoxMortgageDebt")),
           box( width = 12, background = "black", status = "danger", title = "Vacancy Rate", solidHeader= TRUE, infoBoxOutput("statusValueBoxVacancyRate")))),
           
           column(4,box( width = 12, status = "danger", title = "Competing Markets", background = "black", solidHeader = TRUE,
           box( width = 12, background = "black", status = "danger", title = "Stock Market", solidHeader= TRUE, infoBoxOutput("statusValueBoxDowJones")),
           box( width = 12, background = "black", status = "danger", title = "Precious Metals", solidHeader= TRUE, infoBoxOutput("statusValueBoxSilver")),
           box( width = 12, background = "black", status = "danger", title = "Precious Minerals", solidHeader= TRUE, infoBoxOutput("statusValueBoxOil")),
           box( width = 12, background = "black", status = "danger", title = "Petroleum", solidHeader= TRUE, infoBoxOutput("statusValueBoxPetroleum"))))
           
         )
) #tabPanel end
