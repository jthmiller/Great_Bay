

proj=GB18s

## alignment and tree
qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences 18s/output/GB_rep-seqs.qza \
   --o-alignment 18s/output/${proj}_aligned-rep-seqs \
   --o-masked-alignment 18s/output/${proj}_masked-aligned-rep-seqs.qza \
   --o-tree 18s/output/${proj}_unrooted-tree.qza \
   --o-rooted-tree 18s/output/${proj}_rooted-tree.qza \
   --p-n-threads 24


### broken conda env
proj=GB18s
depth=500
### Core Metrics
qiime diversity core-metrics-phylogenetic \
    --i-phylogeny 18s/output/${proj}_rooted-tree.qza \
    --i-table 18s/output/GB_table.qza \
    --p-with-replacement \
    --p-sampling-depth ${depth} \
    --m-metadata-file 18s/output/qiime-metadata.tsv \
    --output-dir 18s/output/${proj}_${depth}_core-metrics

qiime diversity alpha-phylogenetic \
  --i-table 18s/output/GB_table.qza \
  --i-phylogeny 18s/output/${proj}_rooted-tree.qza \
  --p-metric faith_pd \
  --o-alpha-diversity 18s/output/${proj}_samp_filtered_core-metrics-18s/output/faith_pd

qiime diversity alpha-rarefaction \
    --i-table 18s/output/${proj}_filtered-table.qza \
    --i-phylogeny 18s/output/${proj}_rooted-tree.qza \
    --p-max-depth 300000 \
    --m-metadata-file metadata/18s_sample_metadata_5-20.tsv \
    --p-min-depth 1000 \
    --p-steps 15 \
    --o-visualization 18s/output/${proj}_samp_filtered_core-metrics-18s/output/alpha-rarefaction

qiime diversity alpha-group-significance \
    --i-alpha-diversity 18s/output/${proj}_samp_filtered_core-metrics-18s/output/faith_pd.qza \
    --m-metadata-file metadata/18s_sample_metadata_5-20.tsv \
    --o-visualization 18s/output/${proj}_samp_filtered_core-metrics-18s/output/alpha-group-significance


qiime feature-table filter-features \
    --i-table 18s/output/${proj}_filtered-table.qza \
    --m-metadata-file 18s/output/${proj}_hybrid_taxonomy.qza \
    --o-filtered-table 18s/output/filtered-by-features_${proj}.qza

qiime taxa barplot \
     --i-table 18s/output/filtered-by-features_${proj}.qza \
     --i-taxonomy 18s/output/${proj}_hybrid_taxonomy.qza \
     --o-visualization 18s/output/${proj}_taxa-barplot \
     --m-metadata-file metadata/18s_sample_metadata_5-20.tsv