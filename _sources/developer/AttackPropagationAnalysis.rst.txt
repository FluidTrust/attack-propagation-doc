Developer Information for the Attack Propagation Analysis
=========================================================

Introduction EMF
++++++++++++++++

For new developers, we recommend to work through EMF tutorials. One good candidate are the tutorials from `Vogella <https://www.vogella.com/tutorials/EclipseEMF/article.html>`_


.. Overview
.. ++++++++


Attack Propagation Workflow
+++++++++++++++++++++++++++

The workflow of the analysis is defined in the bundle *org.palladiosimulator.pcm.confidentiality.context.analysis.execution* and the class `ClassicalAttackerAnalysisWorkflow <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/ClassicalAttackerAnalysisWorkflow.html>`_. It consists first of loading the different models. Afterwards, the vulnerabilities from the Repository are rolled out on the AssemblyContext. Then the analysis is performed. The last step is to save the results. Besides saving the output model also a graphical representation can be created. This is optional and requires `Graphviz <https://graphviz.org/>`_ to be installed. The responsible class for creating the graphical representation is `CreateGraphJob <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/job/CreateGraphJob.html>`_. 

The analysis execution job (`AttackerAnalysisJob <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/analysis/execution/workflow/job/AttackerAnalysisJob.html>`_), also initializes the PDP and transforms the context files to an XACML file (see  :doc:`XACML <XACMLTransformation>`). It is important, that both the generation of the XACML file and the initialisation of the PDP is done before the actual propagation is triggered. Otherwise, an exception might occur.


Attack Propagation Analysis
+++++++++++++++++++++++++++

The main bundle for the attack propagation is *edu.kit.ipd.sdq.kamp4attack*. Here, the entry point for the analysis is `AttackPropagationAnalysis <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/edu/kit/ipd/sdq/kamp4attack/core/AttackPropagationAnalysis.html>`_. It contains in the *runChangePropagationAnalysis* the main loop for the propagation. It contains first the initialisation. Here, it is important to reset the different caches, because otherwise the results might contain the results from the previous runs. Afterwards there is the loop, which calculates the transitive closure of the attack propagation. The loop is repeated till no changes happens.

.. note::
    The changes are not automatically detected. Hence, it is necessary in the propagation rules to mark the change. This is realized by calling *setChanged(true)* on the CredentialChange object. Otherwise, the analysis won't propagate. It is also important to reset the change value at the beginging of the Loop otherwise there is a infinite loop.

The loop calls the different propagation rules. The propagation rules are declared in the bundle *edu.kit.ipd.sdq.kamp4attack.api* and the package *edu.kit.ipd.sdq.kamp4attack.core.changepropagation.changes.propagationsteps*. The rules are for each architectural element as an interface. Each propagation rule is implemented twice. There exists an implementation for the vulnerability and credential (context attribute) based propagation. The concrete propagation rules are implemented in the package *edu.kit.ipd.sdq.kamp4attack.core.changepropagation.changes*. The ending of a implementation indicates whether it is the propagation by credentials (*Context*) or vulnerability. The propagation implementations then first identify the already compromised elements and then identify the connected elements based on their propagation. 

Each connected element is then checked, whether the attack can compromise it. These checks are implemented in the *edu.kit.ipd.sdq.kamp4attack.core.changepropagation.attackhandlers* package. For each architectural element there is a specific *Handler* implemented. Depending on the propagation type (context or vulnerablity) the handler delegates the calls to a specific handler in the packages *edu.kit.ipd.sdq.kamp4attack.core.changepropagation.attackhandlers.context* and *edu.kit.ipd.sdq.kamp4attack.core.changepropagation.attackhandlers.vulnerability*.