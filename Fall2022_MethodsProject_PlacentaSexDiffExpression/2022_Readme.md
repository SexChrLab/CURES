# Course-Based Undergraduate Research Experience (CURE) Project Description:
See https:[//www.biorxiv.org/content/10.1101/2023.11.29.569298v1](url)] for a full description.  This CURE included 15 online students who completed the prerequisite course (BIO439:ComputingforResearch)introducing genomics software tools in a Linux/Unix shell environment to learn, apply, and write code to process high-throughput sequencing data. For the genomic research experience, we generated custom learning materials and leveraged remotely accessible resources on a high-performance computing cluster to address a novel research question: the effect of changing quality trimming parameters of minimum read length (minlen) and quality score (trimq) for RNA sequencing reads on the discovery of sex-based differential gene expression in the human placenta.  In a previously published study (Olney et al. 2022), the instructors of this CURE identified genes that were differentially expressed between male and female placentas (males and females;https://github.com/SexChrLab/Placenta_Sex_Diff) from full-term pregnancies using limma-voom analysis workflow with BBDuk trimming software. Instructor experience and literature show a variety of thresholds to determine low-quality RNA sequencing reads. This led to the research question of how robust the published sex differential gene expression profile was to changes in trimming parameters.  

+ Add Olney reference 
## Distribution of Student Analysis
   15 students were led by two co-instructors and one graduate teaching assistant in a 7.5-week fully asynchronous online course.

5) Supplemental Resources: Please refer to https://github.com/SexChrLab/Genomics_CURE/tree/a5751231bd6b117b80dea0760e9dc0f40b957a03/Courses/Trimming_FallB_2022 to access files used in the research analysis pipeline including:

data_generation

Contains all snakefiles used to generate and process trimmed data so it can be passed into differential expression pipeline.

cluster_submission

Contains sbatch scripts used to run snakefiles on ASU Agave biocomputing cluster

Differential_Expression

Contains Rmd files of the limma-voom differential expression pipeline, modified to run analysis for the CURE. This includes code to do pairwise comparison of two differentially expressed gene lists and an upset comparing the entire range of data sets.

+ Place Holder for Module 2 Intro RMDs link (Otherwise add subdirectory for scripts.zip)

5) Syllabus (Include Biostar info -version?) Module 1 Background knowledge and project aims are presented.
6) Learning Objectives

ADD Student Assessment and Templates Subdirectory
1) pre/post learning assignment (need instructor access)
2) + Done Weekly Project Report Template and Rubric
3) + Done Mini-manuscript Template
4) * Manuscript Rubric
4) * Peer Review Rubric
5) ? Was there a rubric for coding assignments?

ADD Module Subdirectories to include
1) + Done learning pages
2) * assignments (which RMDs/data/files for 2022?)

* Review Subdirectory for Course Assessment: Analysis of course data (pre/post, weekly progress report semantics, slack activity)
   
ADD Instructor notes/resources:
1) * Office hours / lab meetings-- helpful hints?
