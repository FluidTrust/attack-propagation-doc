============
Installation
============

We provide multiple installation methods of our attack propagation. Depending on the use case different variants are preferably. For user who only want to try or only use the attack propagation, we would recommend the :ref:`bench` and use the current release. It is the easiest way to get started. For more advanced users or potential developers, we would recommend a mixture of the :ref:`manual-installation` and the :ref:`update-site-installation` variant (also see sec. :ref:`dev-install`).


.. _dependencies:

Dependencies
************

Our attack propagation analysis is realized as Eclipse Plugins. The analysis source code is compiled with *Java 17* as Target. Therefore, we recommend using a *Java 17* environment for execution. Newer versions might work, but we have not tested them. Older versions especially *Java 11* or *Java 8* are not supported.  

.. note::
    If you only want to use the metamodel, you also can use Java 11. However you have to use the Java11 branch and manually install it.

If not our `Palladio-Bench (Attack Drop)`_ is used, our tooling requires an `Eclipse Modelling Edition <https://www.eclipse.org/downloads/packages/release/2021-12/r/eclipse-modeling-tools>`__ (min. 2021-12) with the following dependencies:

* `PCM 5.1+ <https://sdqweb.ipd.kit.edu/wiki/PCM_Installation>`__
* `tools.mdsd.library.emfeditutils <https://github.com/MDSD-Tools/Library-EMFEditUtils>`__
* `tools.mdsd.library.standalone.initialization <https://github.com/MDSD-Tools/Library-StandaloneInitialization>`__
* com.google.gson
* com.google.guava
* org.apache.commons.codec
* org.apache.commons.lang3
* org.slf4j.api
* com.sun.xml.bind version="2.3.3"
* jakarta.xml.bind version="2.3.3"
* jakarta.activation version="1.2.2" 
* org.apache.logging.log4j version="2.8.2"
    
The eclipse dependencies without a link are available from `Eclipse Orbit <https://download.eclipse.org/tools/orbit/downloads/drops/R20210602031627/>`__

.. note::
    We provide an Eclipse installation file. The file assumes that the Eclipse Modelling Tools are already installed. After downloading the file you can install it in Eclipse via File->Import->Install->Install Software Items from File and then selecting the installation file. :download:`Install-File </_static/dependencies.p2f>`.

.. note::
    For the release update site replace *nightly* in the urls with *release/latest*.

.. _bench:

Palladio-Bench (Attack Drop)
****************************


We created an Eclipse product, which can be used to start our analysis and view the models. It should be configured that it automatically opens a workspace with the necessary projects loaded.

*  `Download <https://updatesite.palladio-simulator.com/fluidtrust/palladio-bench-product-attackerpropagation/release/latest>`__ and unpack the version for your operating system
* Start the application by executing the *PalladioBench* binary (not the eclipse one!)
* After the load screen you should see 3 Projects in the Modelviewer on the left side:
    * edu.kit.ipd.sdq.kamp4attack.tests
    * org.palladiosimulator.pcm.confidentiality.context.analysis.testframework
    * org.palladiosimulator.pcm.confidentiality.context.analysis.testmodels

.. note::
    The nightly version can be found `here <https://updatesite.palladio-simulator.com/fluidtrust/palladio-bench-product-attackerpropagation/nightly>`_.

.. note::
    The MAC-Version might not work, because of MACOS security features. In that case `this <https://sdqweb.ipd.kit.edu/wiki/PCM_Installation#Mac_OS_X>`__ might help. If not, you can still use the update site or manually install the tooling, but you are required to solve the dependencies manually.

.. _manual-installation:

Manual Installation
*******************
Please make sure that you have installed the `Dependencies`_. Clone the `metamodel <https://github.com/FluidTrust/Palladio-Addons-ContextConfidentiality-Metamodel>`__ and `analysis <https://github.com/FluidTrust/Palladio-Addons-ContextConfidentiality-Analysis>`__ repositories. The repositories do not contain the source code for the stored metamodels. The easiest solution to create the source code is to build each repository with maven for instance with ``mvn clean verify``. If there is no maven available see :ref:`code-generation`.

After downloading the source code. The necessary plugins for applying the projects are in each repository in the *bundle* folder. All folder in this folder contain plugin projects and must be imported into the eclipse workspace. After importing the projects, a inner eclipse application can be started, where the attack propagation is installed. 


.. _code-generation:

Code Generation (without Maven)
===============================
TBD

.. _update-site-installation:

Update Site Installation
************************

We provide also two Eclipse update site for our attack propagation. The eclipse installation needs to have the :ref:`dependencies` installed. After installing the dependencies, our attack propagation analysis can be installed. First add and install our `metamodel <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-metamodel/nightly/>`__. Afterwards, our `analysis <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/nightly/>`__ can be installed. 

.. note::
    We also provide a complete Eclipse installation file. Using this installation file, it is not necessary to install the dependencies before, since they are bundled within. The file assumes that the Eclipse Modelling Tools are already installed. After downloading the file you can install it in Eclipse via File->Import->Install->Install Software Items from File and then selecting the installation file. :download:`Install-File </_static/full-installation.p2f>`.


.. _dev-install:

Recommended Developer Installation
**********************************

For developers, we recommend a mixture between the :ref:`update-site-installation` and :ref:`manual-installation`. Install first the tooling via the update sites (preferably with the installation file) afterwards only import the necessary plugins, for the development step. Eclipse should then automatically choose the correct dependencies for the inner instance. Usually the projects in the workspace are prefered over installed file. However, this can be configured in the launch config. 

.. note::
    The Palladio models use the CDO-Framework. For easier debugging it is useful to install the `CDODebugUtil <https://github.com/MDSD-Tools/EclipseAddon-CDODebugUtils>`__. It will automatically reorder the layout in the debug view to see the relevant properties. 
