CURRENTDIR=`dirname $BASH_SOURCE`
echo "Setting up todo config"
rm -rf ~/.todo
mkdir ~/.todo
ln -s $CURRENTDIR/config ~/.todo/config