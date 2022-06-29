Modeling Attackers & Vulnerabilities
====================================

The attackers and vulnerabilities are modelled in the attack model. It contains the attacker, the attack specification, the vulnerability specification, the attack category specification and the integration into PCM.


Attacker Specification
######################

The attacker is specified in the *Container* element of the *Specification*.

.. image:: /_static/images/attackSpecification.png
   :width: 600
   :alt: attacker specification
    Attacker Specification

In the properties section, the attacker properties can be specified. In the *Attacks* section the attacks of the attacker can be selected. The start position of the propagation is defined by the *Compromised Components* or *Compromised Resource Elements*. These can be created as children of the attacker. Children can be added by a right click on the element.

In the *Credentials* section the initial credentials can be selected. Credentials are the attributes of the access control system. In our case these are *UsageSpecifications*. These are modelled in the :doc:`context <metamodel_access_control>` model. The attacker can also have optionally a name, stored in *Entity Name*. *Exploit Context Providers* is always true. This is for a potential extension later on. Additionally, every attacker has a unique *ID*.

.. _attack-specification:
Attack Specification
####################

In the attack container the attacks are specified. These are later referenced in the attacker. This allows to create a repository of potential attacks, which are then selected in the attacker. All attacks consist of a *Category*, *Entity Name*, and *ID*. Based on the *Category* we differ between two types of attacks. The *CWE Attack* and the *CVE Attack*. 

The first one is based on `CWEs <https://cwe.mitre.org/>`_ and symbolize general attacks. For instance, in the :doc:`/application_scenarios/industry_maintenance`, we use the `CWE 312 <https://cwe.mitre.org/data/definitions/312.html>`_. This enables attacker to exploit all vulnerabilities with the corresponding CWE class. Since CWEs are hierarchically organized, also all child elements are affected.

The other type of attack is the *CVE Attack*. It is based on the `CVE <https://cve.mitre.org/>`_ concept and symbolize concrete attacks. The main difference to the *CWE Attacks* are that this attack can only exploit the corresponding CVE. A CWE attack could exploit all CVEs belonging to its CWE including its children CWEs.


Vulnerability Container
#######################

In the vulnerability container the actual vulnerabilities are specified. Like with the :ref:`attacks <attack-specification>`, we differ between *CVE Vulnerability* and *CWE Vulnerability*.
