Developer Information for the Targeted Attack Graph Analysis
============================================================

Introduction EMF
++++++++++++++++

For new developers, we recommend to work through EMF tutorials. One good candidate are the tutorials from `Vogella <https://www.vogella.com/tutorials/EclipseEMF/article.html>`_


Attack Propagation Workflow
+++++++++++++++++++++++++++

The workflow of the analysis is defined in the bundle *org.palladiosimulator.pcm.confidentiality.context.analysis.execution* and the class `AttackSurfaceAnalysisWorkflow <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/AttackSurfaceAnalysisWorkflow.html>`_. It consists first of loading the different models. Afterwards, the vulnerabilities from the Repository are rolled out on the AssemblyContext. Then the analysis is performed. The last step is to save the results. 

The analysis execution job (`AttackSurfaceAnalysisJob <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/job/AttackSurfaceAnalysisJob.html>`_), then executes the analysis. The analysis does not use a PDP or transform the XACML policies. The analysis has their own access decision part implemented.


Attack Propagation Analysis
+++++++++++++++++++++++++++

The main bundle for the attack propagation is *edu.kit.ipd.sdq.attacksurface*. Here, the entry point for the analysis is `AttackSurfaceAnalysis <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/attacksurface/core/AttackSurfaceAnalysis.html>`_. It contains in the *runChangePropagationAnalysis* the main steps for identifying the attack paths.


The first step is to initialize the vulnerability map. This is basically a map containing which contains the ID of an architectural elements as key and the corresponding vulnerabilities. We use the map as a cache for vulnerabilities to speed up the vulnerability search. Otherwise, the analysis always have to search lists to identify vulnerable elements.

In the next step, the analysis creates the attack graph. The attack graph is created in parallel and uses `Google Guava <https://github.com/google/guava>`_. The responsible class is `AttackGraphCreation <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/attacksurface/graph/AttackGraphCreation.html>`_.  This class already filters out all edges, which contain vulnerabilities that are not relevant based on the specified filters in the attacker model.

After creating the attack graph the attack paths are identified. This is done in the class `AttackPathCreation <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/attacksurface/core/AttackPathCreation.html>`_ and the attack path identification is delegated to the class `DefaultAttackPathFinder <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/attacksurface/graph/DefaultAttackPathFinder.html>`_. This class converts the Guava graph to a `JGraphT <https://jgrapht.org/>`_ graph and then searches for a path from one of the starting point to the target. For the path identification it uses the `YenKShortestPath <https://jgrapht.org/javadoc/org.jgrapht.core/org/jgrapht/alg/shortestpath/YenKShortestPath.html>`_ implementation from JGraphT with the `CredentialValidator <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/attacksurface/graph/algorithms/CredentialValidator.html>`_ as a custom path validator. This path validator checks whether path requires one of the required credentials and then invalidates the path. The DefaultAttackPathFinder class also provides a method to export the attack graph as a dot file. This is helpful to get a visualization of the actual attack graph. After the identification of the paths, these are stored in the Blackboard.