require(stringr)

incomingdegrees <- rep(0,190)
incomingdifftotal <- rep(0,190)
incomingratetotal <- rep(0,190)

for (i in 1:190)
{
  #find the corresponding imports entry
  index <- which(as.character(df$country) == as.character(obesity$Country)[i])
  
  #for each country in the list, add those countries to incoming, and add this country to their outgoing
  for (j in 1:190)
  {
    if (!is.na(str_locate(df$partners[index],as.character(obesity$Country[j]))[1]))
    {
      incomingdegrees[i] = incomingdegrees[i] + 1
      incomingdifftotal[i] = incomingdifftotal[i] + abs(obesity$obrate[i] - obesity$obrate[j])
      incomingratetotal[i] = incomingratetotal[i] + obesity$obrate[j]
    }
  }
  
}

export_differential <- incomingdifftotal/incomingdegrees
