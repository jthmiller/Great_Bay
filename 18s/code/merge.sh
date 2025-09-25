conda activate qiime2-amplicon-2024.5


qiime feature-table merge-seqs \
    --i-data ~/NERRs-18s-metabarcoding/runs/NERRGBGTMSFSS-18SNX032624/qiime_out/NERRGBGTMSFSS-18SNX032624_rep-seqs.qza \
    --i-data ~/NERRs-18s-metabarcoding/runs/NERRGBGTMHE-18SNX013024/qiime_out/NERRGBGTMHE-18SNX013024_rep-seqs.qza \
    --i-data ~/NERRs-18s-metabarcoding/runs/NERRABGBHE-18SNX030524/qiime_out/NERRABGBHE-18SNX030524_rep-seqs.qza \
    --i-data ~/NERRs-18s-metabarcoding/runs/NERRABGBJC-18SNX010424/qiime_out/NERRABGBJC-18SNX010424_rep-seqs.qza \
    --i-data 18s/runs/GB2022-18SNX090525/qiime_out/GB2022-18SNX090525_rep-seqs.qza \
    --i-data 18s/runs/GB2021-18SNX090425/qiime_out/GB2021-18SNX090425_rep-seqs.qza \
    --i-data 18s/runs/Wells20192022-18SNX090225/qiime_out/Wells20192022-18SNX090225_rep-seqs.qza \
    --i-data 18s/runs/GB2020-18SNX090325/qiime_out/GB2020-18SNX090325_rep-seqs.qza \
    --o-merged-data  18s/output/GB_rep-seqs.qza

qiime feature-table merge \
    --i-tables ~/NERRs-18s-metabarcoding/runs/NERRGBGTMSFSS-18SNX032624/qiime_out/NERRGBGTMSFSS-18SNX032624_table.qza \
    --i-tables ~/NERRs-18s-metabarcoding/runs/NERRGBGTMHE-18SNX013024/qiime_out/NERRGBGTMHE-18SNX013024_table.qza \
    --i-tables ~/NERRs-18s-metabarcoding/runs/NERRABGBHE-18SNX030524/qiime_out/NERRABGBHE-18SNX030524_table.qza \
    --i-tables ~/NERRs-18s-metabarcoding/runs/NERRABGBJC-18SNX010424/qiime_out/NERRABGBJC-18SNX010424_table.qza \
    --i-tables 18s/runs/GB2022-18SNX090525/qiime_out/GB2022-18SNX090525_table.qza \
    --i-tables 18s/runs/GB2021-18SNX090425/qiime_out/GB2021-18SNX090425_table.qza \
    --i-tables 18s/runs/Wells20192022-18SNX090225/qiime_out/Wells20192022-18SNX090225_table.qza \
    --i-tables 18s/runs/GB2020-18SNX090325/qiime_out/GB2020-18SNX090325_table.qza \
    --o-merged-table 18s/output/GB_table.qza




