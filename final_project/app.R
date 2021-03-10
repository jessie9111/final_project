library(shiny)
source("gather.Rmd")

ui <- navbarPage(
    "Gov 1005 Final Project",
    tabPanel("Question",
             h5("How has the COVID-19 pandemic impacted the delivery of health across the world?")
             ),
    tabPanel("Analysis",
             fluidPage(
                 titlePanel("Initial processing"),
                 mainPanel(tableOutput("geography_sum"))
             ),
    tabPanel("About", 
             h3("Project interests"),
             p("Migration, labor, medical anthropology"),
             h3("About Me"),
             p("My name is Mohit Mandal and I am a PhD student in the Department of Anthropology at 
             Harvard  University. 
             You can reach me at mandal@g.harvard.edu."),
             h3("Data sources"),
             p(tags$a(href="https://www.un.org/development/desa/pd/content/international-migrant-stock", "International Migrant Stock 2020"), ": disaggregated by age, sex, destination and origin country"),
             p(tags$a(href="https://migrationdataportal.org/themes/iom-data-overview", "International Organisation for Migration (IOM) data"), ": data on irregular migration flows, environmental migration, missing migrants, internally displaced persons"),
             p(tags$a(href="http://ghdx.healthdata.org/record/ihme-data/premise-general-population-covid-19-health-services-disruption-survey-2020", "The General Population COVID-19 Health Services Disruption Survey 2020"), ": a series of surveys developed to assess the level of disruption to health delivery services as a result of the COVID-19 pandemic, conducted in 76 countries"),
             p(tags$a(href="https://github.com/mohitmandal/finalproject_milestone3", "Link"), "to repo"))))

server <- function(input, output) {
    output$geography_sum <- renderDataTable(geography_sum)
}


# Run the application 
shinyApp(ui = ui, server = server)
