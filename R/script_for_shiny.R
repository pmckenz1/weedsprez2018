## Using sdm function
source("R/sdm_function.R")


directory.path <- "sdms"
species.name <- "Pedicularis rex"
coords <- c(73.6753792663, 135.026311477, 18.197700914, 53.4588044297)
climate.map.path <- "dat/wc2-5"
maxent.path <- "programs/maxent.jar"
system(paste0("cd ",getwd(), "/sdms; rm -r outputs_*; rm occurrence_data.csv; rm -r maxent.cache"))
sdm_function(directory.path = directory.path,
             species.name = species.name,
             coords = coords,
             climate.map.path = climate.map.path,
             maxent.path = maxent.path,
             do.plot = FALSE)
output.path <- paste0(directory.path,"/outputs_",stringi::stri_replace(species.name,regex = " ",replacement = "_"))
plot(raster(paste0(output.path,"/",gsub(" ","_",species.name),".asc")))



getwd()




directory.path <- "../sdms"
species.name <- input$species
coords <- c(73.6753792663, 135.026311477, 18.197700914, 53.4588044297)
climate.map.path <- "../dat/wc2-5"
maxent.path <- "../programs/maxent.jar"
system(paste0("cd ",getwd(), "; cd ../sdms; rm -r outputs_*; rm occurrence_data.csv; rm -r maxent.cache"))
sdm_function(directory.path = directory.path,
             species.name = species.name,
             coords = coords,
             climate.map.path = climate.map.path,
             maxent.path = maxent.path,
             do.plot = FALSE)



