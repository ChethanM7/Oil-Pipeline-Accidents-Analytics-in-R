op=read.csv("new.csv")

op$Net.Loss..Barrels.=op$Unintentional.Release..Barrels.+op$Intentional.Release..Barrels.-op$Liquid.Recovery..Barrels.
write.csv(op,file="new111.csv")