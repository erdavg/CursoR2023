## Como instalar paquetes
install.packages("tidyverse")
install.packages("gapminder")
install.packages("viridis")
install.packages("ggthemes")
install.packages("datos")
install.packages("skimr")
install.packages("janitor")
install.packages("palmerpenguins")


## Cargar librerias
library(ggplot2); library(dplyr); library(gapminder); library(viridis); library(ggthemes);
library(datos);library(skimr);library(janitor); library(palmerpenguins)

## Para correr una libreria o funcion, seleccionamos y presionamos:
## ctrl + enter

## Nunca olvides salvar cada que puedas tu codigo
## Atajo ctrl + s

## Ver version de R
R.version

## Ver documentacion de paqueteria
?dplyr

## Como saber en que directorio estoy trabajando
getwd()


## Como establecer directorio de trabajo
setwd("C:\\CursoR")

## Usamos list.files() para ver los archivos de nuestro directorio

list.files()
##Crear un objeto
minombre <- ("Erick")
h <- 56
## Vectores y concatenacion
nombres <- c("Pedrito", "Maria", "Rosita", "Carlitos", "Paquito", "Anita")

class("nombres")

peso <- c(52, 74, 65, 48, 70, 84)
class("peso")

## Convertir a numerico
as.numeric(peso)
class(peso)
as.integer(peso)
numero <- 33
class(numero)
as.integer(numero)

## Error cuando no se ponen la funcion c
peso <- (52, 74, 65, 48, 70, 84)
altura <- c(1.54, 1.85, 1.59, 1.56, 1.78, 1.65)

## Imprimir los vectores
peso
altura

## Secuencias
f <- (1:10)
f
##Secuencias por rango
g <- seq(1,10, by=0.5)
g

## Repeticiones
rep(1:2, times=3)
rep(1:4, each=5)

## Selecionar elementos de nuestro vector peso
peso[4] ## Seleccionamos el cuarto elemento del vector
peso[-4] ## Seleccionamos todos menos el cuarto elemento
peso[2:4] ## Seleccionamos elemntos del 2 al 4
peso[c(1,3)]


## Crear una funcion para sacar imc

imc <- peso/altura^2
imc

## Funcion para sacar la media de peso
sum(peso)
length(peso)

media_peso <- sum(peso)/length(peso)
media_peso

## Crear un data frame de alturas y pesos
alturas_peso_imc <-data.frame(altura,peso,imc)
alturas_peso_imc

## Ver el numero de filas del data frame
nrow(alturas_peso_imc)

## Ver el numero de columnas del data frame
ncol(alturas_peso_imc)

##Resumen de bases de datos
data(iris)
## Para dar un vistazo a los primeros datos de la base de datos
head(iris)

## Ver los ultimos datos de la bd
tail(iris)

## ver como estan conformados mis datos
glimpse(iris)

## Ver estructura de datos
str(iris)

## Ver soloo nombre de columnas
colnames(iris)

## Resumen estadistico de datos
summary(iris)


## Seleccionar elementos de una base de datos

## Seleccionar la columna 4 de la bd iris
iris[4]

## Seleccionar la columna 1 y 4
iris[, c(1,4)]

## seleccionar de la fila 1 a la 20 
solo20 <- iris[1:20,]


summary(solo20) 


## Operadores aritmeticos

## + Suma
## - Resta
## * Multiplicacion
## / Division
## ^ Exponente
## %% Obtener el resto de una division(Valor que no se puede divir exactamente)

4%%1.8
4/1.8

15%%5
15/5

q <- 4 + 5
q
r <- 8 / 2
q + r

print(3+2)

## Se pueden hacer operaciones con vectores
t <- c(4,5,2,9)
y <- c(8,3,7,3)
t+y
t*y
## Imprimir texto
print(hola mi nombre es) 
## Error por que el texto va entre comillas
print("Hola mi nombre es")

## Operadores booleanos

5==4 ## es igual a 
x <- 6 ## asignamos un valor a x
y <- 7 ## asignamos un valor a y
x<3 ## x es menor a 3? 
y>7  ## y es mayor que 7?
y==7 ## y es igual a 7?
z <- x+3 ## asignamos un valor a z
z ## valor de z
z<6 ## z es menor que 6?
z!=8 ## z es diferente de 8?
z!=9 ## z es diferente de 9?
z>=9 ## z es mayor o igual a 9?

## LIMPIEZA DE DATOS ##
## Usamos la libreria de palmerpenguins
## Contiene informacion de diferentes especies de pinguinos en diferentes islas
## Funcion para resumen comprensivo del dataset
data(penguins)
?penguins
skim_without_charts(penguins) ## De la libreria skimr
glimpse(penguins)
head(penguins)

## Selecccionas Especies
penguins %>% 
  select(species)

## Cada columna excepto especies con "-"
penguins %>% 
  select(-species)

