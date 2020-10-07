#############################################  
### R-LADIES NATAL ########################## 
### Tema: intro ao ggplot e dplyr ########### 
### ministrante: Mahayana Godoy #############
### Outubro 2020 ############################
#############################################

#### Comandos basicos: R como calculadora

2+2

2^3

14-1

#### funcoes

sqrt(81)

log(2)

exp(5)

## carregando bibliotecas

library(gapminder)
library(tidyverse)

## vendo o dataset

gapminder

## inspecionando variaveis

str(gapminder)

?gapminder

## salvando em environment

gm <- gapminder



## acessando as variaveis

gapminder$continent


## acessando as variaveis como argumento de funcao

unique(gapminder$continent)


summary(gapminder)


####################
### VISUALIZACAO ###
####################

## 
## ## sintaxe basica
## 
## ggplot(dados, aes(x = variável_explicativa, y = variável_resposta))
## 


# dados e estetica

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp))


 # dados, estetica e geometria

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp))+
  geom_point()


# verificando os anos da amostra

unique(gapminder$year)

gapminder



# filtrando conjunto de dados

gapminder %>% 
  filter(year == 2007)


# filtrando dados 

gapminder %>% 
  filter(country == "Brazil")

# filtrando e salvando dados 

brasil <- gapminder %>% 
  filter(country == "Brazil")


# combinando select e filter

gapminder %>% 
  select(gdpPercap, lifeExp, year) %>% 
  filter(year == 2007)



# erro! pq o codigo abaixo esta errado?

 gapminder %>%
   select(gdpPercap, lifeExp) %>%
   filter(year == 2007)


# grafico basico

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point()

# mais informacoes

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(shape = continent))


# mais informacoes 2

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent))


# tema bw

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent))+
  theme_bw()


# tema classic

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent))+
  theme_classic()


# ajustanto pontos: alpha

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent), alpha = 0.5)+
  theme_bw()


# ajustando pontos: shape

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent), shape = 2)+
  theme_bw()


# ajustando pontos: size

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent, size = pop), shape = 2)+
  theme_bw()



# informacao

gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(., aes(gdpPercap, lifeExp))+
  geom_point(aes(color = continent), alpha = 0.5)+
  theme_bw()+
  labs(title = "Relação entre PIB per capta e Expectativa de vida em 2007", x = "PIB per capta", y = "Expectativa de vida (em anos)")



##########################################################################
####### FACA O DESAFIO APRESENTADO NO SLIDE ANTES DE CONTINUAR ###########
##########################################################################


#### Continuando onde o desafio parou

gapminder %>% 
  ggplot(., aes(year, lifeExp))+
  geom_point(alpha = 0.5, aes(color = continent))+
  theme_bw()


# usando facet_wrap

gapminder %>% 
  ggplot(., aes(year, lifeExp))+
  geom_point(alpha = 0.5, aes(color = continent))+
  theme_bw()+
  facet_wrap(~ continent)

# excluindo a Oceania

 gapminder %>%
  filter(continent == "Africa" | continent == "Americas" | continent == "Asia" | continent == "Europe") %>%
  ggplot(., aes(year, lifeExp))+
  geom_point(alpha = 0.5, aes(color = continent))+
  theme_bw()+
  facet_wrap(~ continent)

 ## OU

gapminder %>%
  filter(continent != "Oceania") %>%
  ggplot(., aes(year, lifeExp))+
  geom_point(alpha = 0.5, aes(color = continent))+
  theme_bw()+
  facet_wrap(~ continent)


# excluindo a Oceania, 4 colunas

gapminder %>% 
  filter(continent != "Oceania") %>% 
  ggplot(., aes(year, lifeExp))+
  geom_point(alpha = 0.5, aes(color = continent))+
  theme_bw()+
  facet_wrap(~ continent, ncol = 4)


##########################################################################
####### FACA O DESAFIO APRESENTADO NO SLIDE ANTES DE CONTINUAR ###########
##########################################################################


###### Continuando...


## Codigo base, mas nao temos a media!

##   ggplot(., aes(year, media))+
##   geom_line(aes(color = continent))+
##   theme_bw()
## 

# novo conjunto de dados

  gapminder %>% 
  group_by(year, continent) %>% 
  summarise(media = mean(lifeExp))


# novo conjunto de dados: apenas ano

  gapminder %>% 
  group_by(year) %>% 
  summarise(media = mean(lifeExp))


# novo conjunto de dados: apenas pais

  gapminder %>% 
  group_by(continent) %>% 
  summarise(media = mean(lifeExp))


# combinando informacoes

gapminder %>% 
  group_by(year, continent) %>% 
  summarise(media = mean(lifeExp)) %>% 
  ggplot(., aes(year, media))+
  geom_line(aes(color = continent))+
  theme_bw()


#################################################
####### VAMOS FAZER UM ULTIMO DESAFIO ###########
#################################################

