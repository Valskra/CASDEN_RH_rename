#!/bin/bash
# matricule_annee_code_nom.pdf → matricule_EVAL_annee_code.pdf

mkdir -p Dossiers
mkdir -p Destination
# Répertoire contenant les fichiers d'origine
repertoire="./Dossiers"

for fichier in "$repertoire"/*.pdf; do
    # Séparation des parties du nom de fichier
    nom_fichier=$(basename "$fichier")
    matricule=$(echo "$nom_fichier" | cut -d'_' -f1)
    annee=$(echo "$nom_fichier" | cut -d'_' -f2)
    code=$(echo "$nom_fichier" | cut -d'_' -f3)
    nom=$(echo "$nom_fichier" | cut -d'_' -f4 | cut -d'.' -f1)

    # Mise en majuscule 
    code=$(echo "$code" | tr '[:lower:]' '[:upper:]')
    # Renommer le fichier avec le nouveau format
    case $code in
        "SOLEIL")
            new_code="FEU"
            ;;
        "PLUIE")
            new_code="EAU"
            ;;
        "VENT")
            new_code="AIR"
            ;;
        "NEIGE")
            new_code="GEL"
            ;;
        "ORAGE")
            new_code="ELECTRICITE"
            ;;
        *)
            mkdir -p error_file_code
            cp "$fichier" "./error_file_code/${matricule}_EVAL_${annee}_${code}.pdf"
            echo "./error_file_code/${matricule}_EVAL_${annee}_${code}.pdf"
            ;;
    esac

    # Copie du fichier vers ./Destinations
    cp "$fichier" "./Destination/${matricule}_EVAL_${annee}_${new_code}.pdf"
done