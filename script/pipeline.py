import os
from datetime import datetime
import subprocess
from Bio import SeqIO
from Bio.SeqUtils.ProtParam import ProteinAnalysis


dateTime = datetime.now()
os.mkdir("../resultado/" + dateTime.strftime("%d-%m-%Y-%H:%M"))
directory = dateTime.strftime("%d-%m-%Y-%H:%M")
os.chdir('../resultado/' + directory)

fastaFiles = []
basePath = os.path.relpath('../fasta/', directory)

with os.scandir(basePath) as files:
	for file in files:
		if file.is_file():
			fastaFiles.append(file.name)

print(fastaFiles)

for sequence in fastaFiles:
	command_line = ['blastp','-query', '../../fasta/'+sequence,'-out', sequence + '_out_sp', '-outfmt', '7','-db','swissprot']
	subprocess.call(command_line)

for sequenceCdd in fastaFiles:
	command_line = ['blastp','-query', '../../fasta/'+sequenceCdd,'-out', sequenceCdd + '_out_cdd', '-outfmt', '7','-db','cddmasters.fa']
	subprocess.call(command_line)

for sequenceSignalP in fastaFiles:
	command_line = ['signalp', '-fasta', '../../fasta/'+sequenceSignalP, '-prefix', 'signal' + sequenceSignalP]
	subprocess.call(command_line)

for fasta_path in fastaFiles:
	with open('../../fasta/'+fasta_path, mode='r') as handle:
		for sequences in SeqIO.parse(handle, 'fasta'):
			sequenceAA = sequences.seq
			x = ProteinAnalysis(str(sequenceAA))
			print("%0.2f" % x.isoelectric_point())
			print("%0.2f" % x.instability_index())
			print("%0.2f" % x.molecular_weight())
			print(x.gravy())
			print(sequenceAA)
