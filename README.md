# SHS-game-project
Prototype de jeu cours HUM-380

# Travailler avec Git:
- **Commencer notre session de travail:**
Toujours faire un `git fetch` pour mettre à jour les références si des nouvelles branches ont été créees depuis votre dernière session de travail.
Faire un `git pull` régulièrement pour mettre à jour sa branche locale avec les fichiers à jour du repo.

- **Créer une nouvelle branche:**
Pour créer une nouvelle branche il faut aller sur la branche main en faisant `git checkout main` puis `git checkout -b {nom de la branche}` pour créer cette nouvelle branche à partir de `main`.

- **Faire des changements et les push sur sa branche:**
Une fois que vous avez apporté des changements à des fichiers sur votre branche, vous pouvez utiliser `git status` pour voir les changements en cours, `git add` pour ajouter les fichiers que vous voulez commit, `git commit` pour créer votre commit puis `git push` pour push tout vos commit sur la branche courante. (Voir les commandes en bas pour une explication plus détaillés des commandes).

# Commandes Git utiles:
- `git branch` indique sur quelle branche vous êtes.
- `git status` indique quels fichiers ont été modifiés en local par rapport aux fichiers du repo dans la branche courante.
- `git checkout {nom de la branche}` permet de changer de branche
- `git pull` met à jour votre branche locale avec les fichiers du repo de la même branche courante.
- `git fetch` met à jour les références de votre repo local avec celles du repo remote (utile pour détecter des nouvelles branches crées par exemple).
- `git status` affiche les changements locaux qui diffèrent du repo remote de la branche courante. (toujours faire ça avant de add et commit des changements).
- `git restore {nom du fichier}` permet de restorer l'état d'un fichier comme il est sur le repo en ligne (marche aussi pour des fichiers supprimés).
- `git add {chemin du fichier modifié)` permet d'ajouter un changement à commit par la suite.
- `git commit -m " {votre message} "` permet de créer un commit avec un message qui contient les derniers fichiers ajoutés avec `git add`.
- `git push` permet de pousser vos commits sur la branche courante du repo remote (mets à jour la branche avec vos changements, en gros).
