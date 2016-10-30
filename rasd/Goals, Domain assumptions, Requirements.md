### Goals
 
- [G0] Users can register to the system.
- [G1] Users can log into the system.
- [G2] Users can find available cars around them.
- [G3] Users can find available cars near a specified position.
- [G4] Users can reserve a car.
- [G5] Users can get into the reserved car.
- [G6] Users can use the reserved car.
- [G7] Users can pay for the car-sharing service.
- [G8] Users can check the current fare while in the car.
- [G9] Parked cars are automatically locked.
- [G10] Discounts are applied to the fare of users who have a virtuous behaviour.
- [G11] Users can choose a money saving option.
- [G12] A user who can't pay will be banned.
 
- - -
 
### Domain assumptions
 
- [D0] Users have access to the internet.
- [D1] Every electric car is equipped with a GPS.
- [D2] The GPS always provides an accurate location.
- [D3] Cars' battery level and charge status can be monitored remotely.
- [D4] Cars can be locked and unlocked remotely.
- [D5] The number of people inside the car can always be monitored.
- [D6] Every user has valid credentials of a third party digital payment system.
- [D7] PowerEnJoy employees are given the task to re-charge on-site cars left with less than 20% of battery level.
- [D8] PowerEnJoy employees are given the task to move to a safe area cars which have the engine turned off and are outside a safe area.
- [D9] PowerEnJoy ensures no mechanical failures can happen to cars.
- [D10] PowerEnJoy ensures a car is always nearby. The number of cars is not fixed and depends on the trend of reservations.
- [D11] Car doors can always be opened from the inside.
- [D12] Users can be geolocalized.
- [D13] Cars' engine status can be monitored remotely.
- [D14] Every car is equipped with an information display.
- [D15] The set of safe areas and charging areas is pre-defined by the system.
 
- - -
 
### Requirements
 
G0;
- D0, D6
- [R0] The system shows a registration form to new users.
- [R1] The system ensures username is unique and password valid.
 
G1;
- D0
- [R2] The system checks whether log in information is valid.
- [R3] Only recognized users can access the offered services.
 
G2;
- D1, D2, D8, D10, D12
- [R4] The system allows logged in users to spot where PowerEnJoy cars are.
 
G3;
- D1, D2, D8, D10
- [R5] Users can specify a position to check available cars around.
 
G4;
- [R6] The system must show only available cars for users to select.
 
G5;
- D1, D2, D4, D12
- [R7] The system must unlock a car once the user who reserved it is nearby.
 
G6;
- D7, D9; R7
 
G7;
- D6, D13, D14
- [R8] The system keeps track of the time spent from when the engine turns on until the engine turns off.
- [R9] At the end of the ride the system interacts with the third party payment service and shows to the user the report of the payment operation.
 
G8;
- D14; R8
 
G9;
- D1, D4, D11, D13
- [R10] The system checks if a car is still and if its engine is turned off.
- [R11] The system must lock a car once the user who just stopped using it is not nearby anymore.
 
G10;
- D1, D3, D5, D13, D15; R10
- [R12] If the number of people inside the car is measured to be 3 or more, the system must apply a 10% discount on the final fare.
- [R13] If the battery level at the end of the ride is measured to be at least 50% of the total charge, the system must apply a 20% discount on the final fare.
- [R14] If the position of the car at the end of the ride is a charging area, and the car is plugged in within a 2 minutes time frame, the system must apply a 30% discount on the final fare.
- [R15] If the position of the car at the end of the ride is more than 3 km away from the nearest charging area or if the battery level is lower than 20% of the total charge, the system must apply a 30% additional charge on the final fare.
 
G11;
- D1, D14, D15; R14
- [R16] The system must allow users to insert a specific destination.
- [R17] The system estimates at which charging area the user has to park the car, depending on the specified destination and plug availability, in order to achieve a uniform distribution of cars.
- [R18] The system displays to the user the route to follow.
 
G12;
- D6
- [R19] If the system detects the payment operation of a user fails due to insufficient funds, then that user is banned until he/she pays it off.
- [R20] If a user is banned, the system must prevent him/her from having access to the service.