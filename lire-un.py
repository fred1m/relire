#! /usr/bin/python3
# -*-coding:Utf-8 -*

import os
import sys
import shutil
from datetime import datetime, date, time

import locale
locale.setlocale(locale.LC_ALL, '')

dossierSource = "public_html/SI1"
lesdocuments = ['RdAR.md', 'RdAR.html']

try:
        fi = open('liste.1sio_gA', 'r')
except IOError:
        print("Ne peut pas ouvrir le fichier en lecture.")
        sys.exit(1)

try:
        log = open('./640lesProductions/ramassage.log', 'w')
except IOError:
        print("Ne peut pas ouvrir le fichier en écriture.")
        sys.exit(1)

li=fi.readline()

log.writelines("# Évaluation de la livraison de :\n\n~~~\n")
for undocument in lesdocuments:
	log.writelines("{0}\n".format(undocument))
log.writelines("~~~\n\nDans ~/{0} {1}\n".format(dossierSource,datetime.now().strftime("le %A")))

if li == "":
	print("fichier, liste des étudiant⋅e⋅s, vide")
	sys.exit(2)

while li != "":
	pseudo,nom,groupe=li.split(":")
	sys.stdout.write("*pseudo : {0}  *nom et prénom : {1}  *groupe : {2}".format(pseudo,nom,groupe))

	for undocument in lesdocuments:
		if undocument == undocument:
			sys.stdout.write("shutil.copy2 cheminsource/{1}/public_html/{0} chemin2ramassage/{1}{0}\n".format(undocument,pseudo))	
			sys.stdout.write("shutil.copy2 cheminsource/{1}/public_html/{0} chemin2ramassage/{1}{0}\n".format(undocument,pseudo))	
		else:
			stdout.write("Insuffisant, {0} Manquant\n".format(undocument))
		
	li=fi.readline()

sys.stdout.write("_-_\n")
fi.close()
log.close()
sys.exit(0)
