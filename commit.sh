#! /bin/bash

echo "
Creating commit based on current branch name...."

fullbranchname=$(git branch --show-current)

IFS='_'
 
read -ra brancharray <<< "$fullbranchname"

IFS='/'

read -ra brancharray <<< "$brancharray"

type="${brancharray[0]}"
ticket="${brancharray[1]}"

if [[ $ticket == '' ]]; then 
    cowsay "Not on feature branch. Exiting"; exit 1
fi

echo "
Creating commit message in the form: ${type}(domain): ${ticket} <commit message>"

read -p "Enter domain (or hit enter if none): " domain

if [[ $domain != '' ]]; then 
    domain="(${domain})"
fi

read -p "Enter commit message (Sentence case, imperative form): " msg

if [[ $msg == '' ]]; then 
    cowsay "Commit message mandatory :-("; exit 1
fi

read -p "Stage all files by passing the -a flag? (y/n): " stage

commitmsg="${type}${domain}: ${ticket} ${msg}"

echo "
Executing commit with commit message: ${commitmsg}"

if [ $stage == 'y' ]; then 
    git commit -am "'${commitmsg}'"
elif [ $stage == 'n' ]; then
    git commit -m "'${commitmsg}'"
else
    cowsay "Bad option :-("; exit 1
fi
