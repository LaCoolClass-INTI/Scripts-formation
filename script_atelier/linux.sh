#!bin/bash
#Atelier Linux :

#Creer une arborescence : 

mkdir -p rep1/rep2
touch fichier1 rep1/fichier2 rep1/rep2/fichier3

#Dans votre répertoire personnel, créer un répertoire test. Créer sous-répertoires pub et bin du répertoire test. 

mkdir -p test/pub test/bin

#Modifier les droits d\'acces :

chmod 755 test test/pub
#Pour verifier juste test : 
ls -l -d test/

#Créer un fichier et le recopier :

cd test
touch doc.txt
cp doc.txt pub


#Aller dans bin. Afficher à l\'écran le contenu de test/pub/doc.txt :

cd bin
cat ~/test/pub/doc.txt

#Afficher la liste des fichiers contenus dans test et ses sous-répertoires.  

ls -R test/

#Supprimer du répertoire test et de ses sous-répertoires tous les fichiers se terminant par le caractère ~.  

rm -i test/*~  test/*/*~
#équivalent à : 
cd test/ && rm -i *~ */*~

#Afficher à l\'écran le contenu des fichiers toto et titi qui se trouvent dans le répertoire d\'accueil de l\'utilisateur balev. Supprimer ces deux fichiers.  

su #(connexion avec les droits root)
adduser balev
touch balev/toto balev/titi
cat balev/toto balev/titi
rm balev/toto balev/titi

#On désire aller dans le répertoire /usr/local/games/mariokart, et le répertoire courant est /usr/local
cd games/mariokart
cd /usr/local/games/mariokart 
cd /usr/local/../local/games/mariokart

#Lister tous les fichiers : 
#• se terminant par '5', 
ls -la *5 | grep ‘^-’)
#• commençant par 'annee4', 
ls annee4*
#• commençant par 'annee4' et de 7 lettres maximum, 
ls annee4? annee4
#• commençant par 'annee' avec aucun chiffre numérique, 
ls annee[!0-9]*
#• contenant la chaîne 'ana', 
ls *ana*
#• commençant par 'a' ou 'A' 
ls -la [aA]* | grep ‘^-’

#Copier les fichiers dont l'avant-dernier caractère est un '4' ou '1' dans le répertoire /tmp en une seule commande.  
cp *[41]? /tmp

#Modifications de droits :
chmod 755 essai_droit

chmod u=rwx,g=rx,o=x essai_droit  	#751  o-rw
chmod u=rx,g=w,o=x essai_droit  	#	521  u-w,g-rx,g+w,o-r
chmod u=rx,g=w,o=x essai_droit  	#	214  u-rx,g-r,o-x
chmod u=x,g=rx,o=  essai_droit  	#	150  u-rw,o-rx


#Exercice 8
ls -l /usr/bin > tmp && less tmp && rm tmp 


#Exercice 9

cat devinette.txt | grep ce | wc -l # = affiche le nombre de lignes avec "ce"
cat devinette.txt | grep 4 | wc -l # = affiche le nombre de lignes avec "4"

# 1) Renvoyer toutes les lignes du fichier liste.txt qui correspondent à l'étudiant s'appelant 'Sami'. 
cat liste.txt | grep ‘Sami’  #autre solution : 
grep ‘Sami’ liste.txt
# 2) Renvoyer toutes les lignes correspondant à des étudiants de la filière L3. 
cat liste.txt | grep L3  
grep L3 liste.txt
# 3) Renvoyer toutes les lignes des étudiants âgés de 22 ans. 
cat liste.txt | grep 22
# 4) Renvoyer les lignes des étudiants n'appartenant pas à la filière L3. 
cat liste.txt | grep -v L3    
grep -v L3
# 5) Renvoyer toutes les lignes contenant la chaîne 'mi' sans tenir compte de la casse.     
grep -i mi liste.txt
# 6) Afficher le nom et l'âge de chaque étudiant, puis le nom et la filière. 
cut -f1,2 -d’;’ liste.txt 
cut -f1,3 -d’;’ liste.txt
# 7) Afficher les trois premiers caractères de chaque ligne. 
cut -c-3 liste.txt


# 1) Chercher tous les fichiers dont le nom est 'passwd'. 
find / -name “passwd”
# 2) Chercher tous les fichiers dont la date de la dernière modification remonte à plus de 10 minutes. 
find -mmin +10
# 3) Trouver tous les fichiers du groupe 'root'. 
find / 
# 4) Chercher tous les fichiers dont la taille est supérieure à 20Mo. 
find / -size 20000k
# 5) Chercher tous les répertoires se trouvant sous /etc. 
find  /etc -type d
# 6) Chercher tous les fichiers de l'utilisateur 'Raimbault' 
find /home -user Raimbault
