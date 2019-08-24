# cshrc for longfei on MDD449
set path = (.  $path) #add . to path
#alias valgrindebug "/usr/bin/valgrind --tool=memcheck --suppressions=/home/lil19/valgrind.supp --num-callers=20 --error-limit=no --db-attach=yes  --max-stackframe=3146824"

#alias valgrindsuppress "/usr/bin/valgrind --gen-suppressions=yes --tool=memcheck --suppressions=/home/lil23/valgrind.supp --num-callers=20 --error-limit=no --db-attach=yes  --max-stackframe=3146824"

#setenv TEXINPUTS ".::/home/lil23/latex2e"

alias module "set args = (\!*); source $HOME/bin/module"


#some defs for convenience
setenv OVHOME $HOME/overtureframework
set of = $HOME/overtureframework


#add MPI to path
#setenv MPI_ROOT /home/lil23/Software/mpich-3.2-install
#setenv MPI_ROOT /home/lil23/Software/openmpi-2.1.1-install
#set path = ($MPI_ROOT/bin $path)
