tabPanel("Help",
         
         sidebarLayout(
           sidebarPanel(id = "sidebar", style = "position: fixed; width:25%;",
                        tags$a(href = "#helpPage", "Help Page"),
                        br(),
                        tags$a(href = "#mainTabs", "Main Tabs"),
                        br(),
                        tags$a(href = "#variables", "Variables"),
                        br(),
                        tags$a(href = "#tools", "Tools")
                        
           ),
           
           
           mainPanel(
             box( width = 12, background = "black", title = "User Manual For Up a Mortgage Alert System", status = "danger", solidHeader= TRUE,
                  tags$section( id = "helpPage",
                                h1("Help Page"),
                                p("This help page entails the interworkings of the application and provides detail and background information on the data being presented and the structure/functions of the system.")
                  ),
                  br(),
                  tags$section( id = "mainPages",
                                h3("Main Pages"),
                                p("This application has six main pages. These pages are located at the bottom left hand side of the user interface."),
                                br(),
                                
                                h4("Home"),
                                p("The home tab gives an introduction to the system and details an overview of the available features of the application."),
                                br(),
                                
                                h4("Status"),
                                p("The status page features three different sections of information. It includes primary and secondary factors, and also competing markets.
                                  The variable in the Primary Factor section includes Prime Interest Rate, Federal Interest Rate, Mortgage Interest Rate, Unemployment Rate, and Debt to Income Ratio
                                  The Secondary Factors variables consists of the Profitability Index, Financial Stress Index, National HPI, and Mortgage Debt.
                                  Variables presented in the Competing Markets section are the Dow Jones Industrial Average, Oil prices, and Petroleum Prices"),
                                br(),
                                
                                h4("Profitability"),
                                p("The Profitability page features several different variables, all adjusted to fit varying types of primes.
                                  Based off of the prime type, the variables within the page changes to estimates that will be a better representation of certain circumstances.
                                  This page also features a calculation system that utilizes a user's input to compile the calculation of variables such as mortgage payment, 
                                  customer debt to income, total loan amount, and total profit to be made based off of the numbers given in the customer information section of the page. 
                                  Also based off of the user input is the computed profitability index and the decision to invest in a given customer or not. "),
                                br(),
                                
                                h4("Dashboard"),
                                p("The Dashboard provides details on key indicators in the financial and housing market. The dashboard includes gauges and status boxes that update accordingly
                                  to the level of risk at a certain point in the graph. The interactive features serve as the warning and gives perspective on the forsight of industry disruption and turmoil. "),
                                br(),
                                
                                h4("Details"),
                                p("The Details page provides the user with numerous variables to examine through graphical representations, linear models, and time series models."),
                                
                                
                                
                                ## Variables Section                           
                                br(),
                                tags$section( id = "variables",
                                              h3("Variables"),
                                              
                                              
                                              p("This application is comprised of a number of different variables that can be utilized to identify early warning signs of an economic downturn that
                                                may negatively impact different markets of interest such as the financial, housing, and mortgage industries. 
                                                The variables presented within this application are ideal data sets that should be monitored and used in predictive models to gain a better insight 
                                                of the past, current, and future state of the financial market. The variables in this application can be informative on both a singular level and a
                                                combined level as well. An overview of the variables and their graphs will be detailed in this section. "),
                                              br(),         
                                              h4("Auto Loans"),
                                              p("Auto Loans represents a loan or a sum of money an individual borrows in order to purchase an automobile. Like other loans, the customer agrees to periodic 
                                                payments totaling to the full amount plus the interest. Many lenders usually check customers' personal information to see if they qualify for an auto loan 
                                                such as financial situation, proof of employment, credit score or any other information showing the consumer has the ability to pay back loans in a timely 
                                                manner. The data shows a relatively stable trend that started to decrease in the years of 2008 and 2009. After this subtle decrease, the data starts to 
                                                gradually increase yearly. (The credit card loan numbers starts to increase at somewhat similar intervals). This signifies that more auto loans are being 
                                                issued as it is gradually becoming more available over the years. Each payment consists of both the interest and the principal. While interest can depend 
                                                on the credit rating of the individual purchasing the car, it may be influenced by the condition of the car as well. The bulk of the payment goes to the 
                                                principal. Auto loans allow consumers to purchase a car through borrowing money and gradually paying the cost towards full ownership also known as equity."), 
                                              br(),
                                              h4("Credit Card Loans"),
                                              p("Credit Card Loans refers to a debt incurred when consumers make a purchase, authorizing the credit card issuer to pay the merchant on their behalf. 
                                                Cardholders are responsible for paying their balance usually on a monthly basis or else interest is added and compounded when the balance is outstanding. 
                                                Data shows credit card loans are high because millions of Americans request for a credit card yearly and can sharply decline if the economy crashes but will 
                                                gradually increase overtime due to the high demand of credit. While millions of Americans are usually able to pay their balance, there are also millions of 
                                                Americans who cannot. This is important in the sense that people underestimate the time and money it takes to pay an outstanding balance. However, it also 
                                                gives consumers the option to avoid carrying cash and allows them to reap the benefits of earning 'reward' points, which translated into cash and accumulates 
                                                overtime the more they use the card. "), 
                                              br(),
                                              h4("Debt to Income Ratio"),
                                              p("The Debt to Income Ratio represents an individual's debt payment to their overall income. It can help lender measure
                                                the borrower's ability to manage monthly payments and repay debts. Debt to income ratio is calculated by dividing the total monthly debt by 
                                                gross monthly income and is usually expressed in a percentage. Generally, 43% is the highest DTI a borrower can have to still qualify for a 
                                                mortgage, but a percentage smaller than 36% is preferred with no more than 28% of the debt going towards servicing a mortgage. Therefore, an 
                                                individual who has a lower debt to income ratio is more likely to repay his or her debt payment than someone who has a higher debt versus income. 
                                                It is also important to determine the chances of whether the borrower is able to get a loan or not because lenders will not risk loaning money to 
                                                individuals they know cannot pay them back in the foreseeable future. "),
                                              br(),         
                                              h4("Dow Jones Industrial Average"),
                                              p("The Dow Jones industrial average represents the daily stock price movement of 30 publically owned US companies. Known as the oldest most 
                                                watched indices in the world, the DJIA serves as the proxy for the broader U.S economy. It is price weighted meaning higher stocks impact the DOW more 
                                                than lower stocks. The data has a positive trend over the years, which shows that companies are gradually trading at higher prices greatly impacting 
                                                the Dow's performance. It is important to know the status of the DJIA because it is the cornerstone to monitoring how much each company is trading, 
                                                which can influence the condition of the overall economy. "), 
                                              br(),
                                              h4("Federal Rates"),
                                              p("Federal funds rate represents the interest rate at which a depository institution lends funds maintained at the Federal Reserve to 
                                                another depository institution overnight. It is one of the most influential interest rates in the U.S. economy, since it affects monetary and financial 
                                                conditions, which in turn have an importance on key aspects of the broad economy including employment, growth, and inflation. While it is essential to 
                                                influencing the interest rate, it is generally only applicable to the most creditworthy institutions when they borrow and lend overnight funds to each 
                                                other. The higher the federal funds rate, the more expensive it is to borrow money. While the Federal Reserve cannot set the federal funds rate, it can 
                                                manipulate it indirectly by changing the discount rate. If the discount rate is lower than the federal funds rate, banks will borrow money from the 
                                                Federal Reserve when they need loans, putting less pressure on the federal funds rate. If the rate is higher, banks will more likely borrow money from 
                                                each other rather than the Federal Reserve, putting an upward pressure on the federal funds rate. This method is important for the Federal Reserve to 
                                                control the money supply, which is why the discount rate and the federal funds rate are closely correlated. "),
                                              br(),
                                              h4("Financial Stress Index"),
                                              p("The Financial Stress Index is a valuable indicator of risk, it represents several different variables that, together, captures 
                                                the presence of stress in the financial sector. The variables considered in the stress index includes interest rates, six different yield spreads, and 
                                                other indicators such as market volatility, J.P. Morgan Emerging Markets Bond Index Plus, and more.  In this graph there is an index that numerically 
                                                identifies the status of the stress present in the market. Zero being a neutral point, above 0 meaning above-average, and below 0 signifying below-average 
                                                financial stress. This graph is constructed from a 18 weekly data series, thus this data does not capture 'real time' occurrences. The general sense of 
                                                turmoil and disruption can be accurately captured and displayed with the use of this graph, therefore it can be used as yet another indicator in assessing 
                                                the likelihood of a financial disruption."),
                                              br(),         
                                              h4("Homeownership Rate"),
                                              p("Homeownership Rate..."), 
                                              br(),
                                              h4("House Price Index"),
                                              p("The House Price Index is the measure of the movement of single-family house prices. It is an indicator for estimating changes in mortgage
                                                rates defaults, prepayments and housing affordability. It is a weighted, repeated-sales index, measuring average price changes in repeated sales or refinancing 
                                                on the same properties.  The HPI is published by the Federal Housing Finance Agency, which publishes monthly and quarterly HPI reports, and Fannie Mae has 
                                                securitized its data since 1975. Data includes house price figures for the nine Census Bureau divisions, all 50 states in the United States including the District 
                                                of Columbia, and for the Metropolitan Statistical Areas and Division."),
                                              br(),
                                              h4("Loans by Prime Type"),
                                              p("The number of loans by prime represents the standards of how an individual's credit is rated. In the eyes of a lender, the differences
                                                in the categorical placement of a person's prime rating is essentially what determines the credibility and trustworthiness of a borrower. Given the data that 
                                                this capstone group has compiled, the linear model in our graph shows that Deep Subprime, Subprime, and Near Prime loans have a trend line slope that is 
                                                generally negative up until the year of 2012, at which point the slope begins to point in a slight upward direction. These types of loans (Deep Subprime, 
                                                Subprime, and Near Prime) are intended for individuals who do not qualify for prime rate loans because of their low credit ratings. Lower credit ratings 
                                                are usually associated with higher interest rates and also deem the borrower a subject of higher risk. Increased loans made to risky borrowers could result 
                                                in unfavorable outcomes such as untimely payments and potential defaulted loans. This information could be monitored and used as a useful indicator of a 'red flag' 
                                                in the loan and financial industries. The data represented in our graphs also shows that prime loans from 2005 to 2008 had an increasingly downward slope but 
                                                gradually forecasts a more stable trend moving forward. Prime and Super Prime Loans generally have higher primes because individuals on this level typically have 
                                                an excellent credit score ranges resulting in lower interest rates. Unlike, Deep Subprime, Subprime, and Near Prime, customers with better credit scores are more 
                                                likely to payback what they owe, giving lenders the least amount of risk. The data represented in the graph shows that those who are subject to loans can still 
                                                default on their payments but are not at risk of falling into Deep Subprime."), 
                                              br(),
                                              h4("Mortgage Deby Outstanding"),
                                              p("Mortgage debt outstanding represents the national debt that consumers hold regarding a single 
                                                family housing mortgage. Data has been represented by quarters due to the Federal Reserve Economic Data, being accredited 
                                                only by end of period financial and economical data. FRED is nationally accredited for accurate and regulated information. 
                                                Due to this accreditation, this capstone group relies on the integrity of the data represented by FRED. Mortgage debt 
                                                outstanding has a regression line noted in the sidebar radio button *Linear Model* that represents approximately an eight 
                                                percent increase by quarter with a two percent margin of error. The margin of error increases to a three percent margin of 
                                                error for first and last three years. Mortgage debt outstanding has a forecasting model represented in the sidebar radio 
                                                button *Forecast* that represents a two-year forecast incremented by quarters. This model showed this capstone group that 
                                                the mortgage debt outstanding would potentially reach an all time high of approximately twelve million dollars by 2020."),
                                              br(),
                                              h4("Mortgage Loans"),
                                              p("Mortgage Loans represents the amount of money individuals borrow to purchase a home or real estate. Borrowers 
                                                usually receive loans from the bank and use their own property such as a home as collateral. The data shows that the trend is 
                                                relatively stable, as there is not much of an increase or decrease in the number of loans being requested. Supply and demand 
                                                plays an important role, as it possesses the ability to alter whether or not lenders will offer low or inflated interest rates. 
                                                This is important for buyers who lack the funds to purchase a home and also aids in deciding the best time to seek a mortgage 
                                                loan. While lenders take the risk of issuing loans with no guarantee that the debt will be fully repaid, buyers take the risk of 
                                                accepting loans with no guarantee of the full amount of the loan being repaid in the future. "), 
                                              br(),
                                              h4("Mortgage Rates"),
                                              p("The Mortgage Rate represents the rate of interest charged on a mortgage. It can either be fixed or variable 
                                                and can rise and fall with interest rates affecting individuals who want to purchase a home. The most significant indicator 
                                                for a high or low interest rate is the 10-year Treasury bond yield. This particular yield directly relates to the mortgage 
                                                rate meaning that if it rises, the mortgage rate rises and vice versa. It is a 10-year bond yields because while most mortgages 
                                                are calculated on a 30-year time frame, many mortgages are usually paid off after 10 years. When a lender issues a mortgage, it 
                                                assumes a level of risk because the customer may default on his loan. Therefore, lenders usually charge a higher rate to 
                                                customers with bad credit, which ensures them to recoup the initial loan amount at a faster rate in case the borrower defaults, 
                                                protecting the lender's financial investment. Hence, it is important that customers maintain a good credit score in order for 
                                                them to purchase a house at a lower mortgage rate and not be at risk at defaulting in their payments."), 
                                              br(),         
                                              h4("Petroleum"),
                                              p("Petroleum..."), 
                                              br(),
                                              h4("Prime Interest Rate"),
                                              p("Prime Interest Rate - The prime interest rate determines borrowing costs on mainly short-term loan products and is often 
                                                the basis for adjustable rate loans. Used by many banks to set rates on various consumer loan products, the U.S. prime 
                                                interest rate is associated with factors such as student loans, auto loans, credit cards, and home equity lines of credit. 
                                                The prime interest rate is influenced by the federal funds rate, which is set by the Federal Reserve. There was a steep 
                                                decline in the early 2000's, primarily due to the recession at that time. Another substantial declination resulted from the 
                             global financial crash in 2007 and 2008, during this timeframe the rate declined at a rapid pace and eventually settled at 
                             an all time low in 2009.  The fluctuation of the economy each year can greatly influence how the federal funds are operated, 
                             thus impacting whether the rise or fall of prime interest rates."),
             br(),         
                           h4("Silver Price"),
                           p("Silver Price..."), 
             br(),         
                           h4("Student Loans"),
                           p("Student Loans..."), 
             br(),
                           h4("Unemployment Rate"),
                           p("Unemployment Rate - The rate of unemployment is represented by a percentage number derived from those who are unemployed in the 
                             labor force in ratio to those who are employed. In times of economic trouble, oftentimes jobs are at risk. With jobs being less 
                             secure, the trend of an increasing number citizens losing their employment can be a key indicator in assessing the stability of 
                             an economy. Job loss can have adverse affects on many sectors of an economy, including the mortgage industry. With less jobs to 
                             go around and an decreasing amount of available funds, a decline in market activity is sure to follow. Recessions are a recurring 
                             phenomenon. Often times, following a recession, comes a decrease in the number of jobs available for citizens. Unemployment rates 
                             are a good factor to consider and combined with other market indicators, can be used to make better decisions given the condition 
                             of the economy."), 
             br(),         
                           h4("Vacancy Rates"),
                           p("Vacancy Rates..."), 

## End of variables section

## Tools Section

             br(),
             
             tags$section( id = "tools",
                           h3("Tools"),
                           
                           p("The functionality of this application is enabled by the use of several different tools. First, data is pulled from different 
                             credible sources. Then, this data is loaded into MySQL server and workbench. Next, the data is analyzed with the use of R and 
                             Rstudio. Finally, to visually present our findings and analysis, an Ubuntu Linux Server with the use of an R Shiny server is 
                             utilized as well. Within Rstudio tools and concepts related to HTML5, CSS3, Bootstrap, JavaScript are used as well. ")
## End of tools section             
             
                           )
                           )
                           )
                           )
)
#img(src='www/blankimg.png')
                           )
)

