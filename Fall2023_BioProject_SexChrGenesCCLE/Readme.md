# Iteration 2 of genomics CURE

In this iteration of the online genomics CURE, we implemented an asynchronous journal club, added scientific writing prompts, changed the format of peer review for Module 7, and added short weekly quizzes as formative assessments for the students.

# Students and instructors

There were 45 online biology students who consented to take part in this iteration of the CURE.  The instructor team consisted of 4 scientists including Dr. Melissa Wilson, lead investigator in the Sex Chromosomes Lab and passionate educator in the Arizona State University School of Life Sciences, along with a senior scientist in her lab, and two students who served as teaching assistants.  Dr.Wilson was the lead instructor, but the rest of the team worked together with her to grade assignments and lead research and communication efforts with the students.  

# Research Project

Although there is a known sex bias in cancer, sex chromosomes are typically excluded from genomic analyses because of unique analytical challenges associated with their sequence and regulation. Sex chromosome genes include tumor suppressors, epigenetic regulators, immune genes, and more which can impact cancer progression and drug response. A common resource used in cancer research is the Cancer Cell Line Encyclopedia (CCLE), which contains 947 human cancer cell lines used as model systems for studying the biology and treatment of cancer. In this iteration of the CURE, students inferred the sex chromosome complement using the expression of genes on the X and Y chromosomes across these cell lines. We expected the expression of X and Y chromosome genes to match the expected sex chromosome complement given the reported sex of the patient (e.g., typically XX genotype in cell lines from female patients and XY for male patients). Instead we found discordance between the reported sex of the patient and the inferred sex chromosome complement in approximately half of the samples. Determining and comparing the sex chromosome complement is important for assessing how well cell line models recapitulate primary tumors and may reveal molecular underpinnings of sex differences in cancer.

# Data used

For the second iteration of the CURE, RNA sequencing gene expression for the Cancer Cell Line Encyclopedia (CCLE) was downloaded from the project’s public data portal (https://depmap.org/portal/download/all/, CCLE 2019 dataset, CCLE_RNAseq_genes_counts_20180929.gct.gz) (8).  The data table was converted to a comma-separated value (csv) table by removing the first two rows for easy loading into data frames in R.

# Directory Structure

In the Fall2023_BioProject_SexChrGenes_CCLE directory, you will find: 
1. 'Module' directories for each module containing the Learn Bio/Stats, Learn Coding, and Learn Professional Development pages given to the students on Canvas
2. 'Journal Club' directory describes the publications we distributed to the students using Perusall assignments on Canvas
3. 'Template_Code' directory includes the code distributed to students to help them do the analysis with examples of results
4. 'Assessment_and_Grading' includes pre- and post- learning assessments and code that was used to analyze learning gains
