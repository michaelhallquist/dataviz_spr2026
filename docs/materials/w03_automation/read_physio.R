#change working directory to where the files live on your computer
setwd("~/TresorSync/Teaching/Data Management and Visualization UNC/dataviz_spr2026/materials/w03_automation")
library(dplyr)

# Task 1: how would we rewrite the script to avoid the need for setwd?

#locate IBI series for all couples based on file name
ibifiles <- list.files(path="ecg_physio", pattern=".*negint.*\\.txt\\.gz", full.names=TRUE)

#infer the ID and position in the room based on the file name (these are file-level attributes)
ids <- as.numeric(sub(".*/(8[0-9]{3}).*", "\\1", ibifiles, perl=TRUE))
ids <- sub("ecg_physio/", "", ibifiles, fixed=TRUE)
idsplit <- strsplit(ids, "_")
ids <- sapply(idsplit, "[", 1)
ids <- sapply(idsplit, function(fsplit) { fsplit[1] })

position <- sub(".*/8[0-9]{3}_([lr])_.*", "\\1", ibifiles, perl=TRUE, ignore.case = TRUE)

df <- data.frame(ids=ids, ibifiles=ibifiles, position=position, stringsAsFactors = FALSE)

allibi <- c()
for (i in 1:length(ibifiles)) {
  dataset <- read.table(ibifiles[i], col.names=c("time", "ibi"))
  dataset$PTNUM <- factor(ids[i])
  dataset$position <- factor(position[i])
  allibi <- rbind(allibi, dataset)
}

# Task 2: did we miss or mess up import of any files?

# Task 3: how can we write a function that reads one file?

# Task 4: how can we avoid repeated rbind calls -- growing data.frame?

#determine which couples are missing data for one person
tb <- as.data.frame(table(ids))

# Task 5: how can we do this counting with dplyr?

#use set comparison to determine positions of missing partners in the id list
missingPartner <- ids %in% tb$ids[tb$Freq < 2]

#equivalent approach using a regular expression with IDs joined by | "or"
#missingPartner <- grepl(as.character(paste(tb$ids[tb$Freq < 2], collapse="|")), ids, perl=TRUE)

#could potentially remove these from the import prior to the read above
ibifiles <- ibifiles[!missingPartner]
ids <- ids[!missingPartner]
position <- position[!missingPartner]

# Task 6: how could we remove data from allibi where the partner is missing?

#if one wanted to conduct couple-specific data processing, the split function in base R divides a data.frame on a factor
physio_split <- split(allibi, allibi$PTNUM)

#equivalent to dplyr's group_by
physio_split_dplyr <- allibi %>% group_by(PTNUM, position)

# Task 7: How could we screen for invalid values on time or IBI?
