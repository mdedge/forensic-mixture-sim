This is a brief simulation of a forensic mixture using the forensim package in R. 

The R script STR_SNP_probabilityExclusion.R simulates mixtures with a specified number of contributors using either 15 forensic STRs (with allele frequencies from a sample of Tu people from China) or a user-specified number of simulated SNPs (i.e. single-nucleotide polymorphisms). The script computes the probability that a random person can be excluded as a contributor to the mixture. (A person can be excluded as a contributor if she carries an allele that does not appear in the mixture, as long as we can neglect the possibility of genotyping error.)

Please examine the probability of exclusion for 15 STRs and varying numbers of SNPs, altering the number of contributors to the mixture. You can shoose the numbers of SNPs and numbers of contributors to use, but some suggestions are in the file. Make plots that show how the probability of exclusion depends on the number of contributors and the number of markers used.

How do STRs and SNPs compare as sources of information for excluding a random person from a mixture? Generally, hundreds of thousands of SNPs can be genotyped for the same price as 15 STRs (or less). If your main goal was to be able to exclude people from mixtures, would you use SNP or STR genotyping?
