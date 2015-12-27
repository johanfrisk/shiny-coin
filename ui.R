library(shiny)

# Define UI for application that draws a line plot for a flipped coin
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Flip a coin"),
        
        # Sidebar with a slider input for the number of coin flips
        sidebarLayout(
                sidebarPanel(
                        sliderInput("flips",
                                    "Number of coin flips:",
                                    min = 1,
                                    max = 1000,
                                    value = 500),
                        p("What is your expected p&l (profit and loss) after 
                        tossing a fair coin 
                        many times, if when it lands heads,
                        you receive a dollar and when it lands tails, you pay 
                        a dollar?"),
                        p("The slider lets you choose the number of coin tosses 
                          and redraws the curve.")
                ),
                
                # Show a plot of the generated plot
                mainPanel(
                        tabsetPanel(
                                tabPanel("Line Plot",
                                plotOutput("linePlot"),
                                p("Asked about the expected outcome from a game 
                                  of summing up the result of a flipped coin - 
                                  most people answer that it will hover around 
                                  zero. In reality, the result tends to wander 
                                  away and end on either side of zero - the 
                                  distance between the dashed and blue lines in 
                                  the graph above."),
                                p("The distribution of the end results can be 
                                  seen in the histogram in the next tab."),
                                br(),
                                actionButton("button1", "make a new line graph")),
                                
                                tabPanel("Histogram",
                                         plotOutput("hist"),
                                         p("Let's run the experiment with 
                                                      1000 coin flips 10.000 times and make 
                                           a histogram of the results. The result
                                           looks very close to a normal distribution. 
                                           By clicking the button below you can try again 
                                           and see if the shape of the distribution changes."),
                                         actionButton("button2", "make a new experiment"))
                                
                        
                )
        )
)))