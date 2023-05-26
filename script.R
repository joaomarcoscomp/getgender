library(genderBR)
library(readxl)
library(openxlsx)

# Setting working directory
setwd("C:/Users/joaom/Documents/r")
data = read.xlsx("discentes.xlsx", sheet = 1)

sexo <- c()
# Add gender
for(i in 1:dim(data)[1]) {
  genero <- get_gender(data[i,1])
  if (!is.na(genero) && genero == "Male") {
    genero <- "Masculino"
  }
  if (!is.na(genero) && genero == "Female") {
    genero <- "Feminino"
  }
  sexo <- append(sexo, genero, after = length(sexo))
  
}
# Write in a file
write.xlsx(sexo,"sexo.xlsx")