## Filtrar con R nativo las especies que hay en el dataset
unique(penguins$species)

levels(penguins$species)

## Lo mismo pero filtrado con dplyr
penguins %>% 
  distinct(species)

## Renombrar columna
penguins %>% 
  rename(island_new= island)

View(penguins)
## rename_with renombra columnas para ser mas consistentes
## toupper todas en mayusculas, tolower todas en minusculas
rename_with(penguins, toupper)
rename_with(penguins, tolower)

## clean_names se asegura de poner solo caracteres, numeros y guiones bajos
clean_names(penguins)


## Organizar datos por tamaño del largo del pico de forma ascendente
penguins %>% arrange(bill_length_mm)

## Arreglar de forma descendente
penguins %>% arrange(-bill_length_mm)


## Guardar dataset
penguins2 <- penguins %>%  arrange(-bill_length_mm)
View(penguins2)


## Agrupar por isla y quitar los datos perdidos (NA) y sacar medias de largo del pico
penguins %>%  group_by(island) %>%  
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean (bill_length_mm))


## Sacar Maximos de largo de pico
penguins %>%  
  group_by(island) %>%  
  drop_na() %>% 
  summarize(max_bill_length_mm = max (bill_length_mm))


## Agrupado por isla y especie y media y maximo de largo de pico y ordenado por 
## la media del largo de pico de forma ascendente
penguins %>% 
  group_by(species, island) %>%  
  drop_na() %>% 
  summarize (max_bl = max (bill_length_mm), mean_bl = mean(bill_length_mm)) %>% 
  arrange(mean_bl)                                                           

## Filtrar resultados por especie Adelie
penguins %>% filter(species=="Adelie")

## ## Filtrar resultados por especie Adelie y sin datos perdidos
penguins %>% filter(species=="Adelie") %>% drop_na()

## Convertir gramos a kilogramos de body_mass_g
penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000)

## Convertir largo de aleta de milimetros a metros
penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000)



##Aqui usamos la libreria gapminder



## ESTO ## ES ## UN ## COMENTARIO ##
## Con este mismo podemos apagar un codigo que no queramos correr

## Asignar un objeto <- 
## Atajo para "<-" alt + -

## dplyr %>% pipeline
## Atajo ctrl + shift + m

## Modo de uso:
## objeto %>% pipeline
## pipeline se utilza para concatenar funciones

## filter
## objeto %>% filter(atributyo>=1)

##Mutate crear nuevas variables
## objeto %>% mutate(atributo2=atributo1/5)
## Se puede volver a guardar dentro del mismo objeto o uno nuevo
## objeto1 <- objeto %>% mutate(atributo2=atributo1/5)

## Group_by agrupar objetos 
## Ejemplo una variable que tenga categorias
## objeto %>%  group_by(atributo) 
## Podemos obtener estadisticas de resumen para ese objeto
## objeto %>%  group_by(atributo) %>% summarise(atributo_media=mean(atributo))

## Tomar datos de gapminder
data(gapminder)
View(gapminder)
skim_without_charts(gapminder)
##Informacion por pais, continente y año de la expectativa de vida
## del producto interno bro per capita

## Filtrar informacion de continente europeo en año 2007
europa2007 <- gapminder %>% filter(continent=="Europe" & year==2007)
View(europa2007)
mean(europa2007$lifeExp)
mean(europa2007$pop)

## Filtrar informacion europa en año 1987
europa1987 <- gapminder %>% filter(continent=="Europe" & year==1987)
View(europa1987)
mean(europa1987$lifeExp)
mean(europa1987$pop)

## Ver un resumen estdistico de los datos de gapminder
summary(gapminder)

## Filtrar datos de europa y asia
europa_asia <- gapminder %>% filter(continent=="Europe" | continent=="Asia")
View(europa_asia)
summary(europa_asia)

## Filtrar asia 1952 y resumen de datos
summary(gapminder %>% filter(continent=="Asia" & year==1952))

## Funcion Mutate
## Obtener el producto interno bruto de un pais
gapminder %>% mutate(gdp=gdpPercap*pop)

## En la funciones hay jerarquia
## Saber el gdp  con mas de 800
gapminder %>% filter(gdpPercap>800) %>% mutate(gpp=gdpPercap*pop)

## Lo asignamos a un objeto 
gdpMayor800 <- gapminder %>% filter(gdpPercap>800) %>% mutate(gpp=gdpPercap*pop)

## Resumen de estadisticos
summary(gdpMayor800)

## Funcion group_by
## Agrupar por año
gapminder %>% filter(continent=="Africa") %>% group_by(year) %>% 
  summarise(exp_mean=mean(lifeExp, na.rm = T))
## Remover NA's (datos perdidos) para que la media no sea NA
## Obtenemos la media de la expectativa de vida por año de Africa

