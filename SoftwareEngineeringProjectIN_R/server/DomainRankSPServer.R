output$DomainRankScatterPlot <- renderPlotly(DomainRankScatterPlot)
#   {
#   
#   # If the LM checkbox in the sidebar is set to true, it will display the linear model graph.
#   if(input$loansTRadio == "loansTypeRadio")
#   { loansByTypePlot
#     
#   }
#   # If it is false, it will display the normal graph of mortgage debt outstanding.
#   else if (input$loansTRadio == "lmLoansTypeRadio")
#     loansByTypePlot %>% add_lines(x = ~MonthID, y = fitted(fitLoanType), name = "Linear Model", color = I("white"))
#   
# }
  
#)

# output$loansByTypeTable <- renderDataTable(
#   
#   loansByType)
