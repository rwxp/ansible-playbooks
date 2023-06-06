#!/bin/bash
# Example with 2 MPI tasks and 1 tasks per node.
#
# Number of MPI tasks
#SBATCH -n 2
#
# Number of tasks per node
#SBATCH --tasks-per-node=1
#
# build program
make

# And finally run the job​
srun ./mpi_hello_world

# End of submit file
