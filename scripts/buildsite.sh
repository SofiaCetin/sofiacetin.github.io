#!/bin/bash

echo "Rebuilding site."
rm -rf public/ # tout supprimer !
mkdir public # recréer le dossier
cp -r assets/* public/ # copier les ressources
for page in pages/*.html; do # pour chaque page ...
    echo -n "> building ${page#pages/}... "
    sh scripts/buildpage.sh "$page" # ... la construire avec notre script
    echo "done."
done
echo "Finished!"
