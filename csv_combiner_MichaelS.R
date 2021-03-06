#Michael Soriano
#PMG CSV Combiner
#11/18/21

#sets the working directory to downloaded csv_combiner folder
setwd("C:/Users/micha/OneDrive/PMG Coding Challenge/ProgrammingChallenges-master/ProgrammingChallenges-master/csv-combiner")

#Gets list of all files/csv's in the fixtures folder
filenames = list.files("fixtures", patter = "*.csv",full.names = FALSE)

#initializes combined df variable
combinedCSV = data.frame()

#for loop that iterates for each file in fixtures folder based on filenames list
for (i in 1:length(filenames)) {
  nameCSV = filenames[i] #created variable for current csv file
  fileVar = 
    paste("./fixtures/",nameCSV, sep = "" ) #concatenates folder name with current file
  df = read.csv(file = fileVar) #reads the current csv and assigns it to a variable
  newCOL = rep_len(nameCSV,lengths(df[1])) #creates a new column that attaches the filename based on the length of the csv 
  df$filename = newCOL #attaches prev column to dataframe
  combinedCSV = rbind(combinedCSV,df) #adds current df to the combined csv variable
  }

#outputs the combined csv to working directory
write.csv(combinedCSV, file = "combined.csv", row.names = FALSE) 

#check if file is readable
checkNew = read.csv(file = "combined.csv")

