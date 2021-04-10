# Lecture Fire Simulation
Lecture and exercise notes on fire simulations

## Webpage of the build script
https://firedynamics.github.io/LectureFireSimulation

## Local Development

*Note: The following explicit commands are for bash / zsh on Linux / MacOS.*

1. Clone repository
```
git clone https://github.com/FireDynamics/LectureFireSimulation.git
```
1. Inside the repository, setup a virtual environment for Python
```
python -m venv .venv
```
1. Activate the virtual environment
```
source .venv/bin/activate
```
1. Install the required Python packages, needed only once
```
pip install -r requirements.txt
```
1. Launch JupyterLab
```
jupyterlab
```
1. Do some editing. The contents of the book are stored in the `content` folder.
1. Build a local version of the book
```
cd book
jupyter-book build .
```
1. If the build is sucessful, the location of the build book is stated. You can open it with a browser.

## Data Repository

The simulation input files as well as the resulting simulation data is stored in the `data` folder.

### Execution of Simulations

In all data subfolders, FDS input files as well as a run script `case_run.sh` is located. You may have to adjust the execution command of FDS at the top of the script. 

### Download Precomputed Data

The `case_download.sh` script inside the individual data subfolders can be used to download precomputed data.
