# Maintenance Scenario (Running Example)

## Background Setting
This scenario is settled in an Industry 4.0 environment. It is based on a previous publication {cite:p}`trustInitialPaper`. It consists of two companies. The first company produces goods by using a machine. The machine creates log data and safely stores them for maintenance reasons. The second company is a service contractor, which maintains and repairs the machine from the first company. However, the service contractor should only have access to the machine's log data in case of a machine failure. In other cases, the access should be denied. Additionally, the network contains further components used for storing confidential information, but they are not directly relevant for the operation of the machine.


## Architectural Model


### Repository-Model



:::{figure-md} repositoryMaintenance

<img src="/_static/images/case_study/maintenance/RepositoryDiagram.svg" alt="repository model" width="750px"/>

Overview of the repository
:::

The repository model contains 4 components and 3 interfaces. The *TerminalComponent* represents the terminal for the technician to access the machine. This access is represented by the access service. The *MachineComponent* represents the machine. It provides services for storing and accessing data representing the log data. The *ProductionStorageComponent* represents a storage component for storing log data and *ProductStorage represents the component storing other confidential data.


### Assembly-Model

:::{figure-md} assemblyMaintenance

<img src="/_static/images/case_study/maintenance/newAssemblyDiagram.svg" alt="system diagram" width="750px"/>

Overview of the Assembly (System)
:::


The system diagram consist of 4 instantiated components. The instantiated Terminal is connected with the Machine, which is connected with the ProductionStorage. The ProductStorage is not directly connected to the other components.

### ResourceEnvironment-Model



:::{figure-md} resourceMaintenance

<img src="/_static/images/case_study/maintenance/ResourceEnvironmentDiagram.svg" alt="resource environment diagram" width="750px"/>

Overview of the repository
:::

The resource environment consists of 3 hardware devices (*StorageServer*, *TerminalServer*, *MachineController*). They are connected by the network device *ProductionNetwork*. 


### Allocation-Model



:::{figure-md} allocationMaintenance

<img src="/_static/images/case_study/maintenance/maintenanceAllocation.svg" alt="allocation diagram" width="750px"/>

Overview of the repository
:::

The allocation model stores the deployment of the components on the hardware resources. Here importantly, the *StorageServer* has allocated both storage components. 




## Access Control

Our model contains an access control poliy, which grants the Admin access to the *TerminalServer* and *StorageServer*. The *access* service from the *TerminalComponent* and *MachineComponent* have the rule that a *Technican* can access them in a *failure* state. All services from the *ProductionStorageComponent* can be accessed by the machine and all services from the *ProductStorageComponent* are only accessible by a *ProductDeveloper*.

## Attack Propagation

We added the vulnerability *CVE-2021-28374* to the *TerminalServer*. In our case the vulnerability will leak the *Admin* credential and can be exploited from every device. The attacker has the ability to exploit *CWE-312* and the starting point of the attacker is the *TerminalComponent*.

### Expected Output

The expected output is an attack path from the *TerminalComponent* to the storage components. The attacker should exploit the vulnerability of the *TerminalServer* and gain there the *Admin* credential. These credential should then be used to propagate further.
The concrete compromised elements should be:

* *Assembly_TerminalComponent* (as starting point)
* *TerminalServer*
* *StorageServer*
* *Assembly_ProductionStorageComponent*
* *Assembly_ProductStorage*

Additionally, all the services of the components and the data elements are compromised. 
