'''
input: directory of output from featureCounts 
output: csv files that aggregate geneCounts*.txt into one file, transcriptCounts*.txt into one file
steps: 
1) set up dictionaries to hold gene count and transcript count info
2) look through given directory for files with the correct ending
3) for each file
4) read all lines without "#" at the front with subsequent first line being the headers
5) read geneid column and last column (heading ends in bam) 
6) store in dictionary with key = gene id, value appended on list
7) make sure to add "NA" to any gene id where no count was found
8) keep track of bam file from headers
8) once all files are read, print to output csv
9) column headings = "gene id" then all the bam files that the counts came from
'''

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--countsdir', type=str, required=True)
args = parser.parse_args()


# input parameters

counts_directory = args.countsdir

print ("Directory entered: \n" + counts_directory + "\n")

# find geneCounts and transcriptCounts files 
geneCounts_files = []
transcriptCounts_files = []
for (dirpath, dirnames, filenames) in os.walk(counts_directory):
    geneCounts_files += [os.path.join(dirpath, file) for file in filenames if "geneCounts" in file and not "summary" in file and not "geneCounts_all.csv" in file and "txt" in file]
    transcriptCounts_files += [os.path.join(dirpath, file) for file in filenames if "transcriptCounts" in file and not "summary" in file and not "transcriptCounts_all.csv" in file and "txt" in file]

# dictionaries to hold count data (key = geneid, value = list of counts from different bam files read in featureCounts)
geneCounts_data = {}
transcriptCounts_data = {}

# iterate gene counts files, filing in geneCounts dictionary
bam_files = []
gc_file_counter = 0

for gc_file in geneCounts_files:
    gc_file_counter += 1

    gc_handle = open(gc_file,'r')
    gc_lines = gc_handle.readlines()  # read lines of file
    gc_lines = [x for x in gc_lines if (not "#" in x)]
    gc_handle.close()

    gc_lines = [x.replace("\n","") for x in gc_lines if (not "#" == x[0])]  # filter comments and new lines

    # find indices for geneid and bam file (feature count, supposed to be the last column)
    headerline = gc_lines[0]
    headers = headerline.split("\t")
    geneid_index = headers.index("Geneid")
    bam_index = [i for i, s in enumerate(headers) if '.bam' in s][0]

    # keep track of bam files for column headings of output file
    bam_files.append(headers[bam_index])
    
    # for all data rows, fill in featurecount to list associated with gene id
    for line in gc_lines[1:len(gc_lines)]:
        line_items = line.split("\t")
        geneid = line_items[geneid_index]
        featurecount = line_items[bam_index]

        if (not geneid in geneCounts_data):
            geneCounts_data[geneid] = []
            
        geneCounts_data[geneid].append(featurecount)

    # make sure all geneid elements have a feature count value, if not NA for this gene count file
    for gid in geneCounts_data:
        if (len(geneCounts_data[gid]) != gc_file_counter and len(geneCounts_data[gid] == (gc_file_counter - 1))):
            geneCounts_data[gid].append("NA")

# output what we aggregated
outputfile = os.path.join(counts_directory,"geneCounts_all.csv")
output_handle = open(outputfile,'w')
bam_files = ["Geneid"] + bam_files
print(",".join(bam_files), file = output_handle)
for k in geneCounts_data:
    out = [k] + geneCounts_data[k]
    print(",".join(out), file = output_handle)
output_handle.close()    
print ("Aggregate geneCounts file: \n" + outputfile)

# repeat process with transcriptCounts files
bam_files = []
tc_file_counter = 0
for tc_file in transcriptCounts_files:
    tc_file_counter += 1

    tc_handle = open(tc_file,'r')
    tc_lines = tc_handle.readlines()  # read lines of file
    tc_lines = [x for x in tc_lines if (not "#" in x)]
    tc_handle.close()

    tc_lines = [x.replace("\n","") for x in tc_lines if (not "#" == x[0])]  # filter comments and new lines

    # find indices for geneid and bam file (feature count, supposed to be the last column)
    headerline = tc_lines[0]
    headers = headerline.split("\t")
    geneid_index = headers.index("Geneid")
    bam_index = [i for i, s in enumerate(headers) if '.bam' in s][0]

    # keep track of bam files for column headings of output file
    bam_files.append(headers[bam_index])
    
    # for all data rows, fill in featurecount to list associated with gene id
    for line in tc_lines[1:len(tc_lines)]:
        line_items = line.split("\t")
        geneid = line_items[geneid_index]
        featurecount = line_items[bam_index]

        if (not geneid in transcriptCounts_data):
            transcriptCounts_data[geneid] = []
            
        transcriptCounts_data[geneid].append(featurecount)

    # make sure all geneid elements have a feature count value, if not NA for this gene count file
    for gid in transcriptCounts_data:
        if (len(transcriptCounts_data[gid]) != tc_file_counter and len(transcriptCounts_data[gid] == (tc_file_counter - 1))):
            transcriptCounts_data[gid].append("NA")

# output what we aggregated
outputfile = os.path.join(counts_directory,"transcriptCounts_all.csv")
output_handle = open(outputfile,'w')
bam_files = ["Geneid"] + bam_files
print(",".join(bam_files), file = output_handle)
for k in transcriptCounts_data:
    out = [k] + transcriptCounts_data[k]
    print(",".join(out), file = output_handle)
output_handle.close()    
print ("Aggregate transcriptCounts file: \n" + outputfile)
