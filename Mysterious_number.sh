#!/bin/bash

monRandom=${RANDOM:0:2}
enCours=1
tentative=0
nbTentative=0
echo ${monRandom}
while [ ${enCours} -eq 1 ]
do
    echo "Entrer un chiffre entre 0 et 99"
    read tentative
    let "nbTentative=nbTentative+1"
    if [ ${tentative} -eq ${monRandom} ];
    then
        echo "You Win"
        break
    else
        if [ ${tentative} -gt ${monRandom} ];
        then
            echo "Trop grand"
        else
            echo "Trop petit"
        fi
    fi
done
echo "Nombre de tentative ${nbTentative}"
touch score.txt
echo "Entrer votre nom pour les scores !"
read nom
line=$(head -1 score.txt)
echo ${line}
awk '{ print "2e champs:", $2}' ${line}
echo "${nom} ${nbTentative}" >> score.txt

#echo "Meilleur score : "
#head -1 score.txt
