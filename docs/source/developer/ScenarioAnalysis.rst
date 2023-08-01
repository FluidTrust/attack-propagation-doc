Developer Information for the Scenario Analysis
===============================================

Introduction EMF
++++++++++++++++

For new developers, we recommend to work through EMF tutorials. One good candidate are the tutorials from `Vogella <https://www.vogella.com/tutorials/EclipseEMF/article.html>`_

Scenario Analysis Workflow
+++++++++++++++++++++++++++

The workflow of the analysis is defined in the bundle *org.palladiosimulator.pcm.confidentiality.context.analysis.execution* and the class `ScenarioAnalysisWorkflow <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/ScenarioAnalysisWorkflow.html>`_. It consists first of loading the different models. Then the analysis is performed. The last step is to save the results. 

The analysis execution job (`ScenarioAnalysisJob <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/job/ScenarioAnalysisJob.html>`_), also initializes the PDP and transforms the context files to an XACML file (see  :doc:`XACML <XACMLTransformation>`). It is important, that both the generation of the XACML file and the initialisation of the PDP is done before the actual propagation is triggered. Otherwise, an exception might occur.


Scenario Analysis
+++++++++++++++++

The main bundle for the scenario analysis is *org.palladiosimulator.pcm.confidentiality.context.scenarioanalysis.provider*. Here, the entry point for the analysis is `ScenarioAnalysisSystemImpl <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/scenarioanalysis/provider/ScenarioAnalysisSystemImpl.html>`_. The starting point is the *runScenarioAnalysis* methods. It iterates over each usage scenario and the contained *EntryLevelSystemCalls*. For each scenario it checks whether it is a misusage scenario or not. Then it follows the call from an *EntryLevelSystemCall* over the *ExternalCalls*. Each call is checked against the PDP. The results of a query is stored in `ResultEMFModelStorage <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/scenarioanalysis/output/creation/ResultEMFModelStorage.html>`_ The propagation between the services is implemented in `SystemWalker <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/scenarioanalysis/visitors/SystemWalker.html>`_. The behavior is mainly straight forward. It identifies the next service name and then finds it by using the Assembly with the AssemblyConnectors. In case, for that for an AssemblyConnector a AttrbuteProvider exists, the analysis replaces the attribute context.