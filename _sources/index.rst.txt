.. Palladio Attack Propagation documentation master file, created by
   sphinx-quickstart on Fri Jun 10 09:10:00 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Palladio Attack Propagation's documentation!
=======================================================



This contains the documentation for multiple Eclipse plugins to analyze confidentiality properties of a given software architecture. It uses the Palladio Component Model (PCM). Currently, 3 types of analyses are supported:


#. Scenario Access Usage Analysis :cite:p:`WalterScenario`

   * different usage scenarios from PCM are analyzed regarding access violations
   * misusage scenarios are supported (similar to misusage diagrams)

#. Attack Propagation Analysis :cite:p:`architecturalAttack`

   * propagation based on CVE and CWE vulnerabilities
   * supports different authorization levels and gaining of new credentials

#. Targeted Attack Graph Analysis :cite:p:`WalterTargeted`

   * find attack paths to a targeted element
   * uses filters to identify relevant attack path

.. note::
	under active development
.. toctree::
   :maxdepth: 2
   :caption: Contents:

   general/installation
   application_scenarios/index
   usage/index
   developer/index
   



Indices and tables
==================

* :ref:`genindex`
* :ref:`search`


References
==========

.. bibliography::
