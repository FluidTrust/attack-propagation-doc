# Maintenance Scenario (Running Example)

## Background Setting
This scenario is settled in an Industry 4.0 environment. It is based on a previous publication {cite:p}`trustInitialPaper`. It consists of two companies. The first company produces goods by using a machine. The machine creates log data and safely stores them for maintenance reasons. The second company is a service contractor, which maintains and repairs the machine from the first company. However, the service contractor should only have access to the machine's log data in case of a machine failure. In other cases, the access should be denied. Additionally, the network contains further components used for storing confidential information, but they are not directly relevant for the operation of the machine.


## Architectural Model