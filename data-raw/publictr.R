library(tidyverse)

publictr <- read_delim("data-raw/publictr.csv",
                  delim = ";", escape_double = FALSE,
                  locale = locale(encoding = "WINDOWS-1252"),
                  trim_ws = TRUE)

publictr[publictr == "..."] <- NA

publictr <- publictr %>%
  select(c(5, 13, 17:20)) %>%
  select(c(1:3, 5:6, 4))

publictr[ ,2] <- substr(publictr$`2_Auspraegung_Label`, 1, 1)


names(publictr) <- c("Jahr", "Quartal", "Typ",
                     "Personen", "Personenkilometer",
                     "ausgewertete_Unternehmen")

publictr$Personen <- as.numeric(publictr$Personen)*1000
publictr$Personenkilometer <- as.numeric(publictr$Personenkilometer)*1000
publictr$ausgewertete_Unternehmen <- as.numeric(publictr$ausgewertete_Unternehmen)
publictr$Quartal <- as.numeric(publictr$Quartal)
publictr

save(publictr, file= "publictr.rda" )

