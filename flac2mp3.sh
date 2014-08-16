#!/bin/bash
# v: 0.1
# date de création: 16/08/2014
# Un petit script pour convertir les fichiers d'un dossier depuis flac vers mp3 à 320kb/s
# Problemes:
# Quand on essaie de changer le dossier qui contient éventuellement des fichiers Flac
# il ne les trouve pas et donc ne convertit rien


function show_help
{
  echo ""
  echo "  flac2mp3 is a little program about converting some"
  echo "  flac files in a folder to 320kb/s mp3"
  echo ""
  echo "  You can use the following options: "
  echo ""
  echo "  -h | --help       :  show this message"
  echo "  -d | --directory  :  choose the directory where all the *.flac files are stored"
  echo "  -f | --file       :  choose a specific file"
  echo "  -v | --verbose    :  set the verbose mode to true"
  echo "  -b |  -bitrate    :  change the bitrate"
  echo ""
}

function exiting
{
  if (($1 == 3)); then
    echo ""
    echo "bye !"
    echo ""
    exit 0
  else
    echo ""
    echo "exiting"
    echo ""
    exit "$1"
  fi
}

function problem_with
{
  echo ""
  echo "the parameter $1 expect at leat 1 argument"
  exiting 1
}

## Main
#
# Variables
directory="."
file="*.flac"
cpt=0
bitrate="320k"
verbose=false

##setting the getopt function
#the understandable version is in the show_help function
ARGS=$(getopt -o hvd:f:b: --long help,directory:,file:,verbose,bitrate: \
      -n 'flac2mp3.sh' -- "$@")
if [ $? != 0 ] ; then exit 1 ; fi
eval set -- "$ARGS";

while true; do
  case "$1" in
    -h|--help)
      shift;
      show_help
      exiting 0
      ;;
    -v|--verbose)
      verbose=true
      shift
      ;;
    -d|--directory)
      directory="$2"
      shift 2
      ;;
    -f|--file)
      file="$2"
      shift 2
      ;;
    -b|--bitrate)
      echo "le parametre bitrate : $2"
      bitrate="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "erreur interne"
      exiting 1 ;;
  esac
done
fullname="$directory/$file"
echo "On recherche les fichiers : $fullname"

for i in $fullname; do
    ((cpt++))
done
## Now we got the number of flac files and
# we print to the users the number of files
if ((cpt == 0)); then
  echo "No *.flac files where found";
  exiting 0;
elif ((cpt == 1)); then
  echo "1 *.flac file found";
else
  echo "$cpt *.flac files found";
fi

for f in $fullname; do
  filename=$(basename "$f" ".flac")
  filename="$directory/$filename.mp3"
  if $verbose; then
    echo "converting \"$f\" to \"$filename\" ..."
  fi
  avconv -i "$f" -threads 8 -c:a libmp3lame -ab "$bitrate" -y "$filename" &> /dev/null

done

echo "converting done"

exiting 3