library(shiny)

# Define server logic required to draw a line plot
shinyServer(function(input, output) {
        
        
        output$linePlot <- renderPlot({
                sequenceOfCoinTosses <- cumsum(sample(c(-1,1), 
                                                      input$flips, 
                                                      replace = TRUE))
                
                # draw the line graph with the specified number of flips
                input$button1
                plot(sequenceOfCoinTosses, type = 'l',
                     main="trend in a random walk", 
                     xlab="number of flips", ylab="")
                # add a line for value = 0
                abline(0,0,lty="dashed")
                # add a line indicating final value of the random walk
                abline(sequenceOfCoinTosses[[input$flips]], 
                       0, col="steelblue")
        })
        
        output$hist <- renderPlot({
                
                # insert a button to redraw the histogram
                input$button2
                
                # Create an empty list to store the results of 10000 flips
                results <- list()
                
                # populate the list with results for 10.000 sequences of flips
                for(i in 1:10000) {
                        coinTosses   <- cumsum(sample(c(-1,1), 1000, replace = TRUE)) 
                        results[[i]] <- coinTosses[length(coinTosses)]
                }
                
                # Unlist the list and create a histogram. Set a title and set the color and breaks
                hist(unlist(results), main = "Histogram of 10.000 p&l's",
                col = "lightblue", breaks = 100, xlab = "")
        
        # Place a vertical line at 0 with a width of 2 in order to show the 
        #average of the distribution
        abline(v = 0, col = "red", lwd = 2)
        })
})
