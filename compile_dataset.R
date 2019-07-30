## compile the smaller portions of the dataset into a single csv file
# the compiled file is too large to fit into RAM, so we will write it line by line

# load the first portion
load("MFCC_descriptors_part1")

# write the first portion with headers
data.table::fwrite(MFCC_descriptors.1, file = "~/MFCC_descriptors_compiled.csv", append = FALSE)

# remove first portion from memory
rm(MFCC_descriptors.1)

# write the remaining portions
for (i in 2:4){
  # load the current portion
  load(paste("MFCC_descriptors_part", i, sep = ""))
  
  # append the contents to the csv file
  data.table::fwrite(get(paste("MFCC_descriptors", i, sep = ".")), file = "~/MFCC_descriptors_compiled.csv", append = TRUE)
  
  # remove the R table from memory
  rm(list = paste("MFCC_descriptors", i, sep = "."))
}

