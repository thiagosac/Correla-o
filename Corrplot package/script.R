#===========================================================================#
#                                                                           #
# Script for experiment analysis matrix using correlogram (Corrplot)        #
# THIAGO ARA?JO DOS SANTOS                                                  #
# contact: thiagosantosac96@outlook.com                                     # 
#                                                                           #
#===========================================================================#

#---------------------------------------------------------------------------#
#       Check that all required packages are present 
#---------------------------------------------------------------------------#
# 1.1 List of packages for session
    .packages = c("corrplot",               
                  "RColorBrewer")
    
    # 1.2 Install CRAN packages (if not already installed)
    .inst <- .packages %in% installed.packages()
    if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
    
    # 1.3 Load packages into session
    lapply(.packages, require, character.only=TRUE)

#----------------------------------------------------------------------------#
#       Upload data
#----------------------------------------------------------------------------#
# 1.1 Upload data
    Data <- mtcars [1:7]

# 1.2 View data
    head (Data)

#----------------------------------------------------------------------------#
#       Computing correlation matrix
#----------------------------------------------------------------------------#
# 1.1 Computing 
    correl <-cor(Data)

# 1.2 View
    head (correl)

#----------------------------------------------------------------------------#
#       Visualizing the correlation matrix
#----------------------------------------------------------------------------#
# 1.1 Visualizing
    corrplot(correl,
         type="upper", 
         method = 'square', 
         order = 'hclust', 
         addCoef.col = 'black', 
         tl.pos = 'd',                  
         tl.col = "black",               
         cl.pos = 'b',                   
         col=brewer.pal(n=8, name="RdYlBu"))

# 1.2 Saving
    jpeg("Plot2.jpeg", res = 360, width = 3.5, height = 3.5, units = 'in') 
    
    corrplot(correl,
             type="upper", 
             method = 'square', 
             order = 'hclust', 
             addCoef.col = 'black', 
             tl.pos = 'd',                  
             tl.col = "black",               
             cl.pos = 'b',                   
             col=brewer.pal(n=8, name="RdYlBu")) 
    
    dev.off()