#general form for adding new data to obesity

#might need this if numbers have commas in them
# total_imports <- transform(total_imports, V3 = gsub("\\$    ","",total_imports$V3))
total_imports <- transform(total_imports, V3 = as.numeric(total_imports$V3))

#start loop
vec <- rep(NA,190)

for (i in 1:length(lengthsdataweighted[,1]))
{
  for (j in 1:190)
  {
    if (as.character(lengthsdataweighted$V1[i]) == as.character(obesity$Country[j]))
    {
      vec[j] <- lengthsdataweighted$V2[i]
    }
  }
}

print(vec)

# only run this line when you are sure that vec looks okay!
obesity <- transform(obesity,USborderdegrees_wtd_bl=vec)
viewData(obesity)