echo "Creating nvim links" 

CURRENTDIR=`dirname $BASH_SOURCE`
ln -f -s "$CURRENTDIR/init.vim" "$HOME/.config/nvim/init.vim"
ln -f -s "$CURRENTDIR/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
