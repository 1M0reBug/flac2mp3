Flac2Mp3
=========

### Présentation ###
Un petit script pour convertir un ensemble de fichier FLAC d'un dossier vers des fichiers mp3. On peut configurer le dossier qui contient les fichiers, éventuellement ne convertir qu'un fichier sélectionné. Change le débit du mp3, etc.


### Dépendances ###
- Bash
- avconv
- ubuntu-restricted-extras

### Fonctionnement ####
* pour convertir tous les fichier FLAC du dossier courant vers des fichiers MP3 (les fichiers d'origines sont conservés)
```
$ ./flac2mp3
```

* pour convertir en affichant les fichiers actuellements convertis et en modifiant le bitrate vers 128kbps.
```
$ ./flac2mp3 -vb 128k
```

* pour convertir à partir d'un dossier différent du courant (__boggué__)
```
$ ./flac2mp3 -d /dossier/distant/contenant/les/flacs
```



### Problèmes ###
Pour le moment il y a un problème sur la sélection du dossier des fichier FLAC. Lorsqu'on le modifie il n'est pas pris en compte et bien souvent la conversion n'a pas lieu. Le mieu est d'effectuer une opération de ce genre (en supposant que le script est dans `home`)

```
$ cd Path/to/flac/files
$ ~/flac2mp3
```

### Intérêt ###
#### Ou digressions diverses #####
Beaucoup vont me dire que l'intérêt d'un tel script est moindre. En effet un pocesseur de FLAC en général recherche une qualité bien supérieure à celle du MP3 contre la taille de sauvegarde. Oui mais c'est sans oublier le fait que parfois on peut croire connaitre tout sur le son et se fourvoyer lourdement.


Par exemple prenons un sujet M. Son petit-fils que nous appellerons K (juste parce que) est bien gentil et lui enregistre le dernier album d'untel à partir de fameux site de diffusion musicale en streaming en utilisant la sortie de sa carte son et une utilisation gratuite du site en question (donc une qualité d'émission plutôt moindre en général en MP3). Mais attention K est quelqu'un de sérieux, il décide que puisqu'il a enregistré la source et qu'il a une super qualité il serait mieux d'exporter en FLAC pour ne pas perdre de données.


Sauf que voilà au bout de quelques temps il n'y a plus trop de place sur l'ordinateur de M. Ça tombe bien puisqu'en parcourant certains articles sur le web K se rend compte que la qualité d'émission du site de streaming en question n'était pas top. Sauf que de reconvertir tout ça peut demander du temps. Heureusement il utilise Ubuntu.

Et voilà ! ;)