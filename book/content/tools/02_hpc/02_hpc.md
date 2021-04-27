# High Performace Computing

Many scientific and engineering problems require a large amount of computing time and memory. This is generally only available on supercomputers / high performance computing (HPC) systems.

Typical applications are:

* science: particle physics, climate research, molecular dynamics
* engineering: CFD, structural mechanics, computer science

HPC with computing power thousands times larger than personal computer allows to significantly reduce the computing time and allows to address new modelling challenges. This is also becoming true for the fire safety science and engineering communities. 

*Example:* An CFD application run for a week on thousand processors would need 20 years on a personal computer (assuming it provides enough memory).

## Parallel Execution

### General Principle

An application, is in general a sequence of tasks. Here, a task can be understood as a group of commands or computations that can no further be separated, e.g. due to data dependency.

Yet, there is not necessary a depencece among the tasks. Thus, they can eventually be executed at the same time, see {numref}`fig-hpc-fork`. The process of distributing the tasks on multiple execution units (threads, cores, nodes) is called a fork, while the gathering of the results back to the main execution unit is called a join. During the fork, data and instructions have to be exchanged, thus this introduces an overhead, which is not present in a serial execution. The same is true for the join process, but an additional contribution to the overhead is induced by load balancing issues. Depending on the execution time of individual tasks, especially the longest task, the join process will be prolonged.


:::{figure-md} fig-hpc-fork
<img src="figs/fork.png" width="80%">

Serial and parallel execution of a set of tasks.
:::

### Speedup

The maximal achievable speedup $\mf s$, w.r.t. a serial execution, on $\mf n$ computing units is limited by the fraction of the execution that runs in parallel $\mf p$. This is reflected by Amdahl's law, see equation {eq}`eq-amdahls-law` and {numref}`fig-hpc-amdahl`. 

$$
s(n, p) = \frac{1}{p+\frac{1}{n}(1-p)} 
$$(eq-amdahls-law)

:::{figure-md} fig-hpc-amdahl
<img src="figs/amdahl.png" width="80%">

Visualisation for Amdah's law.
:::

The speedup may even decrease, as some operations become more expensive with increasing number of participating processes, e.g. synchronisation points, global data exchange or broadcasts. 

In cases, where a large number of execution units is involved and the tasks can not be well decomposed, an unequal work load per process may become the main problem. The execution of one iteration is in general determined by the longest task execution time.

:::{figure-md} fig-hpc-load-balance
<img src="figs/load_balance.png" width="80%">

Example of load balancing.
:::

### Parallelisation

In general, there is a zoo of possibilities to parallelise an application. In FDS, two of them are utilised:
* [Message Passing Interface (MPI)](https://en.wikipedia.org/wiki/Message_Passing_Interface), and
* [Open Multi-Processing (OpenMP or OMP)](https://en.wikipedia.org/wiki/OpenMP).

MPI is a language-independent communication protocol used to develop parallel computerprograms and has its main application  in distributed memory machines. The interface allows to explicitly exchange messages between processes. Therefore it is up to the programmer to design appropriate data structures and algorithms to decompose the application.

In CFD, typically the computational domain is explicitly decomposed and distributed over all MPI processes. For stencil operations only neighbour cells are needed, thus only a domain's halo needs to be shared.

Typically the data exchange (compose, transfer, decompose) produces the most overhead. This overhead is purely due to the explicit problem decomposition.

:::{figure-md} fig-hpc-domain-mpi
<img src="figs/decomp_mpi.png" width="40%">

Domain decomposition of a simple computational grid, like in FDS. The data communication (arrows) is handled with MPI.
:::

As MPI is only a definition standard, there is not a single implementation of MPI. The most common MPI implementations are:

* Open MPI, open source and free
* MPICH, open source and free
* Intel MPI Library (MPICH derivate), commercial

The MPI implementations include C/C++/FORTRAN header, libraries, compiler wrapper and a runtime environment.

In contrast to MPI, OpenMP (or short OMP) is a standard to implicitly distribute the execution on a shared memory system.

OMP is implemented as pragmas for C/C++/FORTRAN, and are therefore non intrusive. The typical application is to decompose loops and advise the compiler or the runtime to distribute the loop iterations. The data is not distributed and stays in place, see {numref}`fig-hpc-domain-omp`.

:::{figure-md} fig-hpc-domain-omp
<img src="figs/decomp_openmp.png" width="40%">

Domain decomposition with OpenMP.
:::

However, the compiler or runtime must detect independent tasks. Loop carried dependencies may prevent parallelisation and data races may produce unpredictable results.

To run an OMP application, there are a few handy environment variables 

* `OMP_NUM_THREADS`, number of OMP threads
* `OMP_STACKSIZE`, the size of the stack for each thread

The execution command is basically equal to the serial execution. A combination with MPI is possible and the OMP environment variables should be passed to the MPI processes. The hybrid approach (MPI+OMP) is used to reduce the number of MPI processes and therefore the overhead of non-scaling operations. Some details and benchmarks of the OMP and MPI+OMP implementation is given in {cite}`Haarhoff.2014`.



## Parallel Computer


A list of common terms used in HPC
* CPU, GPGPU, SIMD, SMP, NUMA, SMT
* compute node: nodes that are used only for computation, no direct user access
* front/login node: users login here, do compilation and job submission
* batch/submission system: system to allocate resources to a scheduled job
* interconnect: network between components or computing nodes (e.g. Infiniband, 10GE)
* FLOP/s: floating point operations per second
* peak performance: theoretical number of FLOP per second
* linpack performance: floating point performance in the linpack test
* top500 list: supercomputer ranking based on the linpack performance


:::{figure-md} fig-hpc-cluster
<img src="figs/cluster.png" width="40%">

A very generalistic representation of an element / node of a cluster.
:::



:::{figure-md} fig-hpc-moore
<img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Moore%27s_Law_Transistor_Count_1970-2020.png" width="80%">

The development of the transistor count in the last 5 decades, which is represented by Moore's law. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Moore%27s_Law_Transistor_Count_1970-2020.png).
:::


[Top500 List, performance development](https://www.top500.org/statistics/perfdevel/)

[JURECA @ FZJ](https://fz-juelich.de/ias/jsc/EN/Expertise/Supercomputers/JURECA/JURECA_node.html)



:::{figure-md} fig-hpc-jureca-dc
<img src="https://fz-juelich.de/SharedDocs/Bilder/IAS/JSC/EN/galeries/JURECA/JURECA-DC.jpg?__blob=poster" width="80%">

JURECA-DC cluster at the Forschungszentrum Jülich. Source: Forschungszentrum Jülich.
:::


CoBra ~ 110 TFLOP/s
