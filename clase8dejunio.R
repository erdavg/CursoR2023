## Como instalar paquetes
install.packages("tidyverse")
install.packages("gapminder")
install.packages("viridis")
install.packages("ggthemes")
install.packages("datos")
install.packages("skimr")
install.packages("janitor")
## install.packages("palmerpenguins")

updateR()


## Cargar librerias
library(ggplot2); library(dplyr); library(gapminder); library(viridis); library(ggthemes);
library(datos);library(skimr);library(janitor); library(palmerpenguins)

## R version
R.version

## Atajo para asignar objeto
## alt + -
## Para correr codigo presionar ctrl + enter
x <- 5
x

## Guardar atajo 
## ctrl + s

?dplyr

## Para saber en que directorio estam,os trabajando
getwd()

## Para establecer nuevo dierectorio
setwd("C:\\CursoR")

## Para ver los archivos del directorio
list.files()

## Crear un objeto
miprimerobjeto <- 54
miprimerobjeto
misegundoobjeto <- "hola"
misegundoobjeto
class(miprimerobjeto)
class(misegundoobjeto)

## Vectores
nombres <- c("Raul Guzman", "Diego Torres", "Maria Ramirez",
             "Fernanda Dorantes", "Pablo Limon")  
class(nombres)

peso <- c(58, 65, 89, 75, 56)
class(peso)

altura <- c(1.65, 1.45, 1.84, 1.56, 1.75)

imc <- peso/altura^2
imc

##  Sacar media de peso
sum(peso)
length(peso)

media_peso <- sum(peso)/length(peso)
media_peso

## Data frame
nombre_altura_peso <- data.frame(nombres, altura, peso, imc)
nombre_altura_peso

## Seleccionar elementos de nuestro data frame o vectores
peso[4]
peso[-4]
peso[2:4]
peso[c(1,3)]

## Secuencia de numeros
secuencia <- (1:10)
secuencia

## Secuencia por rango
seq(1,10, by=0.5)

## Ver el numero de filas de data frame
nrow(nombre_altura_peso)

## Ver el numero de columnas d df
ncol(nombre_altura_peso)

## Llamar base de datos
data(iris)

## Dar un vistazo de los primeros 5 observaciones
head(iris)

## Ver las ultimas observaciones del df
tail(iris)

## Dar vistazo de como estan conformados los datos
glimpse(iris)

## Para ver las bases de datos precargadas en R
data()

## Ver la estructura de base de datos
str(iris)

## Seleccionar elementos
summary(iris$Sepal.Length)

## Ver resumen estadistico
summary(largosepalo)
summary(iris)

## Operadores aritmeticos
## Suma +
## Resta -
## Division /
## Multiplicacion *
## Exponente ^
## Residuo de una division %%

o1<- 5+6
11-20
o2<- 2*20
45/9
45%%6

o1 + o2

vector1 <- c(4,5,6,6)
vector2 <- c(8,4,6,2)
vector1 + vector2

## Operadores booleanos o condicionales
5==4
5==5
objeto1 <- 5
objeto2 <- 11
objeto1==objeto2
objeto1!=objeto2
objeto1>=objeto2
objeto1<=objeto2

## Limpieza de datos
## usamos la libreria de palmerpenguins
## janitor y skimr dplyr
data(penguins)
?penguins
skim_without_charts(penguins)
glimpse(penguins)

## Atajo para sacar pipeline
## shift + ctrl + m %>% 
## Seleccion especies
## Pipeline no sirve para concatenar funciones
penguins %>% select(species)
View(penguins)
unique(penguins$species)
levels(penguins$species)
unique(penguins$island)
colnames(penguins)
penguins %>% 
  distinct(species)



## Seleccionar todas la variables menos especie
penguins %>% 
  select(-species) %>% 
  rename(isla = island)

## Libreria de janitor
rename_with(penguins, toupper)
rename_with(penguins, tolower)

## Funcion para limpar el nombre de nuestras variables
dataset_limpio<- clean_names(penguins)

penguins %>% 
  drop_na()

mayoresa35 <- penguins %>% 
  drop_na() %>% 
  filter(bill_length_mm>35) 
View(mayoresa35)

is.na(mayoresa35)
is.na(penguins)
verperdidos <- sum(is.na(penguins))
verperdidos

## Organizar datos por tamaño el largo del pico
penguins %>% 
  arrange(bill_length_mm)

## De forma descendente
penguins %>% 
  arrange(-bill_length_mm)
## Ver las medias de largo de pico por isla
penguins %>% 
  group_by(island) %>% 
  drop_na %>% 
  summarize(mean_largopico = mean(bill_length_mm))

## sacar los maximos de largo pico por isla
penguins %>% 
  group_by(island) %>% 
  drop_na %>% 
  summarize(max_largopico = max(bill_length_mm))

## Filtrar datos de especie Adelie
soloAdelie <- penguins %>% 
  filter(species == "Adelie") %>% 
  drop_na()

soloAdelieenDream <- penguins %>% 
  filter(species == "Adelie", island=="Dream") %>% 
  drop_na()

View(pesoenkg)

soloAdelie<- soloAdelieenDream %>% 
  mutate(pesokg= body_mass_g/1000, aleta_m= flipper_length_mm/1000)

## data set gapminder

data(gapminder)
?gapminder
skim_without_charts(gapminder)

View(gapminder)

## Filtrar infromacion del continente Europeo en el año 2007

europa2007 <- gapminder %>% 
  filter(continent=="Europe" & year==2007)

View(europa2007)
mean(europa2007$lifeExp)
mean(europa2007$pop)

europa1957 <- gapminder %>% 
  filter(continent=="Europe" & year==1957)

View(europa1957)
mean(europa1957$lifeExp)
mean(europa1957$pop)

















