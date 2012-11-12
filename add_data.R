#general form for adding new data to obesity

#might need this if numbers have commas in them
total_imports <- transform(total_imports, V3 = gsub("\\$    ","",total_imports$V3))
total_imports <- transform(total_imports, V3 = as.numeric(total_imports$V3))

)#start loop
vec <- rep(NA,190)

for (i in 1:length(total_imports[,1]))
{
  for (j in 1:190)
  {
    if (as.character(total_imports$V2[i]) == as.character(obesity$Country[j]))
    {
      vec[j] <- total_imports$V3[i]
    }
  }
}

print(vec)

# only run this line when you are sure that vec looks okay!
obesity <- transform(obesity,ppimports=vec/population)
viewData(obesity)