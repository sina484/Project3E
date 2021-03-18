Research Question: Can ZFP36L2 be a new target for an AML cancer therapeutic 
because of its ability to decrease cell proliferation, through down-regulating 
KDMs.

Histone modification factors have been of increasing interest in the scientific 
community. Histone lysine demethylases (KDMs) have been of increasing interest 
due to being deregulated in many patients with late stage cancer, most notably, 
acute myeloid leukemia (AML). (Dumdie et al, Dev Cell, 2018) have also shown 
that the mRNA decay activator, ZFP36L2, downregulated multiple KDMs by 
targeting the A-U rich regions of their 3' UTRs.

Scientific Hypothosis: Because we believe ZFP36L2 is a direct regulator of KDMs,
we hypothesis that KDM RNA-seq levels are negatively correlated to ZFP36L2 
levels in AML cell line models.

Pairwise correlation is going to be used to determine the correlation 
coefficent between ZFP36L2 and the KDMs. RNA-seq data was collected from EBI's 
RNA-seq database searching either ZFP36L2 or KDM3A-C with Homo Sapiens with 
Acute Myeloid Leukemia cell lines. Data was then extracted to an excel file. 

_____________________________________________________________________________

The only package that was needed to run this code was the
- readxl
package which is used to import our data set that was initial extracted from
EBI into our script.

_____________________________________________________________________________

#Import the excel file with target gene and associated genes data
library(readxl)
L2_real <- read_excel("Desktop/L2_real.xlsx")
View(L2_real) 

#Convert all variabes into numeric mode
L2_num<-data.matrix(L2_real, rownames.force = NA)

#Determine correlation between target and samples using the Pearson method
cor(L2_num,method=c("pearson"))

#Resulting Printout 
#             cell_line    hZFP36L2     hkDM5A        hKDM5B      hKDM5C
#cell_line  1.0000000000  0.25667734 0.07114259 -0.0007825605 -0.10147378
#hZFP36L2   0.2566773448  1.00000000 0.16926094 -0.1443925877  0.09064029
#hkDM5A     0.0711425940  0.16926094 1.00000000  0.3162001290  0.18291146
#hKDM5B    -0.0007825605 -0.14439259 0.31620013  1.0000000000  0.17137212
#hKDM5C    -0.1014737819  0.09064029 0.18291146  0.1713721195  1.00000000


______________________________________________________________________________
#Attach the L2_real file
attach(L2_real)

#Plot the relationship between ZFP36L2 and KDM5A
plot(hZFP36L2,hkDM5A,ylab="hKDM5A-C",main="hZFP36L2 vs hKDM5A-C across AML cell line models", col="blue",)

#Combine relationships of ZFP36L2 and the other two variables by using points()
points(hZFP36L2,hKDM5B,col="red")
points(hZFP36L2,hKDM5C,col="green")

#Plot the relations between ZFP36L2 and the three different targets in one figure 
par(mfrow=c(3,1))
plot(hZFP36L2,hkDM5A,ylab="hKDM5A",main="hZFP36L2 vs hKDM5A across AML cell line models (In TPM)")
plot(hZFP36L2,hKDM5B,ylab="hKDM5B",main="hZFP36L2 vs hKDM5B across AML cell line models (In TPM)")
plot(hZFP36L2,hKDM5C,ylab="hKDM5C",main="hZFP36L2 vs hKDM5C across AML cell line models (In TPM)")


#Sources
  #Scatterploting: https://www.statmethods.net/graphs/scatterplot.html

____________________________________________________________________________

Analysis of Results: From this analysis, the conclusion is that there was no 
significant correlation between ZFP36L2 and KDMs. For future experimentation, 
I would like to try to determine correlation while also attempting to normalize 
expression by also including a housekeeping gene, like GAPDH, into my 
calculation. This may mitigate the cell line to cell line variability that may 
have occurred in this experiment. My hypothesis was not correct.


