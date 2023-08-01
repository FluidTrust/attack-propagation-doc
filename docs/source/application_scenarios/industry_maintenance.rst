Maintenance Scenario (Running Example)
======================================

Background Setting
------------------


This scenario is settled in an Industry 4.0 environment based on a previous publication :cite:p:`trustInitialPaper`. It involves two companies: one produces goods using a machine that generates log data for maintenance purposes, and the other is a service contractor responsible for maintaining and repairing the machine. The service contractor should only have access to the machine's log data in case of a machine failure, while access should be denied in other cases. Additionally, there are other components in the network used for storing confidential information, but they are not directly relevant to the machine's operation.

Architectural Model
-------------------

Repository-Model
~~~~~~~~~~~~~~~~

.. figure:: /_static/images/case_study/maintenance/RepositoryDiagram.svg
   :width: 750
   :alt: repository model
    Overview of the repository

The repository model contains 4 components and 3 interfaces. The *TerminalComponent* represents the terminal for the technician to access the machine. This access is managed through the access service. The *MachineComponent* represents the machine, providing services for storing and accessing log data. The *ProductionStorageComponent* represents a storage component for log data, and the *ProductStorage* component stores other confidential data.

Assembly-Model
~~~~~~~~~~~~~~

.. figure:: /_static/images/case_study/maintenance/newAssemblyDiagram.svg
   :width: 750
   :alt: system diagram
    Overview of the Assembly (System)

The system diagram consists of 4 instantiated components. The instantiated *Terminal* is connected with the *Machine*, which is connected with the *ProductionStorage*. The *ProductStorage* is not directly connected to the other components.

ResourceEnvironment-Model
~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: /_static/images/case_study/maintenance/ResourceEnvironmentDiagram.svg
   :width: 750
   :alt: resource environment diagram
    Overview of the repository

The resource environment consists of 3 hardware devices (*StorageServer*, *TerminalServer*, *MachineController*), connected by the network device *ProductionNetwork*.

Allocation-Model
~~~~~~~~~~~~~~~~

.. figure:: /_static/images/case_study/maintenance/maintenanceAllocation.svg
   :width: 750
   :alt: allocation diagram
    Overview of the allocation

The allocation model stores the deployment of the components on the hardware resources. Importantly, the *StorageServer* has allocated both storage components.

Access Control
--------------

Our model contains an access control policy that grants the *Admin* access to the *TerminalServer* and *StorageServer*. The *access* service from the *TerminalComponent* and *MachineComponent* allows a *Technician* to access them in a *failure* state. All services from the *ProductionStorageComponent* can be accessed by the machine, while all services from the *ProductStorageComponent* are only accessible by a *ProductDeveloper*.


Application
-----------

Attack Propagation
~~~~~~~~~~~~~~~~~~

We added the vulnerability *CVE-2021-28374* to the *TerminalServer*. In our case, the vulnerability leaks the *Admin* credential and can be exploited from every device. The attacker has the ability to exploit *CWE-312*, and the starting point of the attacker is the *TerminalComponent*.

.. note::
   The vulnerability was remapped. In our examples, we still use the old mapping.

**Expected Output**: The expected output is an attack path from the *TerminalComponent* to the storage components. The attacker should exploit the vulnerability of the *TerminalServer* and gain the *Admin* credential. These credentials should then be used to propagate further. The concrete compromised elements should be:

- *Assembly_TerminalComponent* (as starting point)
- *TerminalServer*
- *StorageServer*
- *Assembly_ProductionStorageComponent*
- *Assembly_ProductStorage*

Additionally, all the services of the components and the data elements are compromised.
