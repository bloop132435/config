set history filename ~/.gdb_history
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
