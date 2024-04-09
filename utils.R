


get_palette_colors <- function(package, palette, type) {

    
    get_palette <- function(package, palette, type) {
        if(type == "paletteer_d") {
            output = paletteer_d(paste0(package, "::", palette))

        } else if(type == "paletteer_c") {
            n = 100
            output = paletteer_c(paste0(package, "::", palette), n = n)

        } else {
            warning("Palette type not recognized.")
            return(NULL)
        }

        return(output)
    }
    
    tryCatch({
        return(get_palette(package, palette, type))
    }, error = function(e) {
        warning("Palette not found.")
        return(NULL)
    })
}
get_palette_colors("calecopal", "lupinus", "paletteer_d")



get_package_info <- function(package_name) {
  
  packageInfo <- tryCatch({
    packageDescription(package_name)
  }, error = function(e) {
    cat("Error retrieving package description: ", e$message, "\n")
    return(NULL)
  })
  
  if(is.null(packageInfo)) {
    return(list(creatorName = NA, maintainerName = NA, projectUrl = NA, description = NA))
  }
  
  creatorName <- tryCatch({
    packageInfo$Author
  }, error = function(e) {
    NA
  })
  
  maintainerName <- tryCatch({
    packageInfo$Maintainer
  }, error = function(e) {
    NA
  })
  
  projectUrl <- tryCatch({
    packageInfo$URL
  }, error = function(e) {
    NA
  })
  
  description <- tryCatch({
    packageInfo$Description
  }, error = function(e) {
    NA
  })
  

    if(length(creatorName) == 0) {
        creatorName <- NA
    }
    if(length(maintainerName) == 0) {
        maintainerName <- NA
    }
    if(length(projectUrl) == 0) {
        projectUrl <- NA
    }
    if(length(description) == 0) {
        description <- NA
    }

  print(package_name)
  return(
    list(
        creatorName = creatorName,
        maintainerName = maintainerName,
        projectUrl = projectUrl,
        description = description
        )
    )

}

