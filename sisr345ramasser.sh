#!/bin/bash

# voir http://abs.traduc.org/abs-fr/ch14.html#readredir

# copier une séries de livrables dans un sous-dossier en vue scp|rsync -av ...

# /!\ dossier de ramassage !
 dossier=537sisr345 # /!\ sio1 | sio2
#dossier=450si6 # /!\ sio1 | sio2

 lespseudo=liste.2sio_gSISR

log=$dossier/ramasser_$lespseudo.log

### format "md", utiliser pandoc ramasser_$lespseudo.log -o ramasser_$lespseudo.html ; lien ~/public_html (httpd) ###

 lesfic='SISR-RdAR.md' # sio2 SISR345 du ma.8/9/2015 au

if [[ -d $dossier ]]
 then
 exec 6>&1           # Lie le descripteur de fichier #6 avec stdout.
                     # Sauvegarde stdout.

 exec > $log         # stdout remplacé par le fichier...

 echo "# Évaluation de la livraison de :"
 echo " "
 echo "<pre><code>"
 echo $lesfic
 echo "</code></pre>"
 echo " dans ~/public_html le " ;  date
 echo " "
 while IFS=: read pseudo nomcomplet division host ignore
 do

   echo " " ; echo "* **$nomcomplet** *($division)*"

# lesfic="PPE1/index.html PPE1/$pseudo.html PPE1/$pseudo.pdf PPE1/devis1.html PPE1/devis1.pdf PPE1/devis2.html PPE1/devis2.pdf PPE1/devis3.html PPE1/devis3.pdf"
# PPE1="PPE1"
# mkdir $dossier/$pseudo$PPE1

  for fic in $lesfic
  do
   if [[ -f /home/$pseudo/public_html/$fic ]] 
     then 
 		echo -e "\t* $fic livré"
		cp -p /home/$pseudo/public_html/$fic $dossier/$pseudo$fic
#		pg_dump $pseudo > $dossier/$pseudo$fic
         
     else 
		echo -e "\t* insuffisant ($fic manquant)"
	
   fi
  done

 done <$lespseudo   # Redirection d'entrées/sorties.
 echo " "
 echo "---- "
 echo " "
 echo "<pre><code>"
 ls -rtlh $dossier
 echo "</code></pre>"
 
 exec 1>&6 6>&-      # Restaure stdout et ferme le descripteur de fichier #6.

 less $log
else
 echo "ERREUR : dossier $dossier manquant"
 exit 1
fi

exit 0
