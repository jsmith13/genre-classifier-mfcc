## compile the two halves of the dataset into a single csv file
# the compiled file is too large to fit into RAM, so we will write it line by line

# load the first half
load("MFCC_descriptors_part1")

# write the first line w/ headers
write.table(MFCC_descriptors[1, ], file = "MFCC_descriptors_compiled.csv", append = FALSE, quote = FALSE, sep = ",", row.names = FALSE, col.names = TRUE)

# append the remaining lines w/o headers
for (i in 2:dim(MFCC_descriptors)[1]) {
  write.table(MFCC_descriptors[i, ], file = "MFCC_descriptors_compiled.csv", append = TRUE, quote = FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
}

# remove first from memory
rm(MFCC_descriptors)

# load the second half
load("MFCC_descriptors_part2")

# append the second half lines w/o headers
for (i in 1:dim(MFCC_descriptors)[1]) {
  write.table(MFCC_descriptors[i, ], file = "MFCC_descriptors_compiled.csv", append = TRUE, quote = FALSE, sep = ",", row.names = FALSE, col.names = FALSE)
}

