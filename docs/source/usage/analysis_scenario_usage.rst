Analyzing Scenario-based Access Control Policies
================================================



Analysis Execution
++++++++++++++++++


The analysis can be started via an Eclipse launch configuration. The launch configuration name is *Attackeranalysis*. It can be created in Eclipse by clicking Run->Run Configurations. This opens a dialog similar to the example image below. There select *Attackeranalysis* (left side). This creates a new launch config for the attacker analysis. For the scenario-based access usage analysis select as analysis type *Scenario*. Afterwards select the software architecture models you want to analyse. For the scenario analysis, we need the *Repository Model*, *Context Model*, *Usage Model*. The model can be selected either as reference from the workspace (recommended) or from the file system. By pressing on the launch button the analysis is executed.

.. image:: /_static/images/scenarioOutputMetamodel.png
   :width: 600
   :alt: Launch Config Example Image
    Example Launch Configuration

.. note::
    The selected models need to be compatible to each other. For instance, the *Repository Model* needs to contain the components stored in the *Usage Model*. The analysis does not perform checks, whether the models are complete and all the references are valid. Such cases might create randoms errors.

During the execution of the analysis the console prints out the different execution steps. More detaile about the workflow can be found in  the :doc:`developer documentation <ScenarioAnalysis>` 


.. image:: /_static/images/scenarioOutput.png
   :width: 600
   :alt: Console Output
    Example Console Output

Analysis Results
++++++++++++++++

The analysis results are stored in the output model (file ending *\*.outputmodel*). 

.. image:: /_static/images/scenarioOutputMetamodel.png
   :width: 600
   :alt: Scenario Output Metamodel
    Scenario Output Metamodel