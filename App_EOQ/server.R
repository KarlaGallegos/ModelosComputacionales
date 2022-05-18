library(shiny)
library(SCperf)

shinyServer(function(input, output) {
  output$notation <- renderText({
    #Titulo
    paste("MODELO EOQ PROBABILISTICO")
  })
  
  output$qopt <- renderText({
    eoq <- EOQ(input$demandaAnual, input$costoPedido, input$costoMantenimiento)
    #Guarda el resumen de los resultados en una variable
    qopt <- eoq[[1]]
  })
  
  output$r <- renderText({
    #Define las entradas 
    ns<-input$nivelServicio
    mu<-input$demandaPromedio
    sigma<-input$desviacionEstandar
    #Guarda el resumen de los resultados en una variable
    z<-qnorm(ns)
    r<-mu+(z*sigma)
  })
  
  
  #output$Politica <- renderText({
  # eoq <- EOQ(input$demandaAnual, input$costoPedido, input$costoMantenimiento)
  #Define las entradas 
  #ns<-input$nivelServicio
  #mu<-input$demandaPromedio
  #sigma<-input$desviacionEstandar
  #Guarda el resumen de los resultados en una variable
  #qoptp <- eoq[[1]]
  
  #z<-qnorm(ns)
  #r<-mu+(z*sigma)
  
  #})
  #output$Unidades <- renderText({
  # eoq <- EOQ(input$demandaAnual, input$costoPedido, input$costoMantenimiento)
  #Define las entradas 
  #ns<-input$nivelServicio
  #mu<-input$demandaPromedio
  #sigma<-input$desviacionEstandar
  #Guarda el resumen de los resultados en una variable
  #qopt <- eoq[[1]]
  
  #z<-qnorm(ns)
  #ru<-mu+(z*sigma)
  
  #})
  output$invSeg <- renderText({
    #Define las entradas 
    ns<-input$nivelServicio
    sigma<-input$desviacionEstandar
    #Guarda el resumen de los resultados en una variable
    z<-qnorm(ns)
    invSeg<-(z*sigma)
  })
  
  output$CminvSeg <- renderText({
    #Define las entradas 
    cm<-input$costoMantenimiento
    ns<-input$nivelServicio
    sigma<-input$desviacionEstandar
    #Guarda el resumen de los resultados en una variable
    z<-qnorm(ns)
    invSeg<-(z*sigma)
    CminvSeg<-(cm*invSeg)
  })
})