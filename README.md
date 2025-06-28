# UTR


Title:
Provide a title agreed to by you and your mentor

The Role of 5' UTR Length in Protein Translation Efficiency

Purpose:
Provide a concise description of the purpose of the work (no more than three sentences)

The project aims to systematically determine whether there is a correlation between the length of the 5’-untranslated region (UTR) and their protein translation rates. Currently, there are two existing models for the mechanism of scanning along the 5’-UTR for the start codon: the “Tethered Model” postulates that the ribosomal scanning complex remains attached to the 5’-cap of the mRNA while scanning, and the “Untethered Model” postulates that the scanning complex disengages from the 5’-cap. The results will help differentiate between these two models; a strong correlation between 5’-UTR length and translation rate is suggestive of the “Tethered Model” as there can only be one scanning complex at a time on the 5’-UTR.

Hypothesis or Research Question*
(One sentence)

Is there a strong statistically significant relationship between 5' UTR length and protein synthesis efficiency?

Methods, Data Collection, Statistical Analysis*
Include sufficient details of the project to ensure that the project is feasible (approximately 250-300 words).

Provide a succinct, straightforward description of your role in the research or experiments you will perform. Include the controls for experimental conditions and how the data will be collected, statistically analyzed and interpreted.

The project involves literature review, data acquisition, and computational analysis. Based on prior literature, we have a dataset of protein synthesis rates for mammalian mRNAs from Schwanhäusser et al. (DOI:10.1038/nature10098). Leveraging the mRNAs in the dataset, we will determine the 5’-UTR lengths and compare them to their respective protein synthesis rates.

Many mammalian mRNAs have upstream open reading frames (uORFs), which encode short peptides. These uORFs are located in the 5’-UTR preceding the main ORF, which encodes the primary protein of the mRNA (reviewed in Jackson et al., DOI: 10.1038/nrm2838). Such uORFs typically inhibit the translation of the main ORF. Thus, we will need to identify mRNAs containing uORFs and omit them from our analysis.

Stable RNA secondary structures in the 5’-UTR are known to inhibit scanning and translation initiation. Therefore, we will use available datasets for secondary structures in mammalian mRNAs (Spitale et al DOI: 10.1038/nature14263) to omit mRNAs 5’-UTR secondary structure from our analysis.

My role will involve developing a script to automate the sorting and analysis process. The script will be written in Python, as there are sufficient packages/libraries for analysis and I am proficient. One of the scripts will retrieve mRNA sequences using the NCBI RefSeq API (https://ncbiinsights.ncbi.nlm.nih.gov/2020/10/28/gene-datasets-api/). The script will also identify the length of the 5’UTR and group mRNA based on 5’UTR length. Additional scripts will be written to segregate the dataset for analysis with regards to uORFs or 5’ UTR stable secondary structures. Prior to analysis, basic summary statistic tables will be made to remove the outliers (±3 SD). Statistical analyses such as linear regression, will be performed to examine the relationship between 5' UTR length and protein synthesis rates.

Anticipated Results*
Describe the findings of this work and any alternative approaches or plans (approximately 150 words). What results are expected from the research based on the approach?

The results of this project will quantify the impact of 5' UTR length on translation efficiency and allow us to distinguish between “Tethered” and “Untethered” models for mammalian mRNA start codon scanning. The findings will provide a foundation for future research delving into broader regulatory mechanisms, such as the differential regulation of individual mRNAs via changes in the levels of specific components of the translational complex.

It has been reported that the tethered scanning is observed in some, but not all mammalian cell lines (Bohlen et al. DOI: 10.1016/j.molcel.2020.06.005). While this seems highly unlikely, we can address it by analyzing protein synthesis rates from both cell line groups. The Schwanhäusser et al. dataset is based on protein and mRNA abundances, corrected for rates of protein degradation. As an alternative approach, we can use Ribo-Seq data, obtaining rates of protein synthesis from the ribosome density on a given mRNA. Controls would be applied to account for differences in translation elongation rates.
