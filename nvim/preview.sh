[ -f $1 ] && bat -pp $1 && exit
[ -d $1 ] && exa -l $1 && exit
echo $1
