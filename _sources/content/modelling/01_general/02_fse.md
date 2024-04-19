# Fire Safety Engineering

Modelling of fires is one aspect in the broad spectrum of fire safety engineering (FSE). While the engineering topics aim for the practical application, fire models are used for research questions in fire safety science (FSS).

The following sections give only a very brief introduction to the broad topics adressed here. Starting points for further reading in this field are give in {cite}`vfdb-leitfaden:2020`, {cite}`VDI-6019-1`, {cite}`VDI-6019-2` or ,e.g., chapters 37, 38, and 39 of {cite}`sfpe-handbook-5th`.

## Fire Safety Legislation

The [German constitutional law (Grundgesetz)](https://en.wikipedia.org/wiki/Basic_Law_for_the_Federal_Republic_of_Germany) states that

* every person shall have the right to life and the right for physical integrity, and
* property entails obligations.

Based on this fundamental law, four protection goals, with respect to fire safety, are formulated in the  [Pattern Building Code (Musterbauordnung)](https://www.bauministerkonferenz.de/Dokumente/42323097.pdf). This code is specified for each federal state in Germany as the state-individual Building Code (Bauordnung). 

The protection goals are:
1. prevent the outbreak of a fire
1. prevent the propagation of heat and smoke
1. enable escape and rescue measures
1. enable effective firefighting measures

They are meant to be applied to the whole lifecycle of a building, i.e. during construction, service, modification and maintenance.

## Prescriptive Designs

In a prescriptive design, fire safety measures are carried out based on general rules. This leads to benefits like 

* regulations and standards enable *deemed-to-satisfy* solutions
* mostly practicable and economic
* fire safety design can be conducted by *semi-qualified* persons
* legal certainity

However, this design approach has also some flaws, like

* descriptive designs are prone for individuality and complexity
* the application of *deemed-to-satisfy* strategies can be inappropriate, uneconomic or even impossible
* under certain circumstances non-conformities to applicable regulations and standards are unavoidable
* restrictions for international harmonisation and standardisation

An alternative to prescriptive designs is the application of performance based designs.

## Performance Based Designs

**General Approach**

In contrast to the static and general rules of a regulation, the performance based design follows the idea to create an equivalent level of safety by satisfying protection goals. This process allows the engineers to use multiple approaches, which do also include fire simulations, to iteratively design a safety concept. A schematic flow diagram is shown in {numref}`fig-performance-based-design`.

:::{figure-md} fig-performance-based-design

<img src="figs/performance_based_design.svg" width="80%">

Simplified flow diagram of a prescriptive and performance based design.  
:::

**Qualitative Analysis**

The protection goals have to be defined to fulfill in a wide range of conceivable scenarios. These definitions must consider:
* various structures
* different and variable uses
* occupants physics and behaviour

The scope of a qualitative analysis covers the following aspects:
* building concept
  * fundamental construction
  * building materials
  * fire and smoke compartmentalisation
  * topology and separation of the escape routes
* concept of use 
  * fire loads
  * occupants
  * usage scenarios
* infrastructure 
  * technical systems
  * defensive fire protection measures
* fire scenarios
  * fire locations
  * possibilities for flame and smoke propagation
  
  
**Quantitative Analysis**

For a quantitatve analysis, models or empirical data is used for the evaluation of:
* fire scenarios and design fires
* fire effects, smoke propagation and smoke extraction/management
* building components and bearing structure
* assessment of technical and defensive measures
* life safety during fire exposure
* egress in case of emergency

## Fire Scenario

In order to evaluate an individual fire incident, an explicit fire scenario must be defined. In general, it needs to consider:

* the location of the seat of fire
* the fire load 
* the fire development
* the ventilation conditions
* the impact of technical measures
* the influence of fire fighting measures

In a fire scenario, the fire development – especially the rate at which it releases heat – must be specified. Remember: The HRR is "[The single most important variable in fire hazard](https://doi.org/10.1016/0379-7112(92)90019-9)", since it drives the smoke propagation and also heat transfer to the building structure. A common approach is to define a time-dependent heat release rate, $\mf HRR(t)$, which is based on a so called natural fire. A natural fire curve is an empirical approximation to real compartment fires, see {numref}`fig-natural-design-fire`, which can be represented in three phases:

1. Growth 
2. Fully developed
3. Decay


:::{figure-md} fig-natural-design-fire

<img src="figs/natural_design_fire.svg" width="60%">

Heat release rate curve based on the natural fire approximation.
:::


1. **Growth**: Typically, a fire needs some initial time take hold. This time can be called the virtual ignition time $t_0$. The following growth period is often approximated by a [parabolic raise of the heat release rate](https://doi.org/10.1016/0379-7112(84)90005-5), scaled by the fire-growth coefficient $\alpha * t^2$, leading to:

    $$\mf HRR(t) = \alpha\cdot (t - t_0)^2\quad,$$

    The relationship of the "t-squared" design fire can be observed from experiments. {numref}`fig-FurnitureCalorimeter` shows the HRR curves of three pieces of furniture, taken from [Babrauskas and Lawson](https://www.nist.gov/publications/upholstered-furniture-heat-release-rates-measured-furniture-calorimeter). The data series are shifted in time, such that the intervals of the sudden increase in HRR align. A t-squared design fire was fitted to the data series, with a fire-growth coefficient of 0.19 kW/s$^{-2}$ and a virtual ignition time of 90s.

:::{figure-md} fig-FurnitureCalorimeter

<img src="figs/FurnitureCalorimeter.svg" width="60%">

Heat release rate of different pieces of furniture, taken from [Babrauskas and Lawson](https://www.nist.gov/publications/upholstered-furniture-heat-release-rates-measured-furniture-calorimeter). A t-squared approximation is applied with a virtual ignition time of 90s. 
:::

    
    
2. **Fully developed**: After the flashover, all material that is capable to burn is participating in the fire. Depending on the ventilation conditions and fire load distribution, the profile of the recorded HRR can vary. For comparatively small individual items, the HRR may reach a peak value and drop again shortly after, see "Single Chair (F21)" in {numref}`fig-FurnitureCalorimeter`. Larger items, which may not be engulfed in flames immediately, can show a constant (averaged) HRR before the decay starts, see "Sofa (F32)" and "Love Seat (F31)" in {numref}`fig-FurnitureCalorimeter`. Overall, [individual items](https://www.nist.gov/el/fcd/fire-barriers-full-scale-chair-mock-ups) or smaller [configurations of items (CornerTest1/2)](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments) tend to raise to a peak HRR and start to decay shortly after, when burning without confinement. These cases would be considered "fuel controlled". Situations with confinement, where the oxygen supply is limited, lead to constant heat release over prolonged periods of time. Consider cases where different fire loads are burning in the same room geometry and with different ventilation openings, see [CLT_Room_Test_1-2](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments/cltroomtest1-2) and [CLT_Room_Test_1-6](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments/cltroomtest1-6) in {numref}`fig-CrossLaminatedTimberCompartments`. They reach a peak HRR, limited by the available oxygen, which stays on average constant. Another example is the [Steel Closet](https://www.nist.gov/el/fcd/structure-separation-experiments-shed-burns-without-wind/1b-svsh0-5r1) experiment. These cases would be considerd "ventilation controlled".

    This part of the design fire is thus often modelled as a constant HRR at about its maximum value ($\mf HRR_{max}$), i.e.:
  
    $$\mf HRR(t) = HRR_{max}\quad.$$


:::{figure-md} fig-CrossLaminatedTimberCompartments

<img src="figs/CrossLaminatedTimberCompartments.svg" width="60%">

Heat release rates of different fuel loads and ventilation openings in a room of the same geometry, taken from the [NIST Fire Calorimetry Database (FCD)](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments).
:::


    
3. **Decay**: The fire decay can be a somewhat drawn out process and depends on the fuel source. Once volatile components of the combustible material are mostly consumed and the objects collapsed, the flames shrink and most of the the combustion takes place at the solid (char oxidation). For example see the endings of [corner test 2](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments/cornertest2), a [wooden shed](https://www.nist.gov/el/fcd/structure-separation-experiments-shed-burns-without-wind/1b-wcl0) or the [room flashover experiments](https://www.nist.gov/el/fcd/room-flashover-experiments-demonstrate-effectiveness-barrier-fabrics).The fire decay is typically not of large importance for a design fire due to fire fighting measures. In Germany, the fire brigade is expected to arrive on site within 8 min to 15 min after they receive a call, depending on the geography and population density (see "[Hilfsfrist](https://de.wikipedia.org/wiki/Hilfsfrist)"). Consider again {numref}`fig-CrossLaminatedTimberCompartments`, the fire brigade would likely have already started intervening. The actions of the fire brigade may have a notable impact, depending on fire size and employed measures, see for example the end of [CLT_Room_Test_1-6](https://www.nist.gov/el/fcd/cross-laminated-timber-compartments/cltroomtest1-6).

    Thus, one can make the assumption that when about 70% of the fire load is consumed, the decay phase starts. During that phase the heat release rate could be assumed to decay linearly and reaches a value of zero at time $\mf t_{end}$, i.e. 
  
    $$\mf \frac{HRR(t)}{dt} = const \quad.$$
    
    


The following tables present a selected set of values for the fire load and fire-growth coefficient, see {cite}`VDI-6019-1`. 


```{list-table} Fire intensity coefficients
:header-rows: 1
:name: tab-alpha
:widths: auto
:align: right

* - Fire development rate 
   - Fire intensity coefficient, <br>$\mf \alpha \ / \ kW/s^2$
* - slow
   - 0.0029
* - medium
   - 0.012
* - fast   
   - 0.047
* - very fast
   - 0.188
```


```{list-table} Specific maximal heat release rates
:header-rows: 1
:name: tab-hrr-max
:widths: auto
:align: right

* - Building or object 
   - Specific maximum heat release rate, <br> $\mf HRR_{max}'' \ / \ kW/m^2$
   - Fire development rate
* - offices
   - 300
   - medium
* - hotel rooms
   - 250
   - medium
* - sales areas
   - 500
   - fast
* - exhibitions, theatres, cinemas, stages
   - 500
   - fast
* - residence
   - 500
   - medium
* - museum
   - 300
   - slow
* - burning semi-trailer
   - 400
   - fast
* - wooden pallets <br> size: $\mf 1.2~m \times 1.2~m \times 0.14~m$,<br> humidity: 6% to 12%, <br> stacked / block storage, <br> height: $\mf 0.5~m$
   - 1250
   - medium up to fast
* - postbags, storage height $\mf 1.5~m$
   - 400
   - fast
```
