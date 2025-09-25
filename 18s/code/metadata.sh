metadata.sh

qiime tools export --input-path 18s/output/GB_table.qza --output-path 18s/output/GB_table
biom convert -i 18s/output/GB_table/feature-table.biom -o 18s/output/GB_table/feature-table.tsv --to-tsv
head -n2 18s/output/GB_table/feature-table.tsv | tr '\t' '\n' > 18s/output/samps.txt

while read samp; do
    prd=$( find 18s/runs -maxdepth 3 -name ${samp}*R1_001.fastq.gz | sed "s/\/reads.*//" | sed 's/18s\/runs\///' | sort | uniq )
    echo "$samp,$prd"
done < 18s/output/samps.txt > 18s/output/samp-metadata.csv
sed -i 's/,$/,NERRs/' 18s/output/samp-metadata.csv 

tr ',' '\t' < 18s/output/samp-metadata.csv | grep -v '^#' > 18s/output/samp-metadata.tsv
echo -e "#SampleID\tProject" > 18s/output/header.tsv
cat 18s/output/header.tsv 18s/output/samp-metadata.tsv > 18s/output/qiime-metadata.tsv

