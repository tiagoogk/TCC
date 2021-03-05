# Pipeline para Caracterização Funcional de Proteínas Hipotéticas

Projeto desenvolvido para o Trabalho de Conclusão de Curso em Informática Biomédica.

## Instalação
São necessárias 3 bibliotecas para rodar a pipeline [Pandas](https://pandas.pydata.org/), [Biopython](https://biopython.org/) e [Numpy](https://biopython.org/).

```bash
pip3 install pandas
pip3 install numpy
pip3 install biopython

Os bancos de dados são providos pelo [NCBI](https://ftp.ncbi.nlm.nih.gov/blast/db/), as últimas versões do CDD e Swiss-prot são necessárias, após o download é necessário colocar na pasta e endereçar a pasta no bash com BLASTDB.

````bash
vim .bashrc

E no editor:
```vim
BLASTDB=<caminho da pasta com os dbs>

Observação: caso seja necessário, baixe o arquivo fasta com o banco e crie um banco com o mesmo nome swissprot e cddmaster.fa
