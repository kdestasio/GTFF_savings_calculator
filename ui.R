library(shiny)

shinyUI(fluidPage(
    titlePanel("GTFF Savings Calculator"),
    sidebarLayout(
        sidebarPanel(
            helpText("This app calculates savings for full-share and fair-share members based on the GE's monthly salary."),            
            h4("Salary"),            
            numericInput("monthly_salary",
                         label = h6("Monthly salary (in $)"),
                         value = 1720),
            h4("Dues"),
            numericInput("dues_full",
                         label = h6("Full Share Member Dues (in % monthly income)"),
                         value = 2.1),
            numericInput("dues_fair",
                         label = h6("Fair Share Member Dues (in % monthly income)"),
                         value = 1.79),
            h4("Health Insurance"),
            numericInput("insurance_GTFF",
                         label = h6("GTFF (in $)"),
                         value = 286.04),
            numericInput("insurance_ACA",
                         label = h6("ACA (in $)"),
                         value = 462),
            numericInput("insurance_UO",
                         label = h6("UO Plan (in $)"),
                         value = 2972),
            h4("Fees"),
            numericInput("fees_paid",
                         label = h6("Fees paid by the GTFF (in $)"),
                         value = 189),
            numericInput("fees_asked",
                         label = h6("Fees requested by [whom?] (in $)"),
                         value = 2076),
            br(),
            br(),            
            actionButton("action_Calc", label = "Calculate")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                    p(h3("Your entered values:")),
                    textOutput("text_salary"),
                    p(h4("Dues:")),
                    textOutput("text_dues_full"),
                    textOutput("text_dues_fair"),
                    p(h4("Health Insurance:")),
                    textOutput("text_insurance_GTFF"),
                    textOutput("text_insurance_ACA"),
                    textOutput("text_insurance_UO"),
                    p(h4("Fees:")),
                    textOutput("text_fees_paid"),
                    textOutput("text_fees_asked"),
                    br(),
                    p(h3("Calculated values:")),
                    p(h4("Dues:")),
                    textOutput("text_dues_full_dollars"),
                    textOutput("text_dues_fair_dollars"),
                    p(h4("Total Cost:")),
                    textOutput("text_cost_full"),
                    textOutput("text_cost_fair"),
                    textOutput("text_cost_noACA"),
                    textOutput("text_cost_noGTFF"),
                    p(h4("Savings:")),
                    p(h5("Full Member")),
                    textOutput("text_savings_ACA_full"),
                    textOutput("text_savings_UO_full"),
                    p(h5("Fair-Share Member")),
                    textOutput("text_savings_ACA_fair"),
                    textOutput("text_savings_UO_fair")
                ),
                tabPanel("Documentation",
                    p(h4("GTFF Savings Calculator:")),
                    br(),
                    helpText("This application calculates savings for full and fair share members based on their monthly salary."),
                    HTML("<u><b>Equations for calculation: </b></u>
                        <br> </br>
                        <br> D = P * M </br>
                        <br> C = D + H </br>
                        <br> S = ??? <br>
                        
                        <br> </br>
                        
                        <b>key: </b><br>
                        D = Dues paid (per year) <br>
                        M = Monthly salary <br>
                        P = Membership dues paid (% of salary; full or fair) <br>
                        C = Total cost <br>
                        H = Health insurance (GTFF, ACA, or UO) <br>
                        S = Savings

                    ")
                )
            )
        )
    )
))
