#!/bin/bash
cd ../data/
echo "downloading data..."
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_18/gencode.v18.pc_transcripts.fa.gz
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_18/gencode.v18.annotation.gtf.gz
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_18/gencode.v18.pc_translations.fa.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM546nnn/GSM546920/suppl/GSM546920_filtered_sequence.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM546nnn/GSM546921/suppl/GSM546921_filtered_sequence.txt.gz
echo "unzipping data..."
gunzip *.gz
for file in *.txt; do
    mv ${file} ${file%.txt}.fq
done
echo "filtering transcripts...."
cd ../src/
python transcript_filter.py
echo "done."