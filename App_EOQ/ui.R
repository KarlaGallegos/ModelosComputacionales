library(shiny)
library(shinyWidgets)
shinyUI(fluidPage(
  #Titulo de la pagina
  # Navbar.
  setBackgroundColor(
    color = "#CDB5CD"), 
  # Navbar.
  tags$nav(
    tags$div(class="nav-wrapper",
             (tags$a(href="#", class="brand-logo", "Shiny ",
                     (tags$span(class="brand-text-logo", "from",
                                (tags$img(class="img-logo", height="25px", witdh="30px", src="https://d33wubrfki0l68.cloudfront.net/62bcc8535a06077094ca3c29c383e37ad7334311/a263f/assets/img/logo.svg",
                                          tags$ul(class="side-nav", id="mobile-demo",
                                                  tags$li(class="right",
                                                          tags$a(href="https://github.com/KarlaGallegos/ModelosComputacionales", "GitHub - Friends", class="gray-text",
                                                                 tags$i(class="material-icons left", "cloud")))))))))))),
  
  #Lado lateral en el cual insertamos inputs de texto para que el usuario pueda ingresar datos
  sidebarLayout(
    sidebarPanel(
      numericInput("demandaAnual", h4("Demanda Anual:"),value = 0), 
      numericInput("costoPedido", h4("Costo de cada pedido: "), value = 0), 
      numericInput("costoMantenimiento", h4("Costo de matenimiento:"), value = 0), 
      numericInput("demandaPromedio", h4("Demanda promedio:"), value = 0), 
      numericInput("desviacionEstandar", h4("Desviacion estandar:"), value = 0), 
      numericInput("nivelServicio", h4("Nivel de servicio(porcentaje en decimales)"), value = 0, min = 0, max = 1), 
      br(),
      br(),
      #Bot?n para calcular datos
      submitButton("Calcular"),
      br(),
      br(),
    ),
    #Parte prinicpal donde se mostrar?n los resultados
    mainPanel(
      #textOutput("qopt"),
      fluidRow(
        column(12,
               #Aqu? se mostrar? la notaci?n de la l?nea de espera
               h2(textOutput("notation"), align="center"),
               hr())),
      fluidRow(
        column(12,
               #Texto informativo
               h3(strong("Los resultados del modelo son:"), align = "center"),
               br(),
               p(strong("Cantidad Optima de Pedido:  "), textOutput("qopt")),
               p(strong("El punto de reordenR: "), textOutput("r")),
               # p(strong("La politica de inventario consiste en colocar un pedido de" ), textOutput("qoptp")),"siempre que la existencia llegue a unidades", textOutput("ru"))),
               p(strong("El inventario de seguridad: "), textOutput("invSeg")),
               p(strong("El costo de mantenimiento del inventario de seguridad: "), textOutput("CminvSeg")),
               p(strong("Q "), "= Cantidad Optima de Pedido", align = "center"),
               p(strong(HTML("&mu;")), " = Demanda Promedio Esperada", align = "center"),
               p(strong(HTML(" &sigma; ")), "Desviacion Estandar", align = "center"),
               p(strong("R"), "= Punto de Reorden", align = "center"),
               p(strong("Cm"), " = Costo de mantenimiento de pedido", align = "center"),
               p(strong("Co"), " = Costo de cada pedido", align = "center"),
               br(),
               br(),
               img(src = "https://i0.wp.com/goflit.com/wp-content/uploads/2020/10/mal-control-inventarios.jpg?w=960&ssl=1", width="900" ,height="400",align = "middle" )
               
        )
      )
    )
  )
))