export selection=$((echo "main"; echo "cp"; echo "blank") | rofi -p "Kitty Selection" -dmenu)

case $selection in
	main )
		kitty --session ~/.config/kitty/main.conf &
		;;
	cp )
		kitty --session ~/.config/kitty/cp.conf &
		;;
	blank )
		kitty &
		;;
	* )
		echo "No Kitty session chosen"
		;;
esac
