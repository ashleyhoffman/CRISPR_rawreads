counts_matrix <- cbind(rawread_final$sgrna, rawread_final$K562.311CAs9.RepA.p6_batch3, rawread_final$K562.311CAs9.RepB.p6_batch3)
rowData_2 <- data.frame(sgRNA_id = rawread_final$sgrna,
                                   gene = rawread_final$gene_splits_2)
colData_2 <- data.frame(samplename = c("sgrna", "K562.311CAs9.RepA.p6_batch3", "K562.311CAs9.RepB.p6_batch3"),
                      # timepoint naming convention: 
                      # T0 -> reference, 
                      # T1 -> selected
                      timepoint = c("T0","T1","T1"))
se = SummarizedExperiment(assays=list(counts=counts_matrix),
                          rowData=rowData_2, colData=colData_2)
pse <- createPoolScreenExp(se)
