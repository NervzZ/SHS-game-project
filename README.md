# SHS-game-project
Prototype de jeu cours HUM-380

La branche `main` est la branche principale du projet, elle est protégée et personne ne peut travailler directement dessus.

# Travailler avec Git:
- **Commencer notre session de travail:**
Toujours faire un `git fetch` pour mettre à jour les références si des nouvelles branches ont été créees depuis votre dernière session de travail.
Faire un `git pull` régulièrement pour mettre à jour sa branche locale avec les fichiers à jour du repo.

- **Créer une nouvelle branche:**
Pour créer une nouvelle branche il faut aller sur la branche main en faisant `git checkout main` puis `git checkout -b {nom de la branche}` pour créer cette nouvelle branche à partir de `main`. Cette branche est locale, il faut encore la push sur le repo avec une commande spéciale à ne faire qu'une fois : `git push -u origin {nom de la branche}` après quoi `git pull` et `git push` fonctionneront comme d'habitude.

- **Faire des changements et les push sur sa branche:**
Une fois que vous avez apporté des changements à des fichiers sur votre branche, vous pouvez utiliser `git status` pour voir les changements en cours, `git add` pour ajouter les fichiers que vous voulez commit, `git commit` pour créer votre commit puis `git push` pour push tout vos commit sur la branche courante. (Voir les commandes en bas pour une explication plus détaillés des commandes).

- **Remettre à jour sa branche avec main, si main change:**
Premièrement faire `git status` pour vérifier que vous n'avez **aucun** changements en cours. Une fois fait faites `git checkout main` puis `git pull` pour mettre à jour votre `main` local et revenez sur votre branche avec `git checkout {votre branche}` et ensuite faites `git rebase main` pour tirer les derniers changements de la branche main sur votre branche courante puis faire `git push --force` pour écraser votre branche avec cette nouvelle suite de commit.

# Godot et git
- **Popup Godot pour rafraîchir un fichier après une commande git:** Après un pull ou un changement de branche, Godot vous fait peut - être un pop-up pour vous demander ce que vous voulez faire de certains fichiers que vous aviez déjà d'ouvert. Appuyez **TOUJOURS** sur "reload" et ensuite vous devez simplement fermer ce fichier et le ré-ouvrir et vous verrez la version à jour. Il est possible de devoir attendre un court instant avant de pouvoir ouvrir le fichier et de voir les changements.

- **Feature Git dans Godot:** Godot supporte apparemment des intégrations Git qui peuvent nous faciliter la tâche. Je n'ai pas encore eu le temps de me pencher la dessus mais à l'avenir si cela devait se faire je vais update ce README avec les éventuelles nouvelles features / outils qu'on peut utiliser pour nous faciliter la tâche.

# Commandes Git utiles:
- `git branch` indique sur quelle branche vous êtes.
- `git status` indique quels fichiers ont été modifiés en local par rapport aux fichiers du repo dans la branche courante.
- `git checkout {nom de la branche}` permet de changer de branche.
- `git pull` met à jour votre branche locale avec les fichiers du repo de la même branche courante.
- `git fetch` met à jour les références de votre repo local avec celles du repo remote (utile pour détecter des nouvelles branches crées par exemple).
- `git status` affiche les changements locaux qui diffèrent du repo remote de la branche courante. (toujours faire ça avant de add et commit des changements).
- `git restore {nom du fichier}` permet de restorer l'état d'un fichier comme il est sur le repo en ligne (marche aussi pour des fichiers supprimés).
- `git add {chemin du fichier modifié)` permet d'ajouter un changement à commit par la suite.
- `git commit -m " {votre message} "` permet de créer un commit avec un message qui contient les derniers fichiers ajoutés avec `git add`.
- `git push` permet de pousser vos commits sur la branche courante du repo remote (mets à jour la branche avec vos changements, en gros).
- `git rebase {nom de la branche}` permet de "merge" votre branche courante avec les derniers changements de `{nom de la branche}`.
