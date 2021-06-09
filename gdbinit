set history filename ~/.gdb_history
set history save on
set print pretty on
python
import sys
sys.path.insert(0,"/usr/share/gcc-11.1.0/python")
from libstdcxx.v6.printers import register_libstdcxx_printers
end
source /home/gqian/git/gdb-helpers/load-helpers.py
