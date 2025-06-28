#Hoang Anh Vu
#March 26, 2025
#Internship -- mini project

setwd("/Users/anhvh/Documents/Bio_data")

#loaded needed packages
library(biomaRt)
library(RiboCrypt)
library(readr)
library(dplyr)
library(ORFik)
library(Biostrings)

transcript_ids <- read.csv("PRJNA579539-homo_sapiens.csv")$Transcript_ID

# Connect to Ensembl Biomart
ensembl <- useEnsembl(biomart = "ensembl", dataset = "hsapiens_gene_ensembl", host = "https://www.ensembl.org")

# Get all transcript IDs for the selected project (PRJNA579539)
# You may need to adjust the dataset or use a filter to restrict the query to your specific project or organism
# For simplicity, this retrieves all the human transcripts.

# Step 1: Get transcript metadata
transcript_data <- getBM(
  attributes = c("ensembl_transcript_id", "external_gene_name", "ensembl_gene_id", "gene_biotype"),
  mart = ensembl
)

# Print transcript data to check
print(transcript_data)

# Now, retrieve cDNA (or coding) sequences for these transcripts
# This example retrieves cDNA sequences for each transcript

# Step 2: Get cDNA sequences for those transcripts
sequences_df <- getSequence(
  id = transcript_data$ensembl_transcript_id,
  type = "ensembl_transcript_id",
  seqType = "cdna",
  mart = ensembl
)

# Step 3: Merge sequence data with transcript metadata
sequences_merged <- merge(
  sequences_df,
  transcript_data,
  by = "ensembl_transcript_id"
)


# Combine all sequences into one table
head(sequences_merged)

# Print the resulting dataframe with all transcript sequences
print(sequences_merged)

# Optionally, you can save this table as a CSV file for later use
write.csv(sequences_merged, "PRJNA579539_transcript_sequences.csv", row.names = FALSE)


sequences_data <- read.csv("PRJNA579539_transcript_sequences.csv")

head(sequences_data)

#orfs <- findORFs(sequences_data, startCodon = "ACTB", longestORF = TRUE)
orfs <- sequences_data %>% 
  filter(external_gene_name == "ACTB")

head(orfs)

write.csv(orfs, "PRJNA579539_ACTB_ENSG00000075624_transcript_sequences.csv", row.names = FALSE)


transcripts <- DNAStringSet(orfs$cdna)
names(transcripts) <-orfs$ensembl_transcript_id
writeXStringSet(transcripts, "ENSG00000075624_transcripts.fa")
