# Physical and Chemical Processes

## What is a Fire?

In general: A fire is an exothermic chemical reaction.

**Technical Combustion -- Wanted Fires**

:::{figure-md} fig-wanted-fire

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Gas_flame.jpg/858px-Gas_flame.jpg" width="40%">

In a gas stove, a combustible gas is used to generate heat. The geometry and flow properties of the stove allow a controllable flame. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Gas_flame.jpg).
:::

*Wanted fires*, i.e. technical combustion processes, are **controlled** processes used for e.g. heating or propulsion. Although the term *wanted fire* is somehow misleading, as the fires are typically not wanted and associated with accidents, a bonfire is one of the fundamental wanted applications of fires.

:::{figure-md} fig-bonfire

<img src="figs/bonfire.png" width="40%">

Bonfires are wanted fires, e.g. for preparing a meal.
:::


**Unwanted Fires**

:::{figure-md} fig-unwanted-fire

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fire_inside_an_abandoned_convent_in_Massueville%2C_Quebec%2C_Canada.jpg/640px-Fire_inside_an_abandoned_convent_in_Massueville%2C_Quebec%2C_Canada.jpg" width="40%">

Building fire. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Fire_inside_an_abandoned_convent_in_Massueville,_Quebec,_Canada.jpg).
:::

Unwanted fires, are **not controlled and not wanted** processes. These are mostly incidents inside of enclosures and pose danger to wildlife, humans, and property.

**Fire Examples**

* Bonfire
    * [Lakeside Bonfire](https://youtu.be/NUKKzdVy0EI)
    * [Slowmotion Bonfire](https://uni-wuppertal.sciebo.de/s/e0c3Ut8OolZGTC8)
* Wildland fires
    * [Walking With Fire: A Wildfire Documentary](https://youtu.be/6y0__CZI-Cw)
    * [Indonesia Peat Fires](https://youtu.be/2qYzTU0q9XE)
* Compartment fires
    * [Compartment Fire Flashover](https://youtu.be/w4W82HIzUcc)
    * [Storage Fire](https://youtu.be/xzuNVFn0U48)

## Processes Overview

:::{figure-md} fig-fire-processes

<img src="figs/fire_processes.svg" width="60%">

Visualisation of the main processes involved in fires.
:::

Fires involve a complex interaction of a multitude of physical and chemical processes. While most of them take place in the gas phase, e.g. combustion, fires commonly include also processes in the solid or liquid phase, e.g. pyrolysis which generates the fuel for the combustion. The following processes cover the main phenomena.

1. **Fluid dynamics**
    * fundamental mass and momentum transport process in the gas phase
    * fire related flows are mostly turbulent
1. **Heat transfer**
    * warm gas, e.g. combustion products, are transported upwards by heat convection
    * hot matter emits net thermal radiation
    * heat conduction inside the solid
1. **Combustion**
    * fast oxidation of fuel in the flame
    * release of chemical energy, e.g. locally heating gas or thermal radiation
1. **Pyrolysis**
    * degradation of the solid structure
    * emission of volatiles gases, e.g. fuel for the combustion
    
## Turbulent Flows

Fires induce heat into the gas phase and buoyancy drives a plume. Compartment flows are complex and involve many openings to ambient regions as well as obstructions, see {numref}`fig-compartment-flow`. Mechanical ventilation or HVAC as well as wind might be included into the evaluation of the dynamics.

:::{figure-md} fig-compartment-flow

<img src="figs/compartment_flow_labeled.svg" width="80%">

Illustration of a potential flow inside a building, driven by the fire. There is an inflow and an outflow, which connect the confined flow to the ambient domain. 
:::

Most fire flows, especially in the flame and plume region, are turbulent. The turbulent mixture process during combustion is crucial and the entrainment of fresh cold air into a plume significantly determines its dynamics. Experimental analysis as well as numerical models must consider the macroscopic effects of turbulence.

:::{figure-md} fig-turbulence-transition-candle

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Laminar-turbulent_transition.jpg/466px-Laminar-turbulent_transition.jpg" width="40%">

Transition from a laminar to a turbulent flow in the plume of a burning candle. The image is captured using [schlieren photography](https://en.wikipedia.org/wiki/Schlieren_photography), which visualises differences in the refraction index. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Laminar-turbulent_transition.jpg).
:::



## Reactive Flows

Fires are driven by the energy released by combustion, which is an exothermal chemical process. Two gases, in the simplest case oxygen and fuel, react and release energy. In real fires, there is a zoo of species and reactions involved in a fire. Depending on the concentrations of individual species and their local temperatures, new chemical species can be formed. Thus, the overall spectrum of products, due to the chemical processes during a fire, is rarely simple.  

In contrast to technical combustion, the oxygen and the fuel are typically not mixed. The transition from a non-premixed to a premixed combustion can be well observed with a Bunsen burner, see {numref}`fig-bunsen-burner`.  

:::{figure-md} fig-bunsen-burner

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Bunsen_burner_flame_types.jpg/854px-Bunsen_burner_flame_types.jpg" width="40%">

Variable oxygen concentrations in the outflow stream of a Bunsen burner. From left to right: air valve closed, nearly fully closed, valve semi-opened and maximally opened. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Bunsen_burner_flame_types.jpg).
:::

The time scales at which the chemical reactions take place span multiple orders of magnitude, see {numref}`fig-chem-time-scales`. Typical combustion processes are much faster than common mass transport processes in fires.

:::{figure-md} fig-chem-time-scales

<img src="figs/chemical_timescales.svg" width="80%">

(Very) Approximate time scales of chemical and physical processes in reactive flows. 
:::

## Heat Transfer

Heat can be transferred between locations and materials in different ways. The flow of heat is driven by differences in temperature. There are three modes to transfer heat, where only conduction and radiation are fundamental and do not require a fluid in a gravity field.

The heat transfer modes are:
* **Convection:** transport of matter with different temperatures due to induced buoyant flows 
* **Conduction:** diffusion of heat in a material
* **Radiation:** emission and absorption of electro-magnetic waves

:::{figure-md} fig-heat-transfer-overview

<img src="https://upload.wikimedia.org/wikipedia/commons/f/f4/Heat-transmittance-means2.jpg" width="40%">

Schematic illustration of the various heat transfer modes. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Heat-transmittance-means2.jpg).
:::

All three modes are important for fires. The released chemical energy from combustion locally heats up the gas, which changes its density and is thus affected by buoyancy. Beside the local heating, the hot gas emits thermal radiation in all directions. Thus, in case of a compartment fire, it transfers heat towards the walls or other structures, and e.g. towards the solid, which provides the fuel source for the fire. Thus, the solid's surface heats up and heat conduction spreads the absorbed energy through the solid.


## Pyrolysis

Pyrolysis describes the emission of (potentially combustible) gases out of solid material. In general, this is dependent on the solid’s temperature as the decomposition reactions require energy. For liquids, additional evaporation can take place.

In case of burning wood, like a match in {numref}`fig-burning-match`, the solid material itself is not part of the combustion, but delivers only the fuel for the fire. Not all material is gasified and a char residue is left.

:::{figure-md} fig-burning-match

<img src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Streichholz.JPG" width="40%">

Burning match, where the fuel for the combustion is emitted by the wood through pyrolysis. Source: [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Streichholz.JPG).
:::

