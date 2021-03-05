import os
from datetime import datetime
import subprocess
from Bio import SeqIO
from Bio.SeqUtils.ProtParam import ProteinAnalysis
import pandas as pd


dateTime = datetime.now()
os.mkdir("../resultado/" + dateTime.strftime("%d-%m-%Y-%H:%M"))
directory = dateTime.strftime("%d-%m-%Y-%H:%M")
os.chdir('../resultado/' + directory)

out = open('best_scores.txt', 'w')

fastaFiles = []
basePath = os.path.relpath('../fasta/', directory)

with os.scandir(basePath) as files:
	for file in files:
		if file.is_file():
			fastaFiles.append(file.name)

print(fastaFiles)

for sequence in fastaFiles:
	command_line = ['blastp','-query', '../../fasta/'+sequence,'-out', sequence + '_out_sp', '-outfmt', '6','-db','swissprot']
	subprocess.call(command_line)


for sequenceCdd in fastaFiles:
	command_line = ['blastp','-query', '../../fasta/'+sequenceCdd,'-out', sequenceCdd + '_out_cdd', '-outfmt', '6','-db','cddmasters.fa']
	subprocess.call(command_line)

for sequenceSignalP in fastaFiles:
	command_line = ['signalp', '-fasta', '../../fasta/'+sequenceSignalP, '-org gram+', '-prefix', sequenceSignalP + '_signal']
	subprocess.call(command_line)

for result in fastaFiles:
	first_line = open(result + '_out_sp').readline()
	second_line = open(result + '_out_cdd').readline()
	if first_line != "" and second_line != "":
		column1 = first_line.split()
		column2 = second_line.split()
		print(column1)
		print(column2)
		out.write(column1[0] + '\t' + column1[1] + '\t' + column1[2] + '\t' + column1[3] + '\t' + column1[4] + '\t' + column1[5] + '\t' + column1[6] + '\t' + column1[7] + '\t' + column1[8] + '\t' + column1[9] + '\t' + column1[10] + '\t' + column1[11] + '\t' + column2[1] + '\t' + column2[2] + '\t' + column2[3] + '\t' + column2[4] + '\t' + column2[5] + '\t' + column2[6] + '\t' + column2[7] + '\t' + column2[8] + '\t' + column2[9] + '\t' + column2[10] + '\t' + column2[11] + '\t')
	if first_line == "":
		print("no results")
		out.write(result + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + column2[1] + '\t' + column2[2] + '\t' + column2[3] + '\t' + column2[4] + '\t' + column2[5] + '\t' + column2[6] + '\t' + column2[7] + '\t' + column2[8] + '\t' + column2[9] + '\t' + column2[10] + '\t' + column2[11] + '\t')
	if second_line == "":
		print("no results")
		out.write(column1[0] + '\t' + column1[1] + '\t' + column1[2] + '\t' + column1[3] + '\t' + column1[4] + '\t' + column1[5] + '\t' + column1[6] + '\t' + column1[7] + '\t' + column1[8] + '\t' + column1[9] + '\t' + column1[10] + '\t' + column1[11] + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t' + " " + '\t')
	with open('../../fasta/'+result, mode='r') as handle:
		for sequences in SeqIO.parse(handle, 'fasta'):
			sequenceAA = sequences.seq
			x = ProteinAnalysis(str(sequenceAA))
			print("%0.2f" % x.isoelectric_point())
			print("%0.2f" % x.instability_index())
			print("%0.2f" % x.molecular_weight())
			print("%0.2f" % x.gravy())
			print(sequenceAA)
			out.write("%0.2f" % x.isoelectric_point() + '\t' + "%0.2f" % x.instability_index() + '\t' + "%0.2f" % x.molecular_weight() + '\t' + "%0.2f" % x.gravy() + '\t')
	third_line = open(result+'_signal').readlines()
	column3 = third_line[3].slipt()
	out.write(column3[1] + column3[2] + column[3] + '\n')
	


out.close()
data = pd.read_csv('best_scores.txt',delimiter = "\t")
data.columns=["ID", "Subject accension", "Identity(%)", "Alignment length", "Mismatches", "Gaps", "q. start", "q. end", "s. start", "s. end", "e-value", "Bit score", "Subject accension", "Identity(%)", "Alignment length", "Mismatches", "Gaps", "q. start", "q. end", "s. start", "s. end", "e-value", "Bit score", "pI", "Instability Index", "Molecular weight", "Gravy"]
data.to_csv('dataframe.csv', index = False, header = True)
