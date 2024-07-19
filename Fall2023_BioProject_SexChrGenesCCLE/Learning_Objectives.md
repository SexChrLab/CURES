# Learning Objectives for Iteration 2 (Fall 2023)

## Course Learning Objectives
General course learning objectives presented in the syllabus: 

>At the completion of this course, students will be able to:
>
>1. Understand, execute, and debug R code
>   
>2. Work with data structures and packages in R related to identification, visualization, and interpretation of differentially expressed genes
>   
>3. Critically evaluate scientific literature
>   
>4. Draft a manuscript, including reproducible methods, background, results, and discussion

A suggested weekly routine was provided for students in the course introduction: 

>Weekly Routine
>
>To be successful in this research course, we expect that you will: 
>
>1. Do the readings at the beginning of the week. 
>
>2. Complete reading and comment on the journal article first.
>
>3. Complete the quiz (based on the readings and journal article). 
>
>4. Open your assignment at the beginning of the week, and complete after reading the journal article and completing the quiz.
 

## Module Learning Objectives

Learning objectives for each module were listed in the module introduction page.  

### Module 1

>***Module Overview***
>
>In this module, you will learn about how this course will operate to guide you through answering a research question.  You will learn about the specific research question we are asking, how it arose, and why it is important to the scientific community to answer that question.  Specifically, you will learn about the role of sex chromosomes in cancer and the Cancer Cell Line Encyclopedia (CCLE) resource data set.  You will also perform a biological data analysis tutorial in R to gain the programming skills necessary to do the required analysis for this research.
>
>***Module Learning Objectives***
>
>***1.1 Biology/Stats (1.5 hours)***
>
>1. Understand research aims for this course
>2. Become familiar with the CCLE data set
>3. Understand sex chromosome biology
>4. Understand the features of cancer cells
>5. Understand what is currently known about the effect of sex on cancer incidence and cancer cell biology
> 
>
>***1.2 Coding (2 hours)***
>
>1. Use RStudio to run R code
>2. Understand how to read and store data in R
>3. Understand how to create and subset data frames in R
>
>
>***1.3 Professional Development (30 min)***
>
>1. Use Google to search for useful R solutions to solve specific computational problems
>2. Read published scientific articles

### Module 2

>***Module Overview***
>In this module, we will be learning all about RNA sequencing, the method used to generate the gene expression data we will be analyzing in this research project.  You will be finishing up the R programming tutorial in preparation for working with the actual CCLE data in the next module.
>
>***Module Learning Objectives***
>
>***2.1 Biology/Stats (1.5 hours)***
>
>1. Review mechanisms of gene expression and next-generation sequencing technologies, specifically RNAseq
>2. Understand steps for gene quantification using RNAseq
>3. Understand the distinctions between reported sex, sex chromosome complement, and sex chromosome independent sex effects
>
>
>***2.2 Coding (2-3 hours)***
>
>1. Understand how to read and write data files in R
>2. Understand factors and levels in R
>3. Understand control structures in R
>4. Understand how to use ggplot2 for data visualization in R
>5. Understand how to save figures and data as files in R
>6. Understand how to print reports in R
> 
>
>***2.3 Research/Professional development (30 min)***
>
>1. Find help pages on functions in R packages to understand possible arguments and default values

### Module 3

>***Module Overview***
>
>In this module, we will be learning about the X chromosome and mechanisms by which chromosome X genes have an effect on tumor biology.  We will be learning about X chromosome inactivation and how the XIST gene is central to it, both in healthy tissues using the Genotype-Tissue Expression (GTEx) data set and in cancer tissues using the Cancer Cell Line Encyclopedia (CCLE) data set.  We will begin working with the CCLE dataset using template R code to explore the data set and determine XIST expression levels across the cell lines.
>
> 
>***Module Learning Objectives***
>
>***3.1 Biology/Stats (2 hours)***
>
>1. Understand how XIST gene functions in X chromosome inactivation
>2. Understand known connections between chromosome X genes and cancer
>
>***3.2 Coding (2+ hours, dep on coding experience)***
>
>1. Identify and visualize annotated information given for CCLE cell lines
>2. Visualize XIST gene expression across CCLE cell lines
>3. Determine thresholds that could be used to predict sex based on XIST expression
>
>***3.3 Research/Professional development (30 min)***
>
>1. Identify ways debug errors in your code

