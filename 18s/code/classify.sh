proj=GB18s


## Try CRUX database
## taxonomy
maxaccepts=10
query_cov=0.8 
perc_identity=0.90 
weak_id=0.80
refreads=${refreads:-/home/users/jtm1171/refdbs/18s/CRUX/18S_.fasta.qza}
reftax=${reftax:-/home/users/jtm1171/refdbs/18s/CRUX/18S_taxonomy.qza}
sklearn=${sklearn:-/home/users/jtm1171/refdbs/18s/CRUX/18s_crux_nb-classifier.qza}

qiime feature-classifier classify-consensus-vsearch \
    --i-query 18s/output/GB_rep-seqs.qza \
    --i-reference-reads ${refreads} \
    --i-reference-taxonomy  ${reftax} \
    --p-threads 41 \
    --p-perc-identity ${perc_identity} \
    --p-query-cov ${query_cov} \
    --p-maxhits all \
    --p-maxrejects all \
    --p-weak-id ${weak_id} \
    --p-maxaccepts ${maxaccepts} \
    --p-min-consensus 0.51 \
    --o-classification 18s/output/${proj}_vsearch_taxonomy_10accepts_90perc \
    --o-search-results 18s/output/${proj}_vsearch_taxonomy_10accepts_90perc-tophits


## hybrid vsearch-sklearn
refreads=${refreads:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-seqs-extract-reads_former_primer_config.qza}
   reftax=${reftax:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-tax.qza}
sklearn=${sklearn:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-seqs-pid_0.65-classifier.qza}
dbname="SILVA_138_99"

qiime feature-classifier classify-hybrid-vsearch-sklearn \
  --i-query 18s/output/GB_rep-seqs.qza \
  --i-classifier ${sklearn} \
  --i-reference-reads ${refreads} \
  --i-reference-taxonomy  ${reftax} \
  --p-threads 12 \
  --p-query-cov ${query_cov} \
  --p-perc-identity ${perc_identity} \
  --p-maxrejects all \
  --p-maxaccepts ${maxaccepts} \
  --p-maxhits all \
  --p-min-consensus 0.51 \
  --p-confidence 0.7 \
  --o-classification 18s/output/${proj}_${dbname}_hybrid_taxonomy
 














### Make output tables
conda activate qiime2R
export LD_LIBRARY_PATH='/usr/lib/jvm/java-1.11.0-openjdk-amd64/lib/server:$LD_LIBRARY_PATH'
qiime2_output_tables.r 18s/output/${proj}_filtered-table.qza 18s/output/${proj}_hybrid_taxonomy.qza 18s/output/${proj}_rep-seqs.qza ${proj}

