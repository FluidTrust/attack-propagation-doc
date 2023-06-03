XACML Transformation
====================

General XACML Transformation
++++++++++++++++++++++++++++


The XACML Transformation is specified in the bundle *org.palladiosimulator.pcm.confidentiality.context.xacml.generation* and implemented in *org.palladiosimulator.pcm.confidentiality.context.xacml.javapdp*.

The main class is `XACMLGenerator <https://updatesite.palladio-simulator.com/fluidtrust/palladio-addons-contextconfidentiality-analysis/releases/5.2/javadoc/org/palladiosimulator/pcm/confidentiality/context/xacml/javapdp/XACMLGenerator.html>`_. It transforms the context model to an XACML file. The transformation uses the `AT&T XACML PDP <https://github.com/att/xacml-3.0>`_ and the `XML Marshaller <https://jakarta.ee/specifications/xml-binding/2.3/apidocs/javax/xml/bind/marshaller>`_. 

.. note::
   The external dependencies are stored in the bundle *external-dependencies*. It contains jars and reexport the packages of the jars. Because of the usage of the Java EE (Marshaller) features, the runtime requires the Java EE packages for *javax.xml.bind* and a separate OSGI resource locator. The OSGI resource locator is necessary because the Java EE dependency resolving is not directly compatible with the OSGI dependency solving

The idea of the transformation is to create each Context element in the corresponding datamodel for the PDP. After the creation of the Java datamodel, the model is saved via the Marshaller as an XML file. 

Parsing Custom XACML Context elements
+++++++++++++++++++++++++++++++++++++

The context metamodel contains custom elements such as the *XMLMatch*. These elements enable user to directly specify matches in XACML. We also integrate these within our generated policy. This is performed by first calling the *Unmarshaller* on the XACML snippet. By this the XACML snippet is parsed to a Java datamodel. Then we add the parsed datamodel to the corresponding datamodel in the transformation. This results in the inclusion of the XACML snippet in the generated XACML policy.