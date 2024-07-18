# Learning Objectives for Iteration 1 (Fall 2022)

## Course Learning Objectives
General course learning objectives presented in the syllabus: 

>At the completion of this course, students will be able to:
>
>1. Understand, execute, and debug R code  
>2. Work with data structures and packages in R related to identification, visualization, and interpretation of differentially expressed genes
>3. Critically evaluate scientific literature
>4. Draft a manuscript, including reproducible methods, background, results, and discussion

## Module Learning Objectives

Learning objectives for each module were listed in the module introduction page.  

### Module 1

>***Overview***
>
>Throughout the course, our learning objectives will focus on three specific areas: biology, coding, and professional development. In this module’s Biology learning objectives, we will learn about the biology behind the placenta, the technologies used to evaluate gene expression, the preprocessing steps used on our dataset, and the research aims for this course. In this module’s  Coding learning objectives, we will help you with getting connected to the high-performance biocomputing cluster at ASU (Agave) and use it to access RStudio, navigate directories, and copy files. In this module’s Professional Development learning objectives we will learn how to search for solutions to your coding challenges and get introduced to how to read a scientific paper.
>
>We have provided reading and resources on the next few pages to help you to have the necessary background for attaining the skills presented in this course and help you to contextualize the research question we are tackling.
>
>If you have questions about any of the content, please post in the course slack under the channel #module1; for assistance troubleshooting, please post in the #troubleshooting channel for class feedback. As a reminder, this is a judgment-free zone; the questions you have may very well be the same as another student so please feel free to post as needed.  Any good workplace or research environment should have ways you can communicate with others to get support.
>
>By the end of this module, you'll be able to:  
>
>***Learning Objectives***
>
>***1.1 Biology/Stats (3 hours)***
>
>1. Explain the research aims for this course
>   
>2. Describe the function of placenta and known sex differences in placental gene expression
>   
>3. Review mechanisms of gene expression and next-generation sequencing technologies, specifically RNAseq
>   
>4. Explain data preprocessing steps for RNAseq
>
>***1.2 Coding (30 min)***
>
>1. Navigate files and directories in a Unix shell environment
>
>
>***1.3 Research/Professional Development (30 min)***
>
>1. Use Google to search for useful R solutions to solve specific computational problems

### Module 2

>***Overview***
>
>In this module, we will discuss how a differential gene expression experiment works.  We will talk about what trimming software does and how that is related to differential gene expression. To get you geared to use our differential gene expression pipeline and do further analysis, we will spend time learning about the R statistical programming language and how to use R Markdown to execute code and print analysis reports.  We are hoping to use this week to get everyone on the same page with R programming so that we can focus on our research aims going forward.
>
>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>***2.1 Biology/Stats (1 hour)***
>
>1. Introduce differential expression experiment
>
>2. Introduce effects of parameters
>
>3. Describe how to prioritize candidate genes
>
>
>***2.2 Coding (2+ hours, depending on coding experience)***
>
>1. Run introductory R code
>
>2. Generate a R Markdown
> 
>
>***2.3 Research/Professional development (30 min)***
>
>1. Find help pages on functions in R packages to understand possible arguments and default values
 

### Module 3

>***Overview***
>
>This module is all about the differential expression pipeline, the series of steps we take to determine genes whose expression uniquely characterizes a specific sample group.  In our case, we are interested in genes that are expressed at significantly different levels in female versus male placenta samples. There are many methods for determining differentially expressed genes, but we are going to use the limma-voom pipeline chosen for the placenta sex differences manuscript (Olney et al 2022) so that we can contextualize the effect trimming using previous work.  In this module, you will learn about the statistics and visualization techniques used to determine and present differential gene expression between two sample groups first conceptually and then hands-on by running the R Markdown for differential expression on the untrimmed data. Pay attention because you will be running this pipeline on a trimmed data set in the next module.
>
>If you have questions as you go through the learning materials, please post in the course Slack channel.
>
>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>***3.1 Biology/Stats (2 hours)***
>
>1. Describe how linear modeling can be used to identify differentially expressed genes
>   
>2. Describe how to visualize sample groupings by gene expression profiles
>
>3. Describe why we conduct transformation and normalization of RNAseq data
>
>4. Describe the effects of trimming on data
>
>***3.2 Coding (2+ hours, dep on coding experience)***
>
>1. Run Rmd of differential expression analysis for default (untrimmed data)
>
>2. Visualize gene expression differences with volcano plots and box plots
>
>3. Visualize trends in samples based on their gene expression profiles with MDS plots
> 
>***3.3 Research/Professional development (30 min)***
>
>1. Identify ways debug errors in your code

### Module 4

>***Overview***
>
>In this module, you will be learning to compare results from two differential gene expression analyses.  You will be assigned one of the 9 trimming data sets to run though the differential expression pipeline and compare the results from the untrimmed data you ran in the last module.  We will use techniques such as correlation and overlap to determine how results of two differential expression analyses are similar and different.

>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>4.1 Biology/Stats (2 hours)  
>
>1. Conduct a pairwise correlation analysis of differential expression results 
>
>2. Generate a Venn diagram of pairwise overlap between two differential expression analyses
>
>3. Describe what a p-value is and what multiple hypothesis testing is.
>
>
>***4.2 Coding (2 hours)***
>
>1. Visualize overlap between two differentially expressed gene lists
>
>***4.3 Research/Professional development (30 min)***
>
>1. Identify software versions, modes, and parameters used for analysis in the methods section of a publication

### Module 5

>***Overview***
>
>In this module, we will be collecting results from differential gene expression analysis of all of the trimming data sets to visualize the effect of the trimq and minlen values we have tested.
>
>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>***5.1 Biology/Stats (1 hour)***
>
>1. Describe how to decide overlap and differences between gene sets
>
>***5.2 Coding (2 hours)***
>
>1. Use an Upset.r plot to compare multiple differential expression experiments covering a range of analytical parameters
> 
>***5.3 Research/Professional development (30 min)***
>
>1. How to organize your results to write a research paper

### Module 6

>***Overview***
>
>In this module you will be presenting the work you have done in a mini scientific paper. Your mini papers will be used to put together a manuscript that we would like to submit for publication.  Your assignment will be to write a paper that includes an abstract, methods, results, and discussion.  The learning materials presented here will guide you through concepts needed for these sections of your mini-paper so that we maximize description of results and interpretation and minimize wasted time and writer’s block. While you can find lots of opinions on the best way to write a scientific paper, the order we are presenting in these sections definitely works so we encourage you to write the parts of your paper as you go in the order we describe them in this module.
>
>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>***6.1 Biology/Stats (3 hours)***
>
>1. Summarize, interpret, and present findings in a mini research paper
> 
>***6.2 Coding (30 min)***
>
>1. Describe the what is needed to reproduce your results
>
>***6.3 Research/Professional development (30 min)***
>
>1. Write a draft scientific paper
>
>2. Describe ethics of data sharing
>
>3. Describe ethics of code sharing

### Module 7

>***Overview***
>
>In this module, we will be conducting peer review of reports.  You will use the skills in reading papers you have gained in earlier modules to read papers from your classmates and we will guide you on how to offer constructive criticism.  You will also be preparing your code for others to read it by adding descriptive comments.
>
>***Learning Objectives***
>
>By the end of this module, you'll be able to:  
>
>***7.1 Biology/Stats (3 hours)***
>
>1. Constructively review technical papers
> 
>***7.2 Coding (30 min)***
>
>1. Prepare code and results in order to maximize utility to scientific community
>
>***7.3 Research/Professional development (30 min)***
>
>1. Propose relevant follow-up questions for future research
