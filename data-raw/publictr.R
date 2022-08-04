library(tidyverse)

df <- read_delim("demo package/demo/data raw/publictr.csv", 
                  delim = ";", escape_double = FALSE, 
                  locale = locale(encoding = "WINDOWS-1252"), 
                  trim_ws = TRUE)

df[df == "..."] <- NA

publictr <- df %>% 
  select(c(5, 13, 17:20))

names(publictr) <- c("Jahr", "Quartal", "Typ", "Anzahl Unternehmen", 
                     "beförderte Personen [1000]", "Personenkilometer [1000]")
publictr

save(publictr, file= "publictr.rda" )