### Module 4

>***Module Overview***
>In this module, we will be learning about the Y chromosome and mechanisms by which chromosome Y genes have an effect on tumor biology.  After learning about genes on both sex chromosomes, you will be assigned a sex chromosome gene to research in CCLE as well as in healthy tissues (GTEx).
>
>***Module Learning Objectives***
>By the end of this module, you'll be able to:  
>
>***4.1 Biology/Stats (2 hours) ***
>
>1. Understand effect of Y chromosome loss in cancer
>
>***4.2 Coding (2 hours)***
>
>1. Visualize gene expression of other sex chromosome genes across CCLE cell lines
>2. Determine thresholds that could be used to predict sex based on sex chromosome genes’ expression
>
>***4.3 Research/Professional development (30 min)***
>
>1. Identify software versions, modes, and parameters used for analysis in the methods section of a publication

### Module 5
 
>***Module Overview***
>In this module, we will be learning about how tumors in the body are composed of many different cell types, even though cell lines derived from those tumors are clonal.  We will be learning about the cell types that are present in tumors with special emphasis on immune cells.  We will be reading a paper that shows how loss of the Y chromosome can cause increased tumor growth by affecting the immune response to tumor cells.  In this module, we will also be looking at results for sex chromosome genes studied by your classmates and start organizing our conclusions so that we can write about them in a manuscript (focus of Module 6).
>
>***Module Learning Objectives***
>
>***5.1 Biology/Stats (1.5 hour)***
>
>1. Understand factors that contribute to within tumor heterogeneity 
>2. Determine results that will be showcased in final manuscript
>3. Write figure legends and results describing key figures
>
>***5.2 Coding (2 hours)***
>
>1. Determine which genes alone and/or in combination can be used to predict sex in CCLE cell lines
>2. Create a file with a table associating CCLE cell line to predicted sex based on gene expression
>
>***5.3 Research/Professional development (30 min)***
>
>1. Organize research results to write a manuscript
>2. Learn how to choose an appropriate scientific journal to feature results of a study
 
### Module 6

>***Module Overview***
>
>In this module you will be presenting the work you have done in a scientific paper. You will use your assignments and progress reports to write a paper that includes an abstract, methods, results, and discussion.  The learning materials presented here will guide you through concepts needed for these sections of your paper so that we maximize description of results and interpretation and minimize wasted time and writer’s block. While you can find lots of opinions on the best way to write a scientific paper, the order we are presenting in these sections definitely works so we encourage you to write the parts of your paper as you go in the order we describe them in this module.  Always takes longer than you expect so try to work on it bit by bit instead of leaving it until the last minute.
>
>***Module Learning Objectives***
>
>***6.1 Biology/Stats (3 hours)***
>
>1. Summarize, interpret, and present findings in a research paper
>
>***6.2 Coding (30 min)***
>
>1. Describe the what is needed to reproduce your results
>
>***6.3 Research/Professional development (30 min)***
>
>1. Write a draft scientific paper
>2. Describe ethics of data sharing
>3. Describe ethics of code sharing
>4. Learn how authorship is decided for a publication

### Module 7

>***Module Overview***
>
>In this module, we will be conducting peer review of parts of the manuscripts written in the last module.  You will use the skills in reading papers you have gained in earlier modules to read papers from your classmates and we will guide you on how to offer constructive criticism.  You will also be preparing your code for final submission by adding descriptive comments.
>
>***Module Learning Objectives***
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
