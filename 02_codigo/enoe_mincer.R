# Remover notación cientifica
options(scipen = 999)

## Cargar librerias
library(tidyverse)
library(foreign)
library(ggplot2)
library(viridis)
library(hrbrthemes)

# Cargar bases de datos
sdemt <- read.csv("ENOEN_SDEMT122.csv")

# Nombres de las variables
str(sdemt)

## Descriptivos
summary(sdemt$ingocup)

# Filtrar
enoe_mincer <- sdemt %>% 
  filter(ingocup %in% c(500:233068))

# Y ahora volvemos a ver media y mediana de salario
summary(enoe_mincer$ingocup)

# Convertir a logaritmo el salario
enoe_mincer$log_ing <- NA
enoe_mincer$log_ing <- log(enoe_mincer$ingocup)

# summary(enoe_mincer$log_ing)
# summary(enoe_mincer$anios_esc)

# Filtrar años de escolaridad porque 99 es no especificado y no sirve
enoe_mincer <- enoe_mincer %>% 
  filter(anios_esc %in% c(0:24))

# Gráfico
ggplot(enoe_mincer,aes(x=enoe_mincer$anios_esc,y=enoe_mincer$log_ing))+geom_point(shape=21)+
  labs(
    title = paste("Grafico de dispersion"),
    subtitle = "Relacion años de escolaridad e ingreso",
    caption = "Autor: Naím Manríquez",
    x = "Años de escolaridad",
    y = "Logaritmo natural del ingreso")+theme_linedraw()+stat_smooth(method=lm,
                                                                      col="#E90F0F",
                                                                      se=FALSE,
                                                                      size=1)


# Variable de genero
enoe_mincer$genero <- enoe_mincer$sex
enoe_mincer$genero <-factor(enoe_mincer$genero, labels = c("Masculino","Femenino"))

# Variable sector de actividad
enoe_mincer$sector <- enoe_mincer$rama
enoe_mincer$sector <-factor(enoe_mincer$sector, labels = c("Construcción","Manufactura", "Comercio", "Servicio", "Otros", "Agropecuario", "NP"))

# Grafico
ggplot(enoe_mincer,aes(x=enoe_mincer$log_ing,fill=genero))+
  geom_density()+scale_x_continuous(limits=c(6,12))+
  labs(
    title=paste("Grafico de densidades superpuesto"),
    x = "Logaritmo del ingreso laboral mensual",
    y = "Densidad")


## Procedimiento para las ecuaciones mincerianas
library(fastDummies)

# Variable dicotomica para genero
enoe_mincer <-dummy_cols(enoe_mincer,select_columns=c("genero"))
# Variable dicotomica para genero
enoe_mincer <-dummy_cols(enoe_mincer,select_columns=c("sector"))


# Variable de experiencia
exp=(enoe_mincer$eda-enoe_mincer$anios_esc)
enoe_mincer<-cbind(enoe_mincer,exp=c(exp))

# Experiencia al cuadrado
enoe_mincer$exp_cuad <- enoe_mincer$exp * enoe_mincer$exp

# Variable de ingresos
Ingreso <-enoe_mincer$log_ing

# Variable de años de escolaridad
aniosEscolaridad<-enoe_mincer$anios_esc

# Experiencia
Experiencia<-enoe_mincer$exp
# Genero
Mujer<-enoe_mincer$genero_Femenino
# Servicio
Servicios<-enoe_mincer$sector_Servicio
# Agropecuario
Agropecuario<-enoe_mincer$sector_Agropecuario


# Regresión
Rg1<-lm(Ingreso~aniosEscolaridad+Experiencia+Mujer+exp_cuad+Servicios+Agropecuario,data=enoe_mincer)
summary(Rg1)

## Modelo
library(sjPlot)
library(Rcpp)

# Tabla
tab_model(Rg1,show.est=TRUE,show.se=TRUE,show.std=TRUE,show.df=TRUE,show.p=TRUE,show.fstat=TRUE,digits=2,title="Resumen del modelo",p.style="numeric_stars")



