import os
import random
import string

# Liste de noms aléatoires
noms_de_famille = [
    "Adams", "Baker", "Clark", "Davis", "Edwards", "Fisher", "Garcia", "Harris", "Jackson", "Kennedy",
    "Lopez", "Martinez", "Nelson", "Connor", "Parker", "Quinones", "Rodriguez", "Sanders", "Taylor",
    "Upton", "Valdez", "Walker", "Xavier", "Young", "Zuniga", "Alvarez", "Brooks", "Collins", "Diaz", "Evans"
]

mots_aleatoires = ["SoLeIL", "PlUIe", "veNT", "NeigE", "ORaGE"]

# Nombre de fichiers à créer
nb_fichiers = 25
try :
    os.mkdir("./Dossiers")

except :
    pass

for i in range(nb_fichiers):
    matricule = str(1300000 + random.randint(1000, 9999))
    annee = str(random.randint(2017, 2023))
    nom_aleatoire = random.choice(noms_de_famille)
    mot_aleatoire = random.choice(mots_aleatoires)
    nom_fichier = f"{matricule}_{annee}_{mot_aleatoire}_{nom_aleatoire}.pdf"

    open("Dossiers/" + str(nom_fichier), "a")