#general form for adding new data to obesity

#might need this if numbers have commas in them
# total_imports <- transform(total_imports, V3 = gsub("\\$    ","",total_imports$V3))

#start loop
vec <- rep(NA,194)

for (i in 1:length(blah[,1]))
{
  for (j in 1:194)
  {
    if (as.character(blah$countryname[i]) == as.character(flag$country[j]))
    {
      
      if (is.na(flag$fertility[j]))
        {vec[j] <- blah$frate[i]}
      else
        {vec[j] <- flag$fertility[j]}
    }
  }
}

print(vec)

# only run this line when you are sure that vec looks okay!
flag <- transform(flag,fertility=vec)
viewData(flag)

vec[4] <- 3.10
vec[7] <- 1.75