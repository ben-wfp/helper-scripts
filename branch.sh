#! /bin/bash

read -p "
Enter branch type:
- chore (c)
- docs (d)
- feat (fe)
- fix (fi)
- refactor (r) 
- style (s) 
- test (t) 
" type

if [ $type == 'c' ]; then 
    typename='chore'
elif [ $type == 'd' ]; then
    typename='docs'
elif [ $type == 'fe' ]; then
    typename='feat'
elif [ $type == 'fi' ]; then
    typename='fix'
elif [ $type == 'r' ]; then
    typename='refactor'
elif [ $type == 's' ]; then
    typename='style'
elif [ $type == 't' ]; then
    typename='test'
else
    cowsay "Bad option. Try again"; exec $0
fi

read -p "
Enter ticket number:" ticket

read -p "
Enter branch description (kebab-case):" desc

branchname="${typename}/WEB-${ticket}_${desc}"

echo "
Creating branch named ${branchname}, off main
"

git checkout main && git pull origin main && git checkout -b $branchname