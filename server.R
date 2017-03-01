library(shiny)
library(lubridate)
library(ggplot2)
library(plotly)

shinyServer(function(input, output) {
  output$plot <- plotly::renderPlotly({
    # Read data from my dropbox account
    mydata <- read.csv("https://www.dropbox.com/s/9sckcn7gidkwy9q/weights.csv?dl=1",
                       header = TRUE)

    # Process dates
    mydata$Day        <- lubridate::ymd(mydata$Day)
    mydata$Days.Since <- with(mydata,
                              c(0, as.numeric(Day[2:length(Day)] - Day[1])))
    mydata$Trained <- relevel(mydata$Trained, ref = "Yes")
    p <- ggplot2::ggplot(mydata,
                         aes(x = Days.Since,
                             y = Weight.kg)) +
      geom_point(size = 4, aes(colour = Trained)) +
      xlab("Days since Jan 26 2017") +
      ylab("Weight (kg)") +
      theme(axis.title = element_text(size = 16),
            axis.text = element_text(size = 14),
            legend.position = "bottom") + 
      scale_colour_manual(values = c("#00ff00aa", 
                                     "#ff0000aa", 
                                     "gray"))
    if (nrow(mydata) < 20) p else p + geom_smooth(method = "loess")
  })
})
