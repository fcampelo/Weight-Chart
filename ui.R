library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "My Weight in 2017"),
  h3("(Starting Jan 26th)"),
  p("Having hit the 80kg mark for the first time in my life,
  I decided that it would be a good idea to go back to
    my old Muay Thai group."),
  p("This chart tracks my weight as measured every
    day. Green points are days in which I trained,
    red points mark days when, for whatever reason, I had to 
    skip the gym, and gray marks weekends/holidays."),
  p("All measurements were performed at the end of the day,
  after dinner, without clothes, just before I went to
    bed."),
  p("The plot may take a few seconds to load. Hover over
  the points for details"),
  br(),
  plotly::plotlyOutput("plot")
))
