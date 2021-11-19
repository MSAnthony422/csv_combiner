#Michael Soriano
#PMG CSV Combiner
#11/18/21

#Gets list of all files/csv's in the fixtures folder
filenames = list.files("fixtures", patter = "*.csv",full.names = FALSE)

#initializes combined df variable
listOfDF = list()
combinedCSV = data.frame()

for (i in 1:length(filenames)) {
  print(filenames[i])
  nameCSV = filenames[i]
  fileVar = paste("C:/Users/micha/OneDrive/PMG Coding Challenge/ProgrammingChallenges-master/ProgrammingChallenges-master/csv-combiner/fixtures/",nameCSV, sep = "" )
  df = read.csv(file = fileVar)
  newCOL = rep_len(nameCSV,lengths(df[1]))
  df$filename = newCOL
  #listOfDF[[i]] = df
  combinedCSV = rbind(combinedCSV,df)
  }

write.csv(combinedCSV, file = "combined.csv", row.names = FALSE)
read.csv(file = "combined.csv")
