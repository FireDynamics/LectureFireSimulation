# Modelling Approaches

Fire safety science (FSS) and fire safety engineering (FSE) is not limited to describe fires and their impact on building structures, yet other topics, like evacuation or risk analysis, are not part of this lecture. The understanding and description of fires allows for technical and organisational (active and preventive) measures to limit or even prevent damage. In general, these descriptions lead to the development of mathematical models, which are validated using physical and chemical experiments. From the practical point of view, these models are applied to design and evaluate safety concepts. 

The development of analytical and numerical models aims to describe processes and / or the impacts related to fires. This is true for compartment as well as wildland fires and covers may aspects, like the height of the hot gas layer, the speed and direction at which flames propagate, the toxicity of smoke or the activation and effectivenes of technical measures. 

Models range from empirical data models to models based on first principles. Yet, mostly experiments are needed to adjust unknown model parameters and to validate the predictive capabilities of a model.

A brief and by far not complete or accurate overview of the historical time scales of scientific development, which modern day approaches are based on, is give in the following table.


```{list-table} Brief historic overview of scientific development
:header-rows: 1
:name: tab-history-overview
:widths: auto
:align: right

* - Time 
   - Event
   - Key Initiator
   
* - ∼1650
   - conservation of momentum
   - Newton

* - 1737 
   - relationship pressure and velocity in a fluid
   - Bernoulli
   
* - ∼1750
   - conservation of energy
   - Clausius
   
* - 1807
   - heat conduction equation
   - Fourier
   
* - 1827 / 1845
   - viscous equations of fluid motion
   - Navier & Stokes
   
* - 1855
   - mass diffusion equation
   - Fick
   
* - 1884
   - temperature dependent chemical reaction rate
   - Arrhenius
* - ~1900
   - thermal radiation
   - Planck
   
* - 1928
   - solution of diffusion flame in a duct
   - Burke & Schumann
   
* - ∼1930
   - combustion equations with kinetics
   - Semenov
   
* - ∼1950
   - convective burning solutions
   - Emmons & Spalding
   
* - ∼1960
   - diverse fire phenomena solutions
   - Thomas
```

## Experiments

Models little to no value if they are not supported by experiments. Thus the design and conduction of experiments on various scales is the fundament of fire safety science and engineering. Some experimental aspects in the context of experiments are: 
* material flamability tests
* measurement of quantities like heat release, structural temperatures, heat radiation, toxic gas concentrations, etc.
* bench-scale experiments for material or building element evaluation, potentially with a separation of effects
* real-scale experiments aim for the full integration of all interactions in a fire

:::{figure-md} fig-exp-cone-calorimeter

<img src="./figs/cone_calorimeter.png" width="60%">

Example for a bench-scale experimente: a cone calorimeter. The sample size is about $\sf\small 10~cm \times 10~cm$.
:::

:::{figure-md} fig-exp-orpheus

<img src="./figs/orpheus.jpeg" width="60%">

