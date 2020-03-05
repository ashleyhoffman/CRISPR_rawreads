#to import datasets:
setwd("~/Desktop/rawreads/Achilles_rawreads_merge/")

guide.gene = read.csv("guide_gene_map.csv",stringsAsFactors = F)      #don't need to call full file pathway b/c wd is changed
achilles = read.csv("Achilles_raw_readcounts.csv", stringsAsFactors = F)

#merging datasets
merged = merge(guide.gene,achilles, by.x = "sgrna", by.y = "X")
merged = merged[-c(2,4)]    #rm unnecessary col's

#splitting no's out of gene col
class(merged$gene)

gene_splits = sapply(strsplit(merged$gene, split = " "), "[[", 1)    #review this line
odds_only = seq(1,142280,2)
gene_splits_2 = gene_splits[c(odds_only)]

k562 = grep("K562", colnames(merged))
pDNA = grep("pDNA", colnames(merged))

merged_2 = merged[c(1,k562,pDNA)]
rawread_final = cbind(gene_splits_2,merged_2)
rawread_final = rawread_final[c(2,1,3:18)]

View(rawread_final)    #final check

write.table(rawread_final,"relevant_rawreads.txt", sep = "\t", row.names = F) #MUST specify "\t"



