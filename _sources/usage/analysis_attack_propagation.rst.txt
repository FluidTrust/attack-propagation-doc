Analyzing Attack Propagations
=============================



Scientific Background
+++++++++++++++++++++

.. raw:: html

    <iframe width="560" height="315" src="https://www.youtube.com/embed/fIRoZ7Ck0vE?start=422" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



Analysis Execution
++++++++++++++++++


The analysis can be started via an Eclipse launch configuration. The launch configuration name is *Attackeranalysis*. It can be created in Eclipse by clicking Run->Run Configurations. This opens a dialog similar to the example image below. There the select *Attackeranalysis* can be selected (right side). There you can create a new launch config. Now please select as analysis type *Insider* and select the correct models. For the insider analysis, we need the *Repository Model*, *Allocation Model*, *Context Model*, *Attacker Model*, and *Modification Model*. The model can be selected either as reference from the workspace (recommended) or from the file system.

.. image:: /_static/images/insiderLaunch.png
   :width: 600
   :alt: Launch Config Example Image
    Example Launch Configuration


The analysis can be configured to create besides the EMF output model also an image of the attack graph. This can be done by changing to the *Analysis Configuration* tab. There you can check the box for graph creation. If the graph creation is enabled, the analysis will automatically generate a PNG image withing the model folders.

.. image:: /_static/images/analysisConfiguration.png
   :width: 600
   :alt: Launch Config Graph Creation
    Graph Creation


.. note::
	The graph creation uses internally ::ref::`Graphviz <https://graphviz.org/>`. Please make sure to add the Graphiz binary to the path variable of the Java environment.


Analysis Results
++++++++++++++++

There are two results files for the attack propagation possible. The first is the modification mark model and the attack graph image

Modification Mark Model
######################



Attack Graph Image
##################