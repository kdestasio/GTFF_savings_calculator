library(shiny)

shinyServer(function(input, output) {
    # Calculate the total costs and savings  
    dues_full_dollars <- reactive({ isolate({
            round(input$monthly_salary*(input$dues_full/100)*12, 2)
            })
    })
    dues_fair_dollars <-reactive({ isolate({
        round(input$monthly_salary*(input$dues_fair/100)*12, 2)
            })
    })
    cost_full <- reactive({ round(isolate(input$insurance_GTFF) + isolate(input$fees_paid) + dues_full_dollars(),2)
    })
    cost_fair <- reactive({ round(isolate(input$insurance_GTFF) + isolate(input$fees_paid) + dues_fair_dollars(),2)
    })
    cost_noACA <- reactive({ isolate({
            round(input$insurance_ACA + input$fees_asked, 2)
            })
    })
    cost_noGTFF <- reactive({ isolate({
            round(input$insurance_UO + input$fees_asked, 2)
            })
    })
    savings_ACA_full <- reactive({ round(cost_noACA() - cost_full(), 2)
    })
    savings_UO_full <- reactive({ round(cost_noGTFF() - cost_full(), 2)
    })
    savings_ACA_fair <- reactive({ round(cost_noACA() - cost_fair(), 2)
    })
    savings_UO_fair <- reactive({ round(cost_noGTFF() - cost_fair(), 2)
    })

    # Display values entered
    output$text_salary <- renderText({
        input$action_Calc
        paste("Monthly Salary: [$]", isolate(input$monthly_salary))
    })
    
    output$text_dues_full <- renderText({
        input$action_Calc
        paste("Full Share Dues: ", isolate(input$dues_full),
              " % monthly income")
    })

    output$text_dues_fair <- renderText({
        input$action_Calc
        paste("Fair Share Dues: ", isolate(input$dues_fair),
              " % monthly income")
    })
    output$text_insurance_GTFF <- renderText({
        input$action_Calc
        paste("Health Insurance GTFF [$]: ", isolate(input$insurance_GTFF))
    })
    output$text_insurance_ACA <- renderText({
        input$action_Calc
        paste("Health Insurance ACA [$]: ", isolate(input$insurance_ACA))
    })
    output$text_insurance_UO <- renderText({
        input$action_Calc
        paste("Health Insurance UO [$]: ", isolate(input$insurance_UO))
    })
    output$text_fees_paid <- renderText({
        input$action_Calc
        paste("Fees Paid [$]: ", isolate(input$fees_paid))
    })
    output$text_fees_asked <- renderText({
        input$action_Calc
        paste("Fees Asked [$]: ", isolate(input$fees_asked))
    })
    
    # Display calculated values
    
    output$text_dues_full_dollars <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Full Share Member Dues Per Year:", dues_full_dollars())
    })
    output$text_dues_fair_dollars <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Fair Share Member Dues Per Year:", dues_fair_dollars())
    })
    output$text_cost_full <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Total Cost Full Share Member [$]:", cost_full())
    })
    output$text_cost_fair <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Total Cost Fair Share Member [$]:", cost_fair())
    })
    output$text_cost_noACA <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Total Cost No ACA [$]:", cost_noACA())
    })
    output$text_cost_noGTFF <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Total Cost No UO [$]:", cost_noGTFF())
    })
    output$text_savings_ACA_full <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Savings (ACA) Full Share Member[$]:", savings_ACA_full())
    })
    output$text_savings_ACA_fair <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Savings (ACA) Fair Share [$]:", savings_ACA_fair())
    })
    output$text_savings_UO_full <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Savings (UO) Full Share Member[$]:", savings_UO_full())
    })
    output$text_savings_UO_fair <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Savings (UO) Fair Share [$]:", savings_UO_fair())
    })

})