source("./data.R")
source("./predict.R")

paths <- list(model = "./models/nnet.RData", properties = "./models/nnet-prop.RData")
modelInfo <- retrieveModel(paths)

shinyServer(
    function(input, output, session) {
        output$CompressiveStrength <- renderText({
            dataFrame <- data.frame(Cement = input$Cement,
                                    BlastFurnaceSlag = input$BlastFurnaceSlag,
                                    FlyAsh = input$FlyAsh,
                                    Water = input$Water,
                                    Superplasticizer = input$Superplasticizer,
                                    CoarseAggregate = input$CoarseAggregate,
                                    FineAggregate = input$FineAggregate,
                                    Age = input$Age)
            predicted <- predictData(modelInfo$model, dataFrame)
            predicted
        })
        
        output$CementInteractionPlot <- renderPlot({
            pointCount <- input$Cement_PointCount
            points <- seq(input$CementSlider[1], input$CementSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = points,
                                    BlastFurnaceSlag = rep(input$Cement_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$Cement_FlyAsh, pointCount),
                                    Water = rep(input$Cement_Water, pointCount),
                                    Superplasticizer = rep(input$Cement_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$Cement_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$Cement_FineAggregate, pointCount),
                                    Age = rep(input$Cement_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Cement (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$BlastFurnaceSlagInteractionPlot <- renderPlot({
            pointCount <- input$BlastFurnaceSlag_PointCount
            points <- seq(input$BlastFurnaceSlagSlider[1], input$BlastFurnaceSlagSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$BlastFurnaceSlag_Cement, pointCount),
                                    BlastFurnaceSlag = points,
                                    FlyAsh = rep(input$BlastFurnaceSlag_FlyAsh, pointCount),
                                    Water = rep(input$BlastFurnaceSlag_Water, pointCount),
                                    Superplasticizer = rep(input$BlastFurnaceSlag_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$BlastFurnaceSlag_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$BlastFurnaceSlag_FineAggregate, pointCount),
                                    Age = rep(input$BlastFurnaceSlag_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Blast Furnace Slag (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$FlyAshInteractionPlot <- renderPlot({
            pointCount <- input$FlyAsh_PointCount
            points <- seq(input$FlyAshSlider[1], input$FlyAshSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$FlyAsh_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$FlyAsh_BlastFurnaceSlag, pointCount),
                                    FlyAsh = points,
                                    Water = rep(input$FlyAsh_Water, pointCount),
                                    Superplasticizer = rep(input$FlyAsh_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$FlyAsh_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$FlyAsh_FineAggregate, pointCount),
                                    Age = rep(input$FlyAsh_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Fly Ash (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$WaterInteractionPlot <- renderPlot({
            pointCount <- input$Water_PointCount
            points <- seq(input$WaterSlider[1], input$WaterSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$Water_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$Water_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$Water_FlyAsh, pointCount),
                                    Water = points,
                                    Superplasticizer = rep(input$Water_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$Water_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$Water_FineAggregate, pointCount),
                                    Age = rep(input$Water_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Water (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$SuperplasticizerInteractionPlot <- renderPlot({
            pointCount <- input$Superplasticizer_PointCount
            points <- seq(input$SuperplasticizerSlider[1], input$SuperplasticizerSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$Superplasticizer_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$Superplasticizer_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$Superplasticizer_FlyAsh, pointCount),
                                    Water = rep(input$Superplasticizer_Water, pointCount),
                                    Superplasticizer = points,
                                    CoarseAggregate = rep(input$Superplasticizer_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$Superplasticizer_FineAggregate, pointCount),
                                    Age = rep(input$Superplasticizer_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Superplasticizer (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$CoarseAggregateInteractionPlot <- renderPlot({
            pointCount <- input$CoarseAggregate_PointCount
            points <- seq(input$CoarseAggregateSlider[1], input$CoarseAggregateSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$CoarseAggregate_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$CoarseAggregate_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$CoarseAggregate_FlyAsh, pointCount),
                                    Water = rep(input$CoarseAggregate_Water, pointCount),
                                    Superplasticizer = rep(input$CoarseAggregate_Superplasticizer, pointCount),
                                    CoarseAggregate = points,
                                    FineAggregate = rep(input$CoarseAggregate_FineAggregate, pointCount),
                                    Age = rep(input$CoarseAggregate_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Coarse Aggregate (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$FineAggregateInteractionPlot <- renderPlot({
            pointCount <- input$FineAggregate_PointCount
            points <- seq(input$FineAggregateSlider[1], input$FineAggregateSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$FineAggregate_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$FineAggregate_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$FineAggregate_FlyAsh, pointCount),
                                    Water = rep(input$FineAggregate_Water, pointCount),
                                    Superplasticizer = rep(input$FineAggregate_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$FineAggregate_CoarseAggregate, pointCount),
                                    FineAggregate = points,
                                    Age = rep(input$FineAggregate_Age, pointCount))
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Fine Aggregate (kg / m^3)", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })

        output$AgeInteractionPlot <- renderPlot({
            pointCount <- input$Age_PointCount
            points <- seq(input$AgeSlider[1], input$AgeSlider[2], length.out = pointCount)
            dataFrame <- data.frame(Cement = rep(input$Age_Cement, pointCount),
                                    BlastFurnaceSlag = rep(input$Age_BlastFurnaceSlag, pointCount),
                                    FlyAsh = rep(input$Age_FlyAsh, pointCount),
                                    Water = rep(input$Age_Water, pointCount),
                                    Superplasticizer = rep(input$Age_Superplasticizer, pointCount),
                                    CoarseAggregate = rep(input$Age_CoarseAggregate, pointCount),
                                    FineAggregate = rep(input$Age_FineAggregate, pointCount),
                                    Age = points)
            predicted <- predictData(modelInfo$model, dataFrame)
            plot(points, predicted, pch = 19, col = "darkgrey", xlab = "Age (day(s))", ylab = "Concrete compressive strength (MPa)")
            lines(points, predicted, col = "red", lwd=3)
        })
        
        output$rSquaredValue <- renderText({ modelInfo$rSq })
        output$rmseValue <- renderText({ modelInfo$rmse })
        output$NeuralNetPlot <- renderPlot({ plotnet(modelInfo$model) }, width = 900)
        output$GarsonPlot <- renderPlot({ garson(modelInfo$model) })
    }
)
