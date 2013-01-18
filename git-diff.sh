if [[ -n $1 ]]; then
    commitTo=$1
else
	echo "Options: "
	echo "$0 <FROM_reference>"
	echo "$0 <FROM_reference> <TO_reference>"
    exit
fi

if [[ -n $2 ]]; then
	commitFrom=$2
else
	commitFrom='HEAD'
fi

echo "GIT diff:
=========
	+ From: $commitFrom
	+ To: $commitTo
	+ File output: diff-`date +%Y%m%d%H%M`.tar

Files included: 
==============
`git diff $commitTo $commitFrom --name-only`"

git archive -o diff-`date +%Y%m%d%H%M`.tar $commitFrom `git diff $commitTo --name-only`