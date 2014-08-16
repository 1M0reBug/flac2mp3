Flac2Mp3
=========

### Présentation ###
Un petit script pour convertir un ensemble de fichier FLAC d'un dossier vers un des fichiers mp3. On peut onfigurer le dossier qui contient les fichiers, éventuellement ne convertir qu'un fichier sélectionné. Change le débit du mp3, etc.


### Dépendances ###
- Bash
- avconv
- ubuntu-restricted-extras 

### Problèmes ###
Pour le moment il y a un problème sur la sélection du dossier des fichier FLAC. Lorsqu'on le modifie il n'est pas pris en compte et bien souvent la conversion n'a pas lieu. Le mieu est d'effectuer une opération de ce genre (en supposant que le script est dans `home`)

```
$ cd Path/to/flac/files
$ ~/flac2mp3
```

en faisant ainsi les fichiers sont tous convertis vers des fichiers mp3 à 320kbps