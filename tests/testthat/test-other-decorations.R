context("canvasXpress decorations")


test_that("scatterplot referenceLines", {
    tryCatch({
        data_y <- read.table("https://www.canvasxpress.org/data/cX-scatterR2-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
        data_z <- read.table("https://www.canvasxpress.org/data/cX-scatterR2-var.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    },
    error = function(e) {
        skip('Unable to read data files')
    })

    result <-  canvasXpress(data                    = data_y,
                            varAnnot                = data_z,
                            colorBy                 = "Group",
                            colors                  = list("rgba(0,104,139,0.5)", "rgba(205,0,0,0.5)", "rgba(64,64,64,0.5)"),
                            graphType               = "Scatter2D",
                            plotBox                 = FALSE,
                            showDecorations         = TRUE,
                            sizeBy                  = "FC",
                            sizes                   = list(4, 14, 16, 18),
                            xAxis                   = list("logFC"),
                            yAxis                   = list("-log-pVal"),
                            showLegend              = FALSE,
                            title                   = "Scatterplot - referenceLines",
                            decorations             = list(line = list(list(color = "rgba(205,0,0,0.5)", width = 2, x = 0.5),
                                                                       list(color = "rgba(0,104,139,0.5)", width = 2, x = -0.5))))

    check_ui_test(result)
})

test_that("scatterplot notePoint", {
    tryCatch({
        data_y <- read.table("https://www.canvasxpress.org/data/cX-scatterR2-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
        data_z <- read.table("https://www.canvasxpress.org/data/cX-scatterR2-var.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    },
    error = function(e) {
        skip('Unable to read data files')
    })

    result <-  canvasXpress(data                    = data_y,
                            varAnnot                = data_z,
                            colorBy                 = "Group",
                            colors                  = list("rgba(0,104,139,0.5)", "rgba(205,0,0,0.5)", "rgba(64,64,64,0.5)"),
                            graphType               = "Scatter2D",
                            plotBox                 = FALSE,
                            showDecorations         = TRUE,
                            sizeBy                  = "FC",
                            sizes                   = list(4, 14, 16, 18),
                            xAxis                   = list("logFC"),
                            yAxis                   = list("-log-pVal"),
                            showLegend              = FALSE,
                            title                   = "Scatterplot - notePoint",
                            decorations             = list(marker = list(list(sample = list("logFC", "-log-pVal"), text = "Maybe an Outlier?", variable = "Gene30", x = 0.11, y = 0.45))))

    check_ui_test(result)
})

test_that("barplot annotations", {
    tryCatch({
        y <- read.table("https://www.canvasxpress.org/data/cX-basic2-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    },
    error = function(e) {
        skip('Unable to read data files')
    })

        result <- canvasXpress(data                    = y,
                           graphType               = "Bar",
                           graphOrientation        = "vertical",
                           title                   = "Barplot - annotations",
                           decorations             = list(marker = list(list(fontSize = 12, sample = "S1", text = "p < 0.01 ***", type = "annotation", variable = "V1"),
                                                                        list(fontSize = 12, sample = "S2", text = "p < 0.05 **", type = "annotation", variable = "V1"))))

    check_ui_test(result)
})

test_that("segregated Boxplot decorations with different values", {
    tryCatch({
        y <- read.table("https://www.canvasxpress.org/data/cX-iris-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
        x <- read.table("https://www.canvasxpress.org/data/cX-iris-smp.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
    },
    error = function(e) {
        skip('Unable to read data files')
    })

    result <- canvasXpress(data               = y,
                           smpAnnot           = x,
                           graphOrientation   = "vertical",
                           graphType          = "Boxplot",
                           legendBox          = FALSE,
                           smpLabelRotate     = 90,
                           smpTitle           = "Species",
                           title              = "Segregated Boxplot - decorations with different values for each Species",
                           segregateSamplesBy = list("Species"),
                           groupingFactors    = list("Species"),
                           layoutAdjust       = TRUE,
                           decorations        = list(line = list(list(align = "left", color = "rgb(255,0,0)", label = "Cutoff", value = 2, width = 2, scope = "setosa"),
                                                                 list(align = "left", color = "rgb(255,0,0)", label = "Cutoff", value = 4, width = 2, scope = "versicolor"),
                                                                 list(align = "left", color = "rgb(255,0,0)", label = "Cutoff", value = 6, width = 2, scope = "virginica"))))

    check_ui_test(result)
})

test_that("segregated Boxplot decorations with same values", {
    tryCatch({
        y <- read.table("https://www.canvasxpress.org/data/cX-iris-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)[, 1:100]
        x <- read.table("https://www.canvasxpress.org/data/cX-iris-smp.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)[1:100, , drop = FALSE]
        y[, 1:50] <- y[, 1:50] - 2
    },
    error = function(e) {
        skip('Unable to read data files')
    })

    result <- canvasXpress(data               = y,
                           smpAnnot           = x,
                           graphOrientation   = "vertical",
                           graphType          = "Boxplot",
                           legendBox          = FALSE,
                           smpLabelRotate     = 90,
                           smpTitle           = "Species",
                           title              = "Segregated Boxplot - decoration should be on exactly the same height",
                           segregateSamplesBy = list("Species"),
                           groupingFactors    = list("Species"),
                           layoutAdjust       = FALSE,
                           decorations        = list(line = list(list(align = "left", color = "rgb(255,0,0)", label = "Cutoff", value = 2, width = 2))))

    check_ui_test(result)
})

test_that("segregated Boxplot decoration label position", {
    tryCatch({
        y <- read.table("https://www.canvasxpress.org/data/cX-toothgrowth-dat.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
        x <- read.table("https://www.canvasxpress.org/data/cX-toothgrowth-smp.txt", header = TRUE, sep = "\t", quote = "", row.names = 1, fill = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
        z <- data.frame(Gene = c("Gene1"), stringsAsFactors = FALSE)
        rownames(z) <- rownames(y)
    },
    error = function(e) {
        skip('Unable to read data files')
    })

    position_list <- list(left = "top", right = "bottom")
    for (name in names(position_list)) {

        pos <- position_list[[name]]
        result <- canvasXpress(data               = y,
                               smpAnnot           = x,
                               varAnnot           = z,
                               graphOrientation   = "horizontal",
                               graphType          = "Boxplot",
                               groupingFactors    = list("dose"),
                               segregateVariablesBy = list("Gene"),
                               legendBox          = FALSE,
                               smpLabelRotate     = 90,
                               smpTitle           = "dose",
                               title              = paste("Segregated Boxplot - decoration label position", pos),
                               layoutAdjust       = TRUE,
                               decorations        = list(line = list(list(align = name, color = "rgb(255,0,0)", label = "Decoration label", value = 20, width = 2, scope = "Gene1"))))

        check_ui_test(result)
    }
})

test_that("precalculated barplot - annotations", {
    precalc.data <- data.frame(mean  = c(5, 50, 250, 100, 150),
                               stdev = c(20, 10, 20, 15, 15),
                               stringsAsFactors = F)
    precalc.data1   <- as.data.frame(t(precalc.data))
    precalc.data2   <- as.data.frame(t(precalc.data))

    colnames(precalc.data1) <- c("Group1", "Group2", "Group3", "Group4", "Group5")
    colnames(precalc.data2) <- c("Group1", "Group2", "Group3", "Group1", "Group2")

    smp.data <- matrix(data     = c("Lev1", "Lev1", "Lev1", "Lev2", "Lev2"),
                       ncol     = 1,
                       dimnames = list(colnames(precalc.data2), "level"))

    # without smpAnnot data
    result <- canvasXpress(data                  = precalc.data1,
                           graphType             = "Bar",
                           graphOrientation      = "vertical",
                           smpLabelFontStyle     = "italic",
                           smpLabelRotate        = 90,
                           showLegend            = FALSE,
                           decorations           = list(marker = list(list(fontSize = 10,
                                                                           text     = "Group3",
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group3",
                                                                           y        = 0.05),
                                                                      list(fontSize = 10,
                                                                           text     = "Group4",
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group4",
                                                                           y        = 0.53))),
                           title                 = "Annotations for Precalculated Barplot without smpAnnot",
                           titleScaleFontFactor  = 0.5)

    check_ui_test(result)

    # with smpAnnot data
    result <- canvasXpress(data                  = precalc.data2,
                           smpAnnot              = smp.data,
                           segregateSamplesBy    = list("level"),
                           graphType             = "Bar",
                           graphOrientation      = "vertical",
                           smpLabelFontStyle     = "italic",
                           smpLabelRotate        = 90,
                           showLegend            = FALSE,
                           decorations           = list(marker = list(list(fontSize = 10,
                                                                           text     = "Group3",
                                                                           scope    = "Lev1",
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group3",
                                                                           y        = 0.05),
                                                                      list(fontSize = 10,
                                                                           text     = "Group1",
                                                                           scope    = "Lev2",
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group1",
                                                                           y        = 0.53))),
                           title                 = "Annotations for Precalculated Barplot with smpAnnot",
                           titleScaleFontFactor  = 0.5)

    check_ui_test(result)
})

test_that("segregated and overlayed precalculated barplot - annotations", {
    precalc.data <- data.frame(mean  = c(100, 200, 150, 100, 50, 80, 250, 100, 150),
                               stdev = c(10, 20, 15, 15, 20, 10, 20, 15, 15),
                               stringsAsFactors = F)
    precalc.data           <- as.data.frame(t(precalc.data))
    colnames(precalc.data) <- c("Group1", "Group2", "Group1", "Group2", "Group2", "Group3", "Group4", "Group3", "Group4")

    smp.data <- matrix(data     = c("Lev1", "Lev1", "Lev1", "Lev1", "Lev2", "Lev2", "Lev2", "Lev2", "Lev2",
                                    "Proj1", "Proj1", "Proj2", "Proj2", "Proj1", "Proj1", "Proj1", "Proj2", "Proj2"),
                       ncol     = 2,
                       dimnames = list(colnames(precalc.data), c("level", "Project")))

    result <- canvasXpress(data                  = precalc.data,
                           smpAnnot              = smp.data,
                           segregateSamplesBy    = list("level"),
                           smpOverlays           = list("Project"),
                           graphType             = "Bar",
                           graphOrientation      = "vertical",
                           smpLabelFontStyle     = "italic",
                           smpLabelRotate        = 90,
                           showLegend            = FALSE,
                           decorations           = list(marker = list(list(fontSize = 10,
                                                                           text     = "(Lev1,Proj1)",
                                                                           scope    = list("Lev1", "Proj1"),
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group1",
                                                                           y        = 0.65),
                                                                      list(fontSize = 10,
                                                                           text     = "(Lev1,Proj2)",
                                                                           scope    = list("Lev1", "Proj2"),
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group1",
                                                                           y        = 0.44),
                                                                      list(fontSize = 10,
                                                                           text     = "(Lev2,Proj1)",
                                                                           scope    = list("Lev2", "Proj1"),
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group2",
                                                                           y        = 0.82),
                                                                      list(fontSize = 10,
                                                                           text     = "(Lev2,Proj1)",
                                                                           scope    = list("Lev2", "Proj1"),
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group4",
                                                                           y        = 0.05),
                                                                      list(fontSize = 10,
                                                                           text     = "(Lev2,Proj2)",
                                                                           scope    = list("Lev2", "Proj2"),
                                                                           type     = "annotation",
                                                                           variable = "precalculated BarChart",
                                                                           sample   = "Group4",
                                                                           y        = 0.44))),
                           title                 = "Annotations for segregated and overlayed precalculated barplot",
                           titleScaleFontFactor  = 0.5)

    check_ui_test(result)
})
