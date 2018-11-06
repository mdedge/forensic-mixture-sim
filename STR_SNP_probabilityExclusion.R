#11/1/18, by Doc Edge
#This R script simulates mixtures of STRs and of SNPs
#in order to compare the probability that a random person
#can be excluded as a contributor to the mixture as a function
#of the number of SNPs included.

#There are 15 STRs being used, the 13 core CODIS loci plus two more.
#Their allele frequencies are used as calculated among a sample of Tu people
#from China. SNP allele frequencies for a user-specified number
#of SNPs are simulated.

#Errors in genotyping are ignored for the purpose of the simulation, 
#as is population structure.

#Run the below code for mixtures with 5, 10, 20, and 50 contributors,
#with 15, 200, and 1000 SNPs.

#Keep track of the median probability of exclusion for each trial,
#and make some plots to summarize the results.

#What would you say about the evidentiary value of SNPs vs. STRs
#for deciding whether a person is a likely contributor to a mixture.

#Install (if necessary) and load the forensim package
if(!("forensim" %in% installed.packages())){install.packages("forensim")}
library(forensim)

#Set parameters: How many contributors to the mixture,
#how many SNPs to simulate, and how many simulations to run.
n.contrib <- 5
n.snps <- 15
n.trials <- 20

pe.str <- numeric(n.trials)
pe.snp <- numeric(n.trials)

data(Tu)
tupop <- tabfreq(tab=Tu,pop.names=as.factor('Tu'))

#Run the simulations, saving the probability of exclusion each time.
for(i in 1:n.trials){
  tugeno <- simugeno(tab=tupop,n=n.contrib) #Simulate STR genotypes
  mixSTR<-simumix(tugeno,ncontri=n.contrib) #Gather in a mixture object
  snpsim <- simufreqD(nloc = n.snps, nal = 2, alpha = 1/2) #simulate SNP freqs
  snpfreqsim <- tabfreq(tab=snpsim,pop.names=as.factor('Tu')) #Save as tab object
  snpgeno <- simugeno(tab = snpfreqsim, n = n.contrib) #Simulate SNP genotypes
  mixSNP <- simumix(snpgeno, ncontri = n.contrib) #Gather in a mixture
  #Compute probability of exclusion for STRs and SNPs
  pe.str[i] <- PE(mix=mixSTR, freq=tupop, theta=0, byloc=FALSE)
  pe.snp[i] <- PE(mix=mixSNP, freq=snpfreqsim, theta = 0, byloc = FALSE)
}

#Summarize the probability of exclusion results.
summary(pe.str)
summary(pe.snp)