## Agrupamos por pais
gapminder %>% filter(continent=="Africa") %>% group_by(country) %>% 
  summarise(exp_mean=mean(lifeExp, na.rm = T))
## Obtenemos la media de expectativa por pais de Africa

## Hacemos lo mismo pero comparando la mediana

gapminder %>% filter(continent=="Africa") %>% group_by(country) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T))
## Ahora nos da la media y la mediana

## Podemos tambien agregar la desviacion estandar
gapminder %>% filter(continent=="Africa") %>% group_by(country) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T))

## Agrupar por año y por continente
gapminder %>% group_by(year, continent) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T))

## Esto nos permite hacer una valoracion rapida de nuestros datos

## Funcion arrange
## Ordena los datos

gapminder %>% group_by(year, continent) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T)) %>% arrange()

## Si no se ponen nada nos hace un ordenamiento por nuestra primera variable

## Ordenar por expectativa de vida
gapminder %>% group_by(year, continent) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T)) %>% arrange(exp_median)
## Lo ordeno de forma ascendente

## Podemos hacerlo de forma descendente
gapminder %>% group_by(year, continent) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T)) %>% arrange(desc(exp_median))

## Posteriormente lo podemos asignar a un objeto para crear un df
lifeexp <- gapminder %>% group_by(year, continent) %>% 
  summarise(exp_median=median(lifeExp, na.rm = T), exp_mean=mean(lifeExp, na.rm=T),
            exp_sd=sd(lifeExp, na.rm=T)) %>% arrange(desc(exp_median))

## Guardar df en nuestro directorio de trabajo 
##Primero verificar nuestro directorio con getwd
getwd()

write.csv(lifeexp, "expectativa_vida.csv")
## El formato csv es un formato universal

## Para leer una base de datos
read.csv()

## Graficos con R basico

## Histograma
hist(gapminder$lifeExp) ## Generalmente para exploracion de datos
## que no se quieren presentar
hist(gapminder$lifeExp, col = "red", xlab="Expectativa de vida (Años)",
     ylab="Frecuencia", main= "Histograma Expectativa de vida")

plot(gapminder$gdpPercap, gapminder$lifeExp)

## Graficas con ggplot
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  ylab("Expectativa de vida")+xlab("GDP per capita")

## Podemos sacar logaritmo de gdpPercapita para ver una relacion mas clara
ggplot(gapminder, aes(x=log(gdpPercap), y=lifeExp)) +
  geom_point() +
  ylab("Expectativa de vida")+xlab("GDP per capita")
## La funcion scale_x_log10 respeta la escala
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  ylab("Expectativa de vida")+xlab("GDP per capita")+scale_x_log10()

## Cambiar el tema de la grafica
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point() +
  ylab("Expectativa de vida")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic() + ggtitle("Relacion entre GDP per capita y Expectativa de vida")
## theme_minimal
## theme_light
## theme_gray
## theme_bw
## theme_linedraw

## El gráfico se guarda en "Export" 

## Filtrado por continente
gapminder %>% filter(continent=="Americas") %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa de vida de America")

## Hacer que el tamaño de los puntos cambie en funcion de la poblacion
gapminder %>% filter(continent=="Americas") %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa de vida de America")


## Podemos ver el color por pais
gapminder %>% filter(continent=="Americas") %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = country))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa de vida de America")

## Filtrar por año
## Podemos ver el color por pais y filtrado po año 2007
gapminder %>% filter(continent=="Americas" & year==2007) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = country))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa de vida de America en el año 2007")

## Filtrado en año de 1957
gapminder %>% filter(continent=="Americas" & year==1957) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = country))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa de vida de America en el año 1957")

## Podemos ver en las graficas que para el año de 2007 subio la expectativa de vida

## Ver que continentes tienen baja expectativa de vida
## Filtrado en año de 2007
gapminder %>% filter(year==2007) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = continent))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa ")

## Agregar etiquetas a la poblacion y a continente
gapminder %>% filter(year==2007) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = continent))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+ggtitle("Relacion entre GDP per capita y Expectativa del año 2007")+
  labs(size="Población", color="Continente")

## Como hacer una grafica para cada año?
## Utilizamos la funcion facet_wrap
gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = continent))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+facet_wrap(~year)
  +ggtitle("Relacion entre GDP per capita y Expectativa del año 2007")+
  labs(size="Población", color="Continente")

## Adicionalmente podemos instalar la libreria viridis
## Por si queremos cambiar la paleta de colores

## Aqui se usa la libreria viridis

gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = continent))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+facet_wrap(~year)+
  scale_color_viridis(option ="D", discrete=TRUE)
+ggtitle("Relacion entre GDP per capita y Expectativa del año 2007")+
  labs(size="Población", color="Continente")

