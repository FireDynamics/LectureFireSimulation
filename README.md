[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

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
2. Inside the repository, setup a virtual environment for Python
```
python -m venv .venv
```
3. Activate the virtual environment
```
source .venv/bin/activate
```
4. Install the required Python packages, needed only once
```
pip install -r requirements.txt
```
5. Launch JupyterLab
```
jupyterlab
```
6. Do some editing. The contents of the book are stored in the `content` folder.
7. Build a local version of the book
```
cd book
jupyter-book build .
```
Note: Some notebooks are capable to turn the output of matplotlib figures on and off based on the environment variable JB_NOSHOW. It should be set (to any value) to prevent the rendering of dublicate figures, e.g.:

```
cd book
JB_NOSHOW=1 jupyter-book build .
```

8. If the build is sucessful, the location of the build book is stated. You can open it with a browser.

## Data Repository

The simulation input files as well as the resulting simulation data is stored in the `data` folder.

### Execution of Simulations

In all data subfolders, FDS input files as well as a run script `case_run.sh` is located. You may have to adjust the execution command of FDS at the top of the script. 

### Download Precomputed Data

The `case_download.sh` script inside the individual data subfolders can be used to download precomputed data.

## Contribution

### For external

Please for the `development` branch and create a pull request based on that.

### For internal

**New section / content**: Create a feature branch of `development`. Once finished, merge it back and create a release branch with your changes that have to be pushed to `main`. Assign Lukas as reviewer for the pull request.

**Typos / Fixes**: Push them directly to the `development` branch and then directly to `main`.

## License

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
