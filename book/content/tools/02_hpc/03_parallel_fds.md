# Parallel Execution of FDS

## Basics

Below two different HPC clusters are discussed. Make sure to look into the system that you will be working on. The computer [JURECA](https://www.fz-juelich.de/en/ias/jsc/systems/supercomputers/jureca) is located at the Forschungszentrum Jülich (FZJ) and [Pleiades](https://pleiades.uni-wuppertal.de/en/) is located at the Bergische Universität Wuppertal (BUW), both in Germany.

Follow the respective link to the documentation of [JURECA](https://apps.fz-juelich.de/jsc/hps/jureca/index.html) or [Pleiades](https://pleiadesbuw.github.io/PleiadesUserDocumentation/).


### SSH

To reach the compute clusters you need to log in via the [secure shell protocol (SSH)](https://en.wikipedia.org/wiki/Secure_Shell_Protocol).

Most Linux and MacOS systems have a SSH client installed. On Windows, you can use tools like [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) for the connection per terminal and [WinSCP](https://winscp.net/eng/download.php) to copy files with a graphical user interface.

Depending on your SSH client, there are various ways to generate a SSH key pair (public and private). It should always be protected with a passphrase.

One of the safety measures on JURECA is, that you need to specify the IP range from which you access the system, see [key restrictions](https://apps.fz-juelich.de/jsc/hps/jureca/access.html#key-upload-key-restriction). If you use VPN, e.g. provided by the University of Wuppertal, your `from` statement could include `*.uni-wuppertal.de`.


### Environment modules (Lmod)
With [Lmod](https://lmod.readthedocs.io/en/latest/) the user is able to dynamically change the terminal environment. This is convenient for example when different simulation software versions are to be used. See below for guides of the modules on the systems JURECA and Pleiades.

Documentation of Lmod can be found [here](https://lmod.readthedocs.io/en/latest/010_user.html). Some of the most important commands are reproduced here.

To find out what modules are available to be loaded, type:

```none
> module avail
```

An overview over already loaded modules is provided with the following command:

```none
> module list
```

Desired modules can simply loaded by typing:

```none
> module load package1 package2 ...
```

For unloading use the following command:

```none
> module unload package1 package2 ...
```

A user may wish to go back to an initial set of modules:

```none
> module reset
```

Another way to search for modules is with the “`module spider`” command. This command searches the entire list of possible modules:

```none
> module spider
```

What is now the difference between “`module avail`” and “`module spider`”? Lmod reports only the modules that are in the current MODULEPATH (`module avail`). Those are the only modules that the user can load. If there is a modulefile hierarchy, then a package the user wants may be available but not with the current compiler version (`module spider`).

This is explained in the [“Module Hierarchy” and “Searching for Modules” sections](https://lmod.readthedocs.io/en/latest/010_user.html).



### SLURM
A computer cluster is often used by a lot of users. Therefore, executing a program which needs a lot of the resources could slow down the network or even the OS. To efficiently use the provided resources of a large compute cluster, workload managers are used. A common workload manager is [SLURM](https://slurm.schedmd.com/documentation.html), which is also used on JURECA and Pleiades.

Some of the basic commands are reproduced here. Many parameters can be used to control the behaviour of the individual commands. Look into the [documentation](https://slurm.schedmd.com/documentation.html) for a comprehensive overview.

An overview over all jobs in the queue is provided with:

```none
> squeue
```

More useful is to limit the output to the jobs of the user, which can be accomplished by adding the following parameters:

```none
> squeue -u $USER
```

Look also to the "Aliases" section to set up the `myjobs` alias.


To submit submit a job for execution or initiate job steps in real time use the following. A job can contain multiple job steps executing sequentially or in parallel on independent or shared resources within the job's node allocation.:

```none
> srun
```

Jobs can be canceled by using `scancel` and providing the job id number:

```none
> scancel job_id_number
```

Here, some parameters are handy. For example all jobs can be canceled that have the same name, thus one does not need to enter many job ids (see also job scripts for the names):

```none
> scancel -n job_name
```

One might want to further limit the command, by setting the focus on jobs with a specific name and also state. For example `PENDING` or `RUNNING`:

```none
> scancel -n job_name --state="PENDING"
```

Often different queues exist on the computers. These can be defined by the maximum runtime of a job or the resources available, for example if the computer has also access to GPU clusters. For example [Pleiades provides](https://pleiadesbuw.github.io/PleiadesUserDocumentation/slurm) a couple different queues: "short" limited to 1 h for testing, "normal" a 3 day limit (default), "long" with a time limit of 7 days and "gpu" for access to the GPU cluster with a time limit of 3 days. Note: best practice is to use the shortest queue for your jobs! These queues are called "partition", the respective parameter is `--partition` or short `-p`:

```none
> srun --partition=normal
```

More information about the available queues and their time limits can be retrieved by the `sinfo` command:


### Job Submission

After the brief overview over the different different commands above let's go into a bit more detail now. Focus is on setting up scripts that define a job and send it to the scheduler. Generally, one would not run jobs manually since it somewhat defeats the purpose of a resource management system.


Instead of running our simulation on the cluster we either submit our simulation file to the queuing system or execute a submit code which includes the modules we need for FDS, sets the number of processes, threads and other important quantities.

More information is provided in [JURECA's batch system documentation](https://apps.fz-juelich.de/jsc/hps/jureca/batchsystem.html) and [Pleiades batch system](http://www.pleiades.uni-wuppertal.de/index.php?id=slurm).



#### Single Job

The structure of a SLURM job script is basically that of a shell script. This shell script will be executed by the batch system on the requested resource. The definition of the resource is done as comments (`#`) with the `SLURM` keywords. These are instructions for SLURM.

A simple example for a SLURM job scipt ({download}`fds-slurm-job-single.sh`) is given below. It executes FDS for a single FDS input file.

```{literalinclude} ./fds-slurm-job-single.sh
```



The SLURM keywords in the individual lines are described in more detail below.

* **Naming**

  ```
  #SBATCH --job-name=my_FDS_simulation
  ```

  You can name your job in order to find it quicker in the job lists. The name can also be used to selectively cancel job chains, since each repetition uses the same name. For example, the following would cancel all instances of a job that are waiting for resources, i.e. are not yet running:

  ```
  > scancel -n my_FDS_simulation --state="PENDING"
  ```

  Thus, you may want to put some effort in naming your jobs.

* **Accounting**

  ```
  #SBATCH --account=ias-7
  ```

  On JURECA, for example, you need to have a computing time project and your account needs to be assigned to it. This budget is used to "buy" a normal/high priority in the queuing system. Using `account` you specify which computing time budget will be debited for the specified job. Here `ias-7` is indicating the project we will use for this lecture. It is the budget of the IAS-7 at the Forschungszentrum Jülich.

* **Partition**

  ```
  #SBATCH --partition=dc-cpu
  ```

  Typically, the resources of a computing cluster are organised in some fashion. For example, JURECA's batch system is divided into multiple partitions, which represent different computing architectures. In our case we want to execute the simulation on common CPU cores and therefore we use the partition `dc-cpu` – more information on [JURECA's partitions](https://apps.fz-juelich.de/jsc/hps/jureca/batchsystem.html#slurm-partitions).

  Pleiades distinguishes also between CPU and GPU resources. Furthermore, it provides three queues with different durations for which the CPU resources can be booked, up to seven days, see [Pleiades partitions](https://pleiadesbuw.github.io/PleiadesUserDocumentation/slurm).

* **MPI Tasks**

  ```
  #SBATCH --ntasks=128
  #SBATCH --cpus-per-task=1
  ```

  There are different ways how to define the number of requested cores. It is possible to state how many MPI tasks (`ntasks`) are to be started and how many cores each of them (`cpus-per-task`) will get assigned. The product of these will lead to the number of physical cores and thus to the number of nodes to be allocated. In the current configuration of the `dc-cpu` partition, each node has 128 cores (JURECA). An alternative is to specify the number of nodes, which would lead to the number of MPI tasks to be started.


* **Terminal Output**

  ```
  #SBATCH --output=stdout.%j
  #SBATCH --error=stderr.%j
  ```

  Here the file name for the standard output and error log are defined. `%j` will be replaced by the job id generated by SLURM.

* **Wall Clock Time**

  ```
  #SBATCH --time=00:30:00  # days-hours:minutes:seconds
  ```

  This line specifies the maximum time the job can run on the requested resource. The maximal wall clock time is stated in the documentation for the individual partitions. The `cd-cpu` partition has a limit of 24 hours (JURECA). Different rules apply for Pleiades where multiple days can be requested. The general syntax is `days-hours:minutes:seconds`.

* **Setting OpenMP Environment**

  ```
  export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
  ```

  As FDS can utilise OpenMP, the according environment variable (`OMP_NUM_THREADS`) needs to be set. The above command sets it automatically to the number given by `cpus-per-task` in the SLURM section.

* **Load FDS Modules**

  Available Lmod modules are stored in different locations on both computers. On JURECA use:
  ```
  module use -a ~arnold1/modules_fire/
  module load FDS/6.7.5-IntelComp2020.2_ParaStationMPI_5.4.7
  ```
  On Pleiades use:
  ```
  module use -a /beegfs/larnold/modules/
  module load FDS
  ```

  Here, first the module environment containing the FDS module is included, then the specified FDS module is loaded.

* **Execute FDS**

  A MPI-parallel application is started with `srun` on JURECA:
  ```
  srun fds ./*.fds
  ```

  This is different on Pleiades:
  ```
  mpiexec fds ./*.fds
  ```


   If not explicitly stated, like in the above line, the number of MPI tasks is specified by the SLURM environment, i.e. will follow some default setup.

```{note}
It is important to keep in mind, that JURECA's usage concept is to assign compute nodes **exclusively** to a single job. Thus, the resources used are given by the number of nodes used and the wall clock time. In the current setup the `dc-cpu` partition has nodes with 128 cores, so even if jobs use just a few cores, the account is charged with 128 cores (a full node).
```

* **Submit job script**

A SLURM job can be submitted via

```
> sbatch fds-slurm-job-single.sh
```

The current status of a user's queue can be listed with

```
> squeue -u $USER
```


#### Chain Jobs

As there are time limits of 24 hours on JURECA and up to seven days on Pleiades, each job that needs more time has to restart at some point. The following scripts automate the process for FDS on JURECA. It is important that the FDS input file has the `RESTART` parameter is explicitly defined in the input file and set to `.FALSE.`. The script will look up this parameter in the input and replace it with `.TRUE.`.

Also, it is in general useful to have FDS create intermediate restart files to prevent data loss when some crash happens - which happens more often than you might expect...

The main idea is to invoke multiple jobs ({download}`fds-slurm-chain-starter.sh`) with a dependency, i.e. a chain is created, so that the jobs are consecutively executed. The two primary ways are `-d afterok` to start the next job if the one before completed successfully or `-d afternotok` to start it even if the one before crashed.

```{literalinclude} ./fds-slurm-chain-starter.sh
```

The individual jobs ({download}`fds-slurm-chain-job.sh`) are similar to the above simple setting. However, they add the functionality to create a `CHID.stop` file to stop FDS gracefully, before the requested wall clock time is reached. The parameter `#SBATCH --signal=B:SIGUSR1@600` will send a signal 600 seconds before the scheduled end of the job. This way restart files are written out by FDS, which can be used for the next chain element. The value of `RESTART` is automatically set to `.TRUE.` after the first execution of FDS.

```{literalinclude} ./fds-slurm-chain-job.sh
```


```{note}
Most of the above commands are very general, yet a few, like the modules to be loaded as well as the way to run a MPI application, i.e. using `srun` or `mpiexec`, may have to be adopted to the used system.
```



#### Some pointers and best practice

* **Be mindful of the structure of your job**

When requesting resources think a bit how your job is structured and what your resource request means specifically. For example, assume you were to run a job that consists of 128 individual simulations. If you request all tasks on a single node(JURECA), SLURM needs to wait until a complete node is free. It may also need to block parts of it in the mean time, such that it will not constantly filled with jobs that use less cores. Depending on the load of the cluster this can lead to extended wait times. However, in the assumed setup it is not necessary that all jobs run on the same node. You where to set it up the other way around, with one task per node. Now, SLURM needs to only find small spaces and this might be easier accomplished, thus the job starts faster. For example:

```
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --nodes=128
```

* **Be mindful of network traffic**

When your jobs require a lot of read and write access to disk it might be beneficial to store the files on the worker node during execution. Specifically, when the job is large, like a smoke extraction simulation in a warehouse with many meshes. Because all these attempts to read and write would be sent through the network between worker and login nodes and might  slow down the whole system. This is bad for you because the simulation takes longer to complete and bad for everyone else for the same reason.



## Accessing JURECA

### Accounts and Accounting

You should have received an invitation email, which asks you to register in the account management system. Once registered, you will receive an individual username and be asked to upload your login keys. Your account is managed via [JuDoor](https://judoor.fz-juelich.de/login).

Furthermore, the account is connected one or more projects and thus some budget of computing time. The user needs to specify which budget to draw from, when setting up jobs. The resource management system SLURM has a parameter for this: `--account=budget_name`.


### Login

Connecting to JURECA is done via SSH. It is recommended to read the user documentation, which can be found here: [access JURECA using SSH](https://apps.fz-juelich.de/jsc/hps/jureca/access.html).

In order to login to JURECA on a Linux or MacOS you just need to execute

```none
> ssh username1@jureca.fz-juelich.de
```

Or you add a configuration to `~/.ssh/config` like

```
Host jureca
     User username1
     Hostname jureca.fz-juelich.de
```

which allow a shorter command

```
> ssh jureca
```

````{admonition} Task
Login to JURECA and check your username, the server you have logged in to and the path to your home directory. The result should look similar to

```
> whoami
username1
> hostname
jrlogin06.jureca
> echo $HOME
/p/home/jusers/username1/jureca
```
````


### FDS Modules on JURECA

Modules offer a flexible environment to manage multiple versions of software. This system is also used on JURECA: [Module usage on JURECA](https://apps.fz-juelich.de/jsc/hps/jureca/software-modules.html).

As the FDS (and some other) modules are not globally installed, they need to be added to the user's environment. This can be done with

```
> module use -a ~arnold1/modules_fire/
```

Thus, adding this line to your batch scripts and startup script (`~/.bashrc`) will automatically add the related modules to the module environment.

````{admonition} Task

* Use the `module avail` command to list all available modules. Make sure, you see also the FDS modules.
* Load a FSD module and invoke FDS with `fds`. Does the loaded version of FDS correspond to the one you expected?

````

## Accessing the Pleiades Cluster / CoBra

### Accounts

Please contact Lukas for an account.

### Login

Connecting to Pleiades is done via SSH. Using the provided credentials, you can use SSH to login to the front-end `fugg1.pleiades.uni-wuppertal.de` from within the university's network.


### FDS Modules on the Pleiades Cluster

On Pleiades, the modules need to be added to the user's environment with

```
module use -a /beegfs/larnold/modules
```

The (default) FDS module can be loaded with

```
module load FDS
```

which sets up the environment to run FDS in parallel. The name of the FDS executable is `fds`.


## Mesh Decomposition

Python scipt to automate decomposition of a single `MESH` statement: {download}`decompose_fds_mesh.py`.

Usage: `python decompose_fds_mesh.py MESH DECOMPOSITION`

**One mesh, i.e. no decompositon**

```
> python decompose_fds_mesh.py "&MESH IJK=12,12,12 XB=0,12,0,12,0,12 /" "1,1,1"
raw input mesh: &MESH IJK=12,12,12 XB=0,12,0,12,0,12 /
raw input decomposition: 1,1,1
raw ijk: IJK=12,12,12
i: 12, j: 12, k: 12
raw xb: XB=0,12,0,12,0,12
x: 0.0,12.0
y: 0.0,12.0
z: 0.0,12.0
decomposition: 1, 1, 1
lx: 12.0, dx: 12.0, di: 12
ly: 12.0000, dy: 12.0000, dj: 12
lz: 12.0000, dz: 12.0000, dk: 12
resulting number of meshes: 1
===========================
&MESH ID='1' IJK=12,12,12 XB=0.0000,12.0000,0.0000,12.0000,0.0000,12.0000 /
```

**Four meshes in x-direction**

```
> python decompose_fds_mesh.py "&MESH IJK=12,12,12 XB=0,12,0,12,0,12 /" "4,1,1"
raw input mesh: &MESH IJK=12,12,12 XB=0,12,0,12,0,12 /
raw input decomposition: 4,1,1
raw ijk: IJK=12,12,12
i: 12, j: 12, k: 12
raw xb: XB=0,12,0,12,0,12
x: 0.0,12.0
y: 0.0,12.0
z: 0.0,12.0
decomposition: 4, 1, 1
lx: 12.0, dx: 3.0, di: 3
ly: 12.0000, dy: 12.0000, dj: 12
lz: 12.0000, dz: 12.0000, dk: 12
resulting number of meshes: 4
===========================
&MESH ID='1' IJK=3,12,12 XB=0.0000,3.0000,0.0000,12.0000,0.0000,12.0000 /
&MESH ID='2' IJK=3,12,12 XB=3.0000,6.0000,0.0000,12.0000,0.0000,12.0000 /
&MESH ID='3' IJK=3,12,12 XB=6.0000,9.0000,0.0000,12.0000,0.0000,12.0000 /
&MESH ID='4' IJK=3,12,12 XB=9.0000,12.0000,0.0000,12.0000,0.0000,12.0000 /
```

**Nine meshes, three in each direction**
```
> python decompose_fds_mesh.py "&MESH IJK=12,12,12 XB=0,12,0,12,0,12 /" "3,3,3"
raw input mesh: &MESH IJK=12,12,12 XB=0,12,0,12,0,12 /
raw input decomposition: 3,3,3
raw ijk: IJK=12,12,12
i: 12, j: 12, k: 12
raw xb: XB=0,12,0,12,0,12
x: 0.0,12.0
y: 0.0,12.0
z: 0.0,12.0
decomposition: 3, 3, 3
lx: 12.0, dx: 4.0, di: 4
ly: 12.0000, dy: 4.0000, dj: 4
lz: 12.0000, dz: 4.0000, dk: 4
resulting number of meshes: 27
===========================
&MESH ID='1' IJK=4,4,4 XB=0.0000,4.0000,0.0000,4.0000,0.0000,4.0000 /
&MESH ID='2' IJK=4,4,4 XB=0.0000,4.0000,0.0000,4.0000,4.0000,8.0000 /
&MESH ID='3' IJK=4,4,4 XB=0.0000,4.0000,0.0000,4.0000,8.0000,12.0000 /
&MESH ID='4' IJK=4,4,4 XB=0.0000,4.0000,4.0000,8.0000,0.0000,4.0000 /
&MESH ID='5' IJK=4,4,4 XB=0.0000,4.0000,4.0000,8.0000,4.0000,8.0000 /
&MESH ID='6' IJK=4,4,4 XB=0.0000,4.0000,4.0000,8.0000,8.0000,12.0000 /
&MESH ID='7' IJK=4,4,4 XB=0.0000,4.0000,8.0000,12.0000,0.0000,4.0000 /
&MESH ID='8' IJK=4,4,4 XB=0.0000,4.0000,8.0000,12.0000,4.0000,8.0000 /
&MESH ID='9' IJK=4,4,4 XB=0.0000,4.0000,8.0000,12.0000,8.0000,12.0000 /
&MESH ID='10' IJK=4,4,4 XB=4.0000,8.0000,0.0000,4.0000,0.0000,4.0000 /
&MESH ID='11' IJK=4,4,4 XB=4.0000,8.0000,0.0000,4.0000,4.0000,8.0000 /
&MESH ID='12' IJK=4,4,4 XB=4.0000,8.0000,0.0000,4.0000,8.0000,12.0000 /
&MESH ID='13' IJK=4,4,4 XB=4.0000,8.0000,4.0000,8.0000,0.0000,4.0000 /
&MESH ID='14' IJK=4,4,4 XB=4.0000,8.0000,4.0000,8.0000,4.0000,8.0000 /
&MESH ID='15' IJK=4,4,4 XB=4.0000,8.0000,4.0000,8.0000,8.0000,12.0000 /
&MESH ID='16' IJK=4,4,4 XB=4.0000,8.0000,8.0000,12.0000,0.0000,4.0000 /
&MESH ID='17' IJK=4,4,4 XB=4.0000,8.0000,8.0000,12.0000,4.0000,8.0000 /
&MESH ID='18' IJK=4,4,4 XB=4.0000,8.0000,8.0000,12.0000,8.0000,12.0000 /
&MESH ID='19' IJK=4,4,4 XB=8.0000,12.0000,0.0000,4.0000,0.0000,4.0000 /
&MESH ID='20' IJK=4,4,4 XB=8.0000,12.0000,0.0000,4.0000,4.0000,8.0000 /
&MESH ID='21' IJK=4,4,4 XB=8.0000,12.0000,0.0000,4.0000,8.0000,12.0000 /
&MESH ID='22' IJK=4,4,4 XB=8.0000,12.0000,4.0000,8.0000,0.0000,4.0000 /
&MESH ID='23' IJK=4,4,4 XB=8.0000,12.0000,4.0000,8.0000,4.0000,8.0000 /
&MESH ID='24' IJK=4,4,4 XB=8.0000,12.0000,4.0000,8.0000,8.0000,12.0000 /
&MESH ID='25' IJK=4,4,4 XB=8.0000,12.0000,8.0000,12.0000,0.0000,4.0000 /
&MESH ID='26' IJK=4,4,4 XB=8.0000,12.0000,8.0000,12.0000,4.0000,8.0000 /
&MESH ID='27' IJK=4,4,4 XB=8.0000,12.0000,8.0000,12.0000,8.0000,12.0000 /
```