## En escala de grises
gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color = continent))+geom_point()+
  ylab("Expectativa de vida (años)")+xlab("GDP per capita")+scale_x_log10()+
  theme_classic()+facet_wrap(~year)+
  scale_color_grey()+
  ggtitle("Relacion entre GDP per capita y Expectativa del año 2007")+
  labs(size="Población", color="Continente") + ggtitle("Cambios de la expectativa de vida por año")


## Cambiar de geometria
## Expectativa de vida por continente del año 2007
## Cambio el tema
gapminder %>% filter(year==2007) %>% 
  ggplot(aes(x=continent, lifeExp, fill=continent))+geom_boxplot()+
  theme_minimal()+ylab("Expectativa de vida")+xlab("Continente")+
  labs(fill="Continente")+facet_wrap(~year)

## expectativa de vida por año de Asia
gapminder %>% filter(continent=="Asia") %>%
  mutate(year1=as.factor(year)) %>%  ## cambiamos year como factor estaba como int
  ggplot(aes(x=year1, lifeExp, fill=year1))+geom_boxplot()+
  theme_classic()+ylab("Expectativa de vida")+xlab("Continente")+
  labs(fill="Continente")

str(gapminder)

## Observamos distribucion de datos con geom_point
## Quitamos la funcion mutate
## Quitamos color
## Aqui se trata la variable "year" como variable continua y no categorica
gapminder %>% filter(continent=="Asia") %>%
  ggplot(aes(x=year, lifeExp))+geom_point()+
  theme_classic()+ylab("Expectativa de vida")+xlab("Continente")


## Sacamos la media de expectativa de vida por año

gapminder %>% filter(continent=="Asia") %>%
  group_by(year) %>% summarise(mean_lifeexp=mean(lifeExp, na.rm = T)) %>% ## Se creó una varible para sacar la media
  ggplot(aes(x=year,y=mean_lifeexp))+geom_point()+geom_line()+ ## Une a los puntos con una linea
  theme_classic()+ylab("Expectativa de vida")+xlab("Año") +ggtitle("Cambios de la expectativa de vida por año")

## Aqui usamos la libreria ggthemes

## Ponemos un intercepto para expicar que pudo haber un antes y un despues
gapminder %>% filter(continent=="Asia") %>%
  group_by(year) %>% summarise(mean_lifeexp=mean(lifeExp, na.rm = T)) %>% ## Se creó una varible para sacar la media
  ggplot(aes(x=year,y=mean_lifeexp))+geom_point()+geom_line()+ ## Une a los puntos con una linea
  theme_gdocs()+ylab("Expectativa de vida")+xlab("Año") +ggtitle("Cambios de la expectativa de vida por año")+
  labs(subtitle = "Datos de gapminder", 
       caption = "Visualizacion por: Erick Vázquez")+ ## En labs tambien podemos usar la funcion "title" 
  geom_vline(xintercept = 1980, linetype= "dotted", color="red")
  
## Librerias de bases de datos precargadas en R

## Ver las bases de datos precargadas
data()

head(mtcars)
head(airquality)

## Ver la descripcion de la base de datos
?iris
?airquality

## Instalar paqueteria de datos

## Aqui usamos la libreria datos
head(millas)
str(millas)
## Cunatas filas y columnas hay en los datos
nrow(millas)
ncol(millas)

?millas


## Crear grafico con ggplot

ggplot(data = millas) + ## Se llaman a los datos
  geom_point(mapping = aes (x = cilindrada, y = autopista)) ## Que tipo de grafico
## geom_point para gradicos de dispersion
## Relacion negativa entre tamaño de motor y eficencia del combustible

ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = ciudad))

## Plot con R normal
plot(millas$cilindrada, millas$autopista,
     xlab = "Cilindrada", ylab = "Autopista")

##Clase vs traccion
ggplot(data = millas) +
  geom_point(mapping = aes(x = clase, y = traccion))  

str(millas)


## Graficos esteticos
## ver que clase pertenece cada auto
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista, color = clase))
## Automoviles de dos asientos son depotivos

## Tambien podemos pedirle que los ordene por tamaño
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista, size = clase))
## advertencia porque mapear una variable discreta  a una estetica de orden
## no es buena idea

## alpha sirve para hacer transparente las figuras
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista, alpha = clase))

## Shape sirve para cambiar la forma de las figiuras
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista, shape = clase))
## ggplot solo puede usar 6 formas a la vez
## Por eso Suv no aparece

## PREGUNTA por que color no sale azul en este grafico?
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista, color = "blue"))

## Separar los graficos en clase
ggplot(data = millas) +
  geom_point(mapping = aes(x= cilindrada, y = autopista))+
  facet_wrap(~clase, nrow = 2)

##  Hacer un geom_smooth
ggplot(data = millas) +
  geom_smooth(mapping = aes(x= cilindrada, y = autopista, linetype= traccion, color = traccion))


