# Fundamentals

Thermodynamics describes the macroskopic changes of a system of microscopic objects, i.e. particles. It is a statistical description for the e.g. sets of atoms or molecules in solids, liquids and gases. As an individual (quantuum-) mechanical description for large particle counts – see [Avogado number](xxx) – is not possible or even needed, thermodynamics reduces the description to a few (measurable) quantities in a defined system.



## Systems

In a thermodynamical analysis it is essential to define the investigated system and its interaction with the ambient environment. A system is a volume containing a (fixed) number of particles.

The interaction of systems can be described with the following three process quantities:

* **work**, $\mf W$, e.g. mechanical or electrical work, like the compression of a volume due to a moving pistion, 
* **heat**, $\mf Q$, e.g. energy transfer due to a temperature difference, and
* **mass flow**, e.g. addition of mass into a system.

There are four definitions of system boundaries / interactions of systems (including the ambient environment):

* **isoalted**: no mass flow, no heat flow ($\mf \Delta Q=0$) and no work done ($\mf \Delta W=0$),
* **closed**: no mass flow, possibility for heat flow ($\mf \Delta Q\neq 0$) and / or work to be done ($\mf \Delta W\neq 0$)
* **adiabatic**: no mass and no heat flow ($\mf \Delta Q=0$), yet work can to be done ($\mf \Delta W\neq 0$), and
* **open**: possibility for mass and heat flow, as well as for work to be done.

## State Quantities

The state of a thermodynamical system can be expressed with these measurable quantities like

* **pressure**, $\mf p$,
* **volume**, $\mf V$, and
* **temperature**, $\mf T$,

and the deduced quantites like

* **inner energy**, $\mf U$,
* **enthalpy**, $\mf H$, and
* **entropy**, $\mf S$.

These quantities describe a system directly with their values. I.e. if a system changes from one state to another, then the way it changes does not matter, just the state quantities values at the new state define it.

In contrast to that, the process quantites (heat and work) do depend on the way the system changes.

Some of the quantities depend on the system size, e.g. the system's mass, and are called extensive quantities. Examples are the inner energy or enthalpy.

Intensive quantities, like pressure or temperature, do not depend on the system's size.

In order to transform extensive quantities to intensive quantites, (mass) specific values can be used. This way, any extensive quantity $\mf A$ of a system with the mass $\mf M$ is expressed as $\mf a$ being an intensive quantity:

$$
\sf a = \frac{A}{M}\quad .
$$

## Temperature

[Thermodynamical temperature](https://en.wikipedia.org/wiki/Thermodynamic_temperature) is an expression to characterise the random (thermal) motion of the particles. In general all interacting thermodynamical systems try to equal their temperatures by an energy flow, i.e. heat. This means, that if two systems with different temperatures are brought togehter, the induced heat flow will reduce the temperature of the warmer system and increase the temperature of the colder system. The heat flux is always from the higher to the lower temperature.

In a thermodynamical quilibrium, there are no heat or mass flows between interacting systems, i.e. the state quatities do not change in time. This leads to a thermal equilibrium, where the systems have the same temperature. A singel system is in thermal equilibrium if the temperature is homogenous and does not change with time. 

See also the [zero-th thermodynamical law](https://en.wikipedia.org/wiki/Zeroth_law_of_thermodynamics).

The SI-unit of temperature is Kelvin, where $\mf 0~K$ is the absole lowest temperature and $\mf 0~^\circ C$ corresponds to $\mf 273.15~K$. Temperature differences have the same values in Kelvin as in Celsius. 

At finite temperatre, the particles in a gas have not a single velocity, but a distributed over a broad range. This is an important aspect, as many chemical reactions require the involved particles to overcome the activation energy. Thus, there is always a probability that a particle has the needed kinetic energy. This velocitiy distribution, the Maxwell distribution, depends only on the temperature and the gas properties:

FIGURE Maxwell

## Ideal Gases

Ideal gases represent the assumption that the particles have a very small volume, i.e. can be treated as point particles, and the gas volume contains a large number of same particles. Additionally, there are no forces interacting between the particles – but the idealised (elastic, instant) collisions with each other and the system boudaries.

Equations of state relate various state quantities, as they are in general not independent. In the case of an ideal gas, the following equation of state – called (classical) ideal gas law – can be used:

$$
\mf pV = n R T
$$

where $\mf n$ respresents the number of moles in the system and $\mf R \approx 8.314~J/(mol~K)$ is the universal gas constant. A mole is defined by the [Agogado constant](https://en.wikipedia.org/wiki/Avogadro_constant), as $\sf N_A \approx 6.02\cdot 10^{23}$ being the number of particles in a mole.


## Heat Capacity

To (infinitesimally) increase the temperature of a system by $\mf dT$, the following amount of heat $\mf \Delta Q$ is needed

$$
\mf \Delta Q = C\cdot dT
$$

where $\mf C$ is the heat capacity. The correspondig (mass) specific quantity is $\mf c$. In general this material dependent quantity is temperature-dependent, $\mf C=C(T)$, thus the heat needed to change a system's from temperature $\mf T_1$ to $\mf T_2$ is

$$
\mf Q_{12} = \int_{T_1}^{T_2} C(T)\ dT
$$

The specific values depend on the process itself, thus the two following specification need to be considerd:

* **isochoric**, i.e. the volume stays constant during the process $\mf \Delta V=0$, $\mf c_V$, the heat flux does change only the internal energy, and
* **isobaric**, i.e. the pressure stays constant $\mf \Delta p=0$, $\mf c_p$, where the heat flux can change the internal energy and can do work.

Both values are related:

$$ 
\mf c_p - c_v = \frac{R}{M}
$$

where $\mf M$ is the molar mass and 

$$ 
\mf \frac{c_p}{c_v} = \gamma
$$

where $\mf \gamma$ is called the heat capacity ratio. 

## Latent Heat

## Real Gases
