library(shiny)


shinyServer(
    function(input, output){
        output$mybar <-renderPlotly({
            
            col <- as.numeric(input$col)
            par(mar=c(2,2,2,2))
            g <- ggplot(swiss, aes(row.names(swiss), swiss[,col])) + geom_bar(stat = "identity", fill = "dodgerblue") + 
                coord_flip() +
                ylab("") +
                xlab("") +
                ggtitle(paste(c(names(swiss[col])),"in Switzerland circa 1888 by Province")) +
                theme_classic()
            p<- ggplotly(g)
            p
            
        })
        
        output$myscat <- renderPlotly({
            col2 <- as.numeric(input$col2)
            col3 <- as.numeric(input$col3)
            g1 <- ggplot(swiss, aes(swiss[,col2], swiss[,col3])) + geom_point(color = "red") + 
                theme_bw() +geom_smooth(method = "lm")+ ylab(names(swiss[col3])) + xlab(names(swiss[col2])) +
                theme(plot.margin=unit(c(.5,.5,2,2), "cm"))+
                ggtitle("Scatterplot")
        
            p1<- ggplotly(g1)    
            p1    
        })
        
        output$mytable <- renderDataTable({
            
            swiss2 <- add_rownames(swiss, "province")
            swiss2
        })
            
        output$mytext <- renderText(as.character(" Welcome!  Choose a measure from the dropdown selections on the left.  Navigate to the appropriate tab above to see results."))
        
    })

