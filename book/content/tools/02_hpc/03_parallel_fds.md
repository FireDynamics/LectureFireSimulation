# Parallel Execution of FDS

## Accessing JURECA

### Accounts

You should have received an invitation email, which asks you to register in the account management system. One registered, you will receive an individual username.

### SSH

To reach the computercluster JURECA you need to log in via the [secure shell protocol (SSH)](https://en.wikipedia.org/wiki/Secure_Shell_Protocol). It is recommened to read the user documention which can be found here: [access JURECA using SSH](https://apps.fz-juelich.de/jsc/hps/jureca/access.html).

Most Linux and MacOS systems have a SSH client installed. On Windows, you can use tools like [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

Depending on your SSH client, there are various ways to genearte a SSH key pair (public and private). In any case, it should be protected with a passphrase.

One of the safety measure on JURECA is, that you need to specify the IP range from which you access the system, see [kee restrictions](https://apps.fz-juelich.de/jsc/hps/jureca/access.html#key-upload-key-restriction). If you use VPN, e.g. provided by the University of Wuppertal, your `from` statement could include `*.uni-wuppertal.de`. 

### Login

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


## FDS Module on JURECA

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

**Four meshes in x-directio**

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

**Nine meshes, three in each directio**
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