# Iteration 1 of online genomics course-based undergraduate reserach experience (CURE)

In this iteration of the online genomics CURE, we implemented the pilot run of our course model.  The instructors of the course wanted to provide an authentic research experience to the online student community.  

# Students and instructors

Since this was the first time this course was being offered, the enrollment cap was 20, of which 13 online biology students consented to take part in this iteration of the CURE. All of these students completed the prerequisite course (BIO439:ComputingforResearch) which introduced genomics software tools in a Linux/Unix shell environment to learn, apply, and write code to process high-throughput sequencing data. The instructor team consisted of 3 scientists including Dr. Melissa Wilson, lead investigator in the Sex Chromosomes Lab and passionate educator in the Arizona State University School of Life Sciences, along with a senior scientist in her lab, and one Master's student who had been an online student herself and knew the value of research opportunities for students' education.  Dr.Wilson was the lead instructor, but the rest of the team worked together with her to grade assignments and lead research and communication efforts with the students.  

# Research Project

In a previously published study (Olney et al, Biol Sex Differences 2022), the instructors had previously identified genes that were differentially expressed between male and female placentas from full-term pregnancies using a well-established analysis workflow: trimming of low quality RNA sequencing reads and the limma-voom pipeline for differentially expression of genes between two groups (males and females; https://github.com/SexChrLab/Placenta_Sex_Diff). The parameters chosen for trimming adapter sequences and low-quality RNA sequencing reads were determined using experiences of the lead investigators of the study, but literature review showed a variety of thresholds for what was considered to be low quality for reads and recommendations for the effect of trimming on differential gene expression are both limited and contradictory. The instructors devised a course that would allow students to test a range of values for the ‘trimq’ and ‘minlen’ trimming parameters implemented in the bbduk trimming software, the software used in the original publication, to test whether and how the sex differential expression profile was affected in the placenta tissues. 

# Data used

For the first iteration of the CURE, previously published RNA sequencing data from placenta samples taken at full-term deliveries were the raw reads. Only the first of two batches of samples collected was used to avoid the need to correct for batch effect, giving 10 placentas from female-carrying pregnancies and 12 placentas from male-carrying pregnancies. Each placenta was sampled twice and each sample was processed for bulk RNA sequencing; gene expression for samples from the same placenta was summed. This was used to address the research question of how robust the published sex differential gene expression profile was to changes in trimming parameters.

# Directory Structure

In the Fall2023_BioProject_SexChrGenes_CCLE directory, you will find: 
1. 'Module' directories for each module containing the Learn Bio/Stats, Learn Coding, and Learn Professional Development pages given to the students on Canvas
2. 'Template_Code' directory includes the code distributed to students to help them do the analysis with examples of results
3. 'Student_Assessment and Templates' directory includes instructions and templates given to students to better understand the format for the manuscript, weekly progress reports, and assignments
4. 'Course Assessment' directory includes code that was used to analyze learning gains
5. 'Troubleshooting' directory includes a walk-through of how a bug in the template code was identified and fixed during the CURE

# Preprint 
This course iteration of the course was presented in a preprint (available at [https://www.biorxiv.org/content/10.1101/2023.11.29.569298v1](url)].  Data from a second iteration of the CURE with higher student enrollment was used to ultimately publish this work, so stay tuned for that.  

# Contact information

If you would like more information about our online genomics research course, please feel free to reach out to Dr. Melissa Wilson (mwilsons at asu dot edu).
