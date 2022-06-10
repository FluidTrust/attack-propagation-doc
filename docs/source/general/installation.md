# Installation

We provide multiple installation methods of our attack propagation. Depending on the use case different variants are preferably. For user who only want to try or only use the attack propagation, we would recommend the [Bench](bench). It is the easiest way to get started. For more advanced users or potential developers, we would recommend a mixture of the [manual Installation](manual_installation) and the [update site](updatesite_installation) variant (also see sec. [developer installation](developer_installation)).


(bench)=
## Palladio-Bench (Attack Drop)
We created an Eclipse product, which can be used to start our analysis and view the models. It should be configured that it automatically opens a workspace with the necessary projects loaded.
*  [Download](https://updatesite.palladio-simulator.com/fluidtrust/palladio-bench-product-attackerpropagation/nightly/) and unzip the version for your operating system
    * **Attention:** The MAC-Version might not work, because of MACOS security features. In that case [this](https://sdqweb.ipd.kit.edu/wiki/PCM_Installation#Mac_OS_X) might help. If not, you can still use the update site or manually install the tooling, but you are required to solve the dependencies manually.
* Start the application by executing the *PalladioBench* binary (not the eclipse one!)
* After the load screen you should see 3 Projects in the Modelviewer on the left side:
    * edu.kit.ipd.sdq.kamp4attack.tests
    * org.palladiosimulator.pcm.confidentiality.context.analysis.testframework
    * org.palladiosimulator.pcm.confidentiality.context.analysis.testmodels

(manual_installation)=
## Manual Installation
Please make sure, that you have the [dependencies](dependencies) installed.

For the manual installation you need the 



(updatesite_installation)=
## Installation with the Update Site

    * Context and Attackermetamodel ([Updatesite](https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-metamodel/nightly/), [Repo](https://github.com/FluidTrust/Palladio-Addons-ContextConfidentiality-Metamodel))

(developer_installation)=
## Developer Installation

(dependencies)=
## Dependencies

For the execution of our attack propagation analysis the following dependencies are necessary:

* Java 17
* Eclipse Modelling Edition (min. 2021-12) with
    * PCM 5.1+
    * com.google.gson
    * com.google.guava
    * org.apache.commons.codec
    * org.apache.commons.lang3
    * org.slf4j.api
    * com.sun.xml.bind version="2.3.3"
    * jakarta.xml.bind version="2.3.3"
    * jakarta.activation version="1.2.2" 
    * org.apache.logging.log4j version="2.8.2"
    * 
    
    
    
    
    
    (the ones without a link are available from [Eclipse Orbit](https://download.eclipse.org/tools/orbit/downloads/drops/R20210602031627/))