Example for a real-scale experimente: hot gas experiments within a metro station. These experiments were conducted by I.F.I. Aachen, Germany, within the [ORPHEUS](http://www.orpheus-projekt.de) project.
:::

Experiments differ from test. While a test checks for a property or a result, there is no explicit aim to gain scientific insight from it. In an experiment the outcome is designed with an open question and aims to extend the knowledge base with new findigs. 

## Analytical Models

The first level of models are analytical models. They are either based on empirical data and are thus just their mathematical representation. Or, they are based on fundamental approximations and symmetries, which lead to an closed analytical solution. 

Despite their, sometimes very limitting, approximations, they offer a tool to quickly estimate the quantites of interest. In addition, they can be directly integrated into other, potentially more complex, models. Another important aspect is, that analytical models can be checked by a reader, as it is in general possible to write down all needed input parameters. 

Of course, due to the underlying simplifications and assumptions, their applicability is limited.

**Example – Plume Temperature**

The measurement of the local gas temperature in a plume leads to an empirical description for the time averaged values. Based on measurements like in {numref}`fig-exp-plume-profile`, an mathematical formulation can be derived to describe the observarions. 

:::{figure-md} fig-exp-plume-profile

<img src="./figs/plume-profile-yokoi.png" width="40%">

Example for experimentally captured normalised temperature profiles of a plume. Source: {cite}`Yokoi.1960`.
:::

The temperature rise $\mf \Delta T$ in a turbulent plume may be generally approximated by:

$$
\mf \Delta T(z, r) = T_m(z) \cdot\exp\left(-\beta\left(\frac{r}{b(z)}\right)^2\right)
$$ (eq-deltaT-plume)

where
* $\mf z,r$: height above plume source and distance from centerline
* $\mf b(z)$: plume radius
* $\mf \beta$: empirical constant ≈ 1
* $\mf T_m(z)$: centerline temperature (at z)

**Example – Mass Flow**

With analytical desriptions of plumes and other phenomena, it becomes possible to investigate the impact and fire protection measures in compartment fires. An example for this is the estimation of the plume mass flow $\mf \dm_{pl}$ from a fire with a given heat release $\mf \dQ$. This way it becomes possible, e.g., to pose requirements of a smoke extraction system.

```{margin} Derivates
In this script the following short forms for derivatives are used:

* time derivative:

$$\mf \dot{\phi} = \frac{d\phi}{dt}$$

* spatial derivatives:

$$\mf \phi' = \frac{d\phi}{dl}$$

$$\mf \phi'' = \frac{d\phi}{dA}$$

$$\mf \phi''' = \frac{d\phi}{dV}$$
```

:::{figure-md} fig-exp-analytical-mass-flow

<img src="./figs/compartment_flow_central_labeled.svg" width="80%">

Illustration of the quantities involved in the analytical estimation of the plume mass flow $\mf \dm_{pl}$.
:::

Following, e.g. {cite}`VDI-6019-2`, the plume mass flow $\mf \dm_{pl}$ can be directly computed, whereas two regimes need to be considered separately. These are distinguished by the ratio of the distance of the fire to the smoke layer $\mf z_{eff}$ and the square root of the fire area $\mf A_{fire}$, i.e. $\sf \sqrt{A_{fire}}$. 

**Jet formation regime**

In the case of 

$$ 
\mf \frac{z_{eff}}{\sqrt{A_{fire}}} \le 2 \quad ,
$$ (eq-zA-ratio)

the mass flow can be computed as

$$
\mf \dm_{pl} = C_1 \cdot z^{1.5}_{eff}\cdot \sqrt{4\pi A_{fire}}\quad .
$$ (eq-dmpl-jet)

The free parameter, here the induction coefficient $\mf C_1$, takes a value of $\mf 0.19~kg\,m^{-5/2}\,s^{–1}$.

The solution in equation {eq}`eq-dmpl-jet` only depends on gemetrical values, the heat release rate has no impact here. The solution is simple, yet there are a assumptions, which have to be satisfied. A few of them are:    

* the considered compartment is a single storey smoke reservoir
* the minimum compartment height is $\mf 4.0~m$
* the room temperature is lower than smoke gas temperature
* it is only valid for fires with a power of $\mf 8~kW$ to $\mf 30~kW$
* the fire source diameter $\mf d_{fire}$ is between $\mf 0.4~m$ and $\mf 9~m$

**Similarity regime**

**TODO**

## Single Compartment Fire

For the illustration of the following models, a canonical compartment fire setup is used, see {numref}`fig-compartment-flow-basic`. It consists of a single compartment with a localised fire. The only opening to the ambient is a door.

:::{figure-md} fig-compartment-flow-basic

<img src="./figs/compartment_door_flow_labeled.svg" width="60%">

Flows and regimes in a canonical compartment fire with a single opening, here a door.
:::

In a very simplified representation, the following phenomena can be observed:

* A smoke layer builds up below the ceiling of the compartment, which creates a stratification. The hot combustion products and the entreined air are transported from the fire to the smoke layer due to buoyancy -- this is the plume.
* The hot smoke layer grows downwards until it reaches the top of the door opening and hot gas can leave the compartment and forms a spill plume.
* At the door opening, hot gas leaves the compartment in the top region of the opening, while fresh cold air enters the compartment in the lower region.

## Zone Models

The above figure {numref}`fig-compartment-flow-basic` indicates that the domain of interest can be separated into two zone: an upper and a lower layer, see {numref}`fig-two-zone-model`. Zone models use this separation to simplify the overall scenario and predict the physical, e.g. temperature, and geometrical, e.g. height, properties of the zones. The interaction of those zones, i.e. transport of mass and enthalpy, is described by the plume.

:::{figure-md} fig-two-zone-model

<img src="./figs/compartment_zone_model.svg" width="60%">

Illustration of a simple two zone – the upper hot and the lower cold gas layer – model.
:::

* outline computed quatities
* one for each layer, u and l

* example CFAST, see documentation

* funamental equations

```{margin} Note:
The according fundamental thermodynamical relations will be introduced in following section of the lecture. 
```

$$
\mf \frac{d}{dt}\left( c_v m_i T_i\right) = \dq - P\frac{dV_i}{dt}
$$ (eq-zone-model-internal-energy)

$$
\mf PV_i = m_i R T_i
$$ (eq-zone-model-ideal-gas-law)

$$
\mf \begin{align}
\frac{dP}{dt} &= \dots \\
\frac{dV_u}{dt} &= \dots \\
\frac{dT_u}{dt} &= \dots \\
\frac{dT_l}{dt} &= \dots
\end{align}
$$ (eq-zone-mode-governing-eqs)

## Field Models

:::{figure-md} fig-field-model

<img src="./figs/compartment_field_model.svg" width="60%">

Illustration of the domain discretisation in a field model.
:::


:::{figure-md} fig-field-model-temperatures

<img src="./figs/compartment_field_model_temperatures.svg" width="60%">

Illustration of the temperature values in each element (cell) of the domain discretisation.
:::