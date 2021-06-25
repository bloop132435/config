set history filename ~/.gdb_history
set $COLOREDPROMPT = 1
set history save on
set print pretty on
set print array on
set print null-stop
skip -gfi /usr/include/**/*
skip -gfi /usr/include/c++/11.1.0/**/*
skip -gfi /usr/include/c++/11.1.0/*
skip -rfu ^std.*
skip -rfu ^_.*
python
import sys
sys.path.insert(0,"/usr/share/gcc-11.1.0/python")
from libstdcxx.v6.printers import register_libstdcxx_printers
end
source /home/gqian/git/gdb-helpers/load-helpers.py
set $BLACK = 0
set $RED = 1
set $GREEN = 2
set $YELLOW = 3
set $BLUE = 4
set $MAGENTA = 5
set $CYAN = 6
set $WHITE = 7

# CHANGME: If you want to modify the "theme" change the colors here
#          or just create a ~/.gdbinit.local and set these variables there
set $COLOR_REGNAME = $GREEN
set $COLOR_REGVAL = $BLACK
set $COLOR_REGVAL_MODIFIED  = $RED
set $COLOR_SEPARATOR = $BLUE
set $COLOR_CPUFLAGS = $RED

# this is ugly but there's no else if available :-(
define color
 if $USECOLOR == 1
 	# BLACK
 	if $arg0 == 0
 		echo \033[30m
 	else
 		# RED
	 	if $arg0 == 1
	 		echo \033[31m
	 	else
	 		# GREEN
	 		if $arg0 == 2
	 			echo \033[32m
	 		else
	 			# YELLOW
	 			if $arg0 == 3
	 				echo \033[33m
	 			else
	 				# BLUE
	 				if $arg0 == 4
	 					echo \033[34m
	 				else
	 					# MAGENTA
	 					if $arg0 == 5
	 						echo \033[35m
	 					else
	 						# CYAN
	 						if $arg0 == 6
	 							echo \033[36m
	 						else
	 							# WHITE
	 							if $arg0 == 7
	 								echo \033[37m
	 							end
	 						end
	 					end
	 				end
	 			end
	 		end
	 	end
	 end
 end
end

define color_reset
    if $USECOLOR == 1
	   echo \033[0m
    end
end

define color_bold
    if $USECOLOR == 1
	   echo \033[1m
    end
end

define color_underline
    if $USECOLOR == 1
	   echo \033[4m
    end
end

# this way anyone can have their custom prompt - argp's idea :-)
# can also be used to redefine anything else in particular the colors aka theming
# just remap the color variables defined above
source ~/.gdbinit.local

# can't use the color functions because we are using the set command
if $COLOREDPROMPT == 1
	set prompt \033[31mgdb$ \033[0m
end
