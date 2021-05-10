# Turbulence

Turbulence is one of the major scientific challenges. The mathematical description and experimental data related to fluid dynamics is known and available vor over one hundred years.

“Turbulence is the most important unsolved problem of classical physics.”
— Richard Feynman

”When I meet God, I am going to ask him two questions: Why relativity, and why turbulence?
I really believe he will have an answer for the first.”
— Werner Heisenberg

Understanding the nature of turbulence is one of the [Millennium Problems](https://www.claymath.org/millennium-problems/navier–stokes-equation).

## Characterisation

Among the first scientific experiments to characterise and analyse turbulent flows, is the work of [Osborne Reynolds](https://en.wikipedia.org/wiki/Osborne_Reynolds). He studied the conditions under which a flow undergoes the transition from a ordered to a chaotic state. One of these studies is published in {cite}`Reynolds:1883`, see {numref}`fig-turbulence-reynolds-experiment` and {numref}`fig-turbulence-reynolds-results`.

:::{figure-md} fig-turbulence-reynolds-experiment
<img src="https://upload.wikimedia.org/wikipedia/commons/f/f3/Reynolds_fluid_turbulence_experiment_1883.jpg" width="40%">

Reynolds' experiment in 1883. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Reynolds_fluid_turbulence_experiment_1883.jpg).
:::

:::{figure-md} fig-turbulence-reynolds-results
<img src="https://upload.wikimedia.org/wikipedia/commons/1/12/Reynolds_observations_turbulence_1883.svg" width="60%">

Observations of the flow in Reynolds' experiment, see also original article {cite}`Reynolds:1883`. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Reynolds_observations_turbulence_1883.svg).
:::

With these experiments the flow transition as a function of the Reynolds number can be investigated. An other example for the determination of the transition from a laminar to a turbulent state for a bouyant plume is shown in {numref}`fig-turbulence-plume-setup`. The full experimental setup and results are given in {cite}`Meunders:2018`.

:::{figure-md} fig-turbulence-plume-setup
<img src="./figs/turbulence-plume-setup.jpg" width="60%">

Experimental setup of a buoyant plume, see {cite}`Meunders:2018` for more details. Here, the heating power of the copper block determines the flow velocity.
:::

:::{figure-md} fig-turbulence-plume-quiver
<img src="./figs/turbulence-plume-velocity_quiver.png" width="80%">

Example of instanteneous velocity fields for different heating rates. The velocity field is captured with a [particle imaging velocimetry (PIV)](https://en.wikipedia.org/wiki/Particle_image_velocimetry) technique.
:::

:::{figure-md} fig-turbulence-plume-time-series
<img src="./figs/turbulence-plume-velocity_time_series.png" width="80%">

Time series of velocity components at selected locations (blue circles in {numref}`fig-turbulence-plume-quiver`).
:::

:::{figure-md} fig-turbulence-plume-fluctuations
<img src="./figs/turbulence-plume-velocity_fluctuations.png" width="80%">

Statistics of velocity fluctuations.
:::

The canonical setup for the transition form a laminar to a turbulent flow is a pipe flow, as shown in {numref}`fig-turbulence-pipe-setup`. Starting with a uniform flow at the inlet, the flow at the boudaries is deaccelarated and an acccording flow pattern develops. Depending on the Reynolds number, the mean velocity profiles differ significantly. While in the laminar case a parabolic profile develops, a flattened profile is characteristic for a turbulent flow, see {numref}`fig-turbulence-pipe-velocity`. An other observation is that the effective viscosity differs in both cases. While in the laminar case the observed value is the material property and thus constant, it shows a higher and dynamic value in the turbulent case, see {numref}`fig-turbulence-pipe-viscosity`. 

:::{figure-md} fig-turbulence-pipe-setup
<img src="./figs/turbulence-pipe-sketch-labeled.svg" width="80%">

Schematics of a pipe flow. The arrows indicate the time averaged velocity.
:::

:::{figure-md} fig-turbulence-pipe-velocity
<img src="./figs/turbulence-pipe-velocity.svg" width="80%">

Schematics mean flow in a pipe.
:::

:::{figure-md} fig-turbulence-pipe-viscosity
<img src="./figs/turbulence-pipe-viscosity.svg" width="80%">

Schematics of the effective viscosity in a pipe flow.
:::






## Scales

Turbulence is dominated by the interaction of large and small scales, which are very different:
* production of kinetic energy, e.g. a fire at a scale of $\mf 1~m$
* dissipation of kinetic energy into heat, in air with a velocity of $\mf 1~m/s$ the dissipation scale ([Kolmogorov scale](https://en.wikipedia.org/wiki/Kolmogorov_microscales)) is about $\mf 25~\mu m$

:::{figure-md} fig-turbulence-energy-cascade
<img src="./figs/energy-cascade.svg" width="100%">

Scales involved in a turbulent flow.
:::

The integral scale, at which the flow structures break into smaller structures, connects both above scales. 

To model turbulence, the impact of small scales on the large scales must be approximated. The main two approaches are based on either a spacial or a temporal means.


<!-- :::{figure-md} fig-turbulence-energy-spectrum
<img src="https://upload.wikimedia.org/wikipedia/commons/7/74/Schematic-illustration-of-the-energy-spectrum-of-turbulent-velocity-cascade.png" width="60%">

Energy spectrum of a turbulent flow. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Schematic-illustration-of-the-energy-spectrum-of-turbulent-velocity-cascade.png).
::: -->


## Modelling

In fire simulations, two classes of turbulence modelles are common: direct numerical simulatons (DNS) and large eddy simulations (LES). Although for practical applications only the LES class is suitable. 

:::{figure-md} fig-turbulence-modelling overview
<img src="./figs/turbulence-modelling-overview.svg" width="80%">

Overview of the resolved and modelled scales in DNS and LES Simulations.
:::


Further reading: {cite}`Pope:2004`