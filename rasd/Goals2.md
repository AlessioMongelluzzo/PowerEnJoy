### Goals

- [G1] Clients can register to the system.
- [G2] Clients can log into the system.
- [G3] Clients can find available cars around them.
- [G4] Clients can find available cars near to a specified position.
- [G5] Clients can reserve a car.
- [G6] Clients can get into the reserved car.
- [G7] Clients can use the reserved car.
- [G8] Clients can pay for the car-sharing service.
- [G9] Clients can check the current fare while in the car.
- [G10] Parked cars are automatically locked.
- [G11] Discounts are applied to the fare of clients who have a virtuous behaviour.
- [G12] Clients can choose a money saving option.
- [G13] A client who can't pay will be banned.


G1- D0, D6
-> R1 : The system shows a registration form to new clients.
-> R2 : The system ensures username is unique and password valid.
G2- D0
-> R3 : The system checks whether log in information is valid.
-> R4 : Only recognized users can access the offered services.
G3- D1, D2, D8, D12, D10
-> R5 : The system allows logged in users to spot where PowerEnJoy cars are.
G4- D1, D2, D8, D10
-> R6 : Clients can specify a position to check available cars around.
G5- 
-> R7 : The system must show to logged in users only available cars to select.
G6- D1, D12, D2
-> R8 : The system must unlock a car once the client who reserved it is nearby. 
G7- D7, D9, R8
G8- D6, D13, D14
-> R9 : The system keeps trace of the time spent since the engine turns on until the engine turns off.
-> R10 : At the end of the ride the system interacts with the third party payment service and shows to the client the report of the payment operation.
G9- D13, R9
G10- D1, D12, D13
-> R11 : The system checks if a car is still and if its engine is turned off.
-> R12 : The system must lock a car once the client who just stopped using it is no more nearby.
G11- D1, D3, D5, D13, R11, 
-> R13 : if the number of people inside the car is measured to be more than 3 the system must apply a 10% discount on the final fare.
-> R14 : if the battery level at the end of the ride is measured to be at least 50% of total charge, then the system must apply a 20% discount on the final fare.
-> R15 : if the position of the car at the end of the ride is a charging station and the sensor detects the cars is on charge, then the system must apply a 30% discount on the final fare.
-> R16 : if the position of the car at the end of the ride is at more than 3 KM from the nearest charing station or if the sensor detetcts the battery level is lower than 20%, then the system must apply a 30% additional charge on the fare.
G12- D14, D1
-> R17 : the system must allow users to insert a specific destination.
-> R18 : the system estimates at which charging station the user has to park the car in order to get the discount and ensures a uniform distribution of cars.
-> R19 : the system displays to the client what path to follow.
G13- D6
-> R20 : if the system detects the payment operation of a user fails due to insufficient funds, then that user is banned until he pays it off.
-> R21 : if a user is banned, the system must prevent him from having access to the service.
