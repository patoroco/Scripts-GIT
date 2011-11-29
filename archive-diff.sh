if [[ -n $1 ]]; then
    TAGhasta=$1
else
	echo "Opciones: "
	echo "$0 VERSION-desde"
	echo "$0 VERSION-desde VERSION-hasta"
    exit
fi

if [[ -n $2 ]]; then
	TAGdesde=$2
else
	TAGdesde='HEAD'
fi

echo "GIT diff:
=========
	+ Desde: $TAGdesde
	+ Hasta: $TAGhasta
	+ Archivo: diff-`date +%Y%m%d%H%M`.tar

Archivos incluidos: 
===================
`git diff $TAGhasta $TAGdesde --name-only`"
git archive -o diff-`date +%Y%m%d%H%M`.tar $TAGdesde `git diff $TAGhasta --name-only`