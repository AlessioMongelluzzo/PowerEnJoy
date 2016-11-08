### Goals

1. A person can register to the system.
2. Only registered users can log into the system.
3. Users can find available cars around them.
4. Users can find available cars near a specified position.
5. Users can reserve a car.
6. Users can get into the reserved car.
7. Users can use the reserved car.
8. Users can pay for the car-sharing service.
9. Users can check the current fare while in the car.
10. Parked cars are automatically locked.
11. Discounts are applied to the fare of users who have a virtuous behaviour.
12. Users can choose a money saving option.
13. A user who can't pay will be banned.

- - -

### Domain assumptions

1. Users have access to the internet.
2. Every electric car is equipped with a GPS.
3. The GPS always provides an accurate location.
4. Cars' battery level and charge status can be monitored remotely.
5. Cars that get damaged trigger a sensor that notices the system.
6. Cars can be locked and unlocked remotely.
7. The number of people inside the car can always be monitored.
8. Every user has valid credentials of a third party digital payment system.
9. PowerEnJoy employees are given the task to re-charge on-site cars left with less than 20% of battery level.
10. PowerEnJoy employees are given the task to move to a safe area cars which have the engine turned off and are outside a safe area.
11. PowerEnJoy ensures no mechanical failures can happen to cars.
12. PowerEnJoy ensures a car is always nearby. The number of cars is not fixed and depends on the trend of reservations.
13. Car doors can always be opened from the inside.
14. Users can be geolocalized.
15. Cars' engine status can be monitored remotely.
16. Every car is equipped with an information display.
17. The set of safe areas and charging areas is pre-defined by the system.


- - -

### Requirements

*Goal 1*: A person can register to the system.
- *Domain assumption* 1: Users have access to the internet.
- *Domain assumption* 7: Every user has valid credentials of a third party digital payment system.
1. The system shows a registration form to new users.
2. The system ensures username is unique and password valid.

*Goal 2*: Only registered users can log into the system.
- *Domain assumption* 1: Users have access to the internet.
3. The system checks whether log in information is valid.
4. If provided information is valid, the system allows the user to access the service.

*Goal 3*: Users can find available cars around them.
- *Domain assumption* 1: Users have access to the internet.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 3: The GPS always provides an accurate location.
- *Domain assumption* 9: PowerEnJoy employees are given the task to move to a safe area cars which have the engine turned off and are outside a safe area.
- *Domain assumption* 11: PowerEnJoy ensures a car is always nearby. The number of cars is not fixed and depends on the trend of reservations.
- *Domain assumption* 13: Users can be geolocalized.
5. The system allows logged in users to spot where PowerEnJoy cars are.

*Goal 4*: Users can find available cars near a specified position.
- *Domain assumption* 1: Users have access to the internet.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 3: The GPS always provides an accurate location.
- *Domain assumption* 9: PowerEnJoy employees are given the task to move to a safe area cars which have the engine turned off and are outside a safe area.
- *Domain assumption* 11: PowerEnJoy ensures a car is always nearby. The number of cars is not fixed and depends on the trend of reservations.
6. Users can specify a position to check available cars around.

*Goal 5*: Users can reserve a car.
- *Domain assumption* 1: Users have access to the internet.
7. The system must show only available cars for users to select.

*Goal 6*: Users can get into the reserved car.
- *Domain assumption* 1: Users have access to the internet.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 3: The GPS always provides an accurate location.
- *Domain assumption* 5: Cars can be locked and unlocked remotely.
- *Domain assumption* 13: Users can be geolocalized.
8. The system must unlock a car once the user who reserved it is nearby.

*Goal 7*: Users can use the reserved car.
- *Domain assumption* 8: PowerEnJoy employees are given the task to re-charge on-site cars left with less than 20% of battery level.
- *Domain assumption* 10: PowerEnJoy ensures no mechanical failures can happen to cars.
- *Requirement* 8: The system must unlock a car once the user who reserved it is nearby.
9. The system must inform an employee if a car needs an intervention

*Goal 8*: Users can pay for the car-sharing service.
- *Domain assumption* 7: Every user has valid credentials of a third party digital payment system.
- *Domain assumption* 14: Cars' engine status can be monitored remotely.
- *Domain assumption* 15: Every car is equipped with an information display.
10. The system keeps track of the time spent from when the engine turns on until the engine turns off.
11. At the end of the ride the system interacts with the third party payment service and shows to the user the report of the payment operation.

*Goal 9*: Users can check the current fare while in the car.
- *Domain assumption* 15: Every car is equipped with an information display.
- *Requirement* 10: The system keeps track of the time spent from when the engine turns on until the engine turns off.

*Goal 10*: Parked cars are automatically locked.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 5: Cars can be locked and unlocked remotely.
- *Domain assumption* 12: Car doors can always be opened from the inside.
- *Domain assumption* 14: Cars' engine status can be monitored remotely.
12. The system checks if a car is still and if its engine is turned off.
13. The system must lock a car once the user who just stopped using it is not nearby anymore.

*Goal 11*: Discounts are applied to the fare of users who have a virtuous behaviour.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 4: Cars' battery level and charge status can be monitored remotely.
- *Domain assumption* 6: The number of people inside the car can always be monitored.
- *Domain assumption* 14: Cars' engine status can be monitored remotely.
- *Domain assumption* 16: The set of safe areas and charging areas is pre-defined by the system.
- *Requirement* 12: The system checks if a car is still and if its engine is turned off.
14. If the number of people inside the car is measured to be 3 or more, the system must apply a 10% discount on the final fare.
15. If the battery level at the end of the ride is measured to be at least 50% of the total charge, the system must apply a 20% discount on the final fare.
16. If the position of the car at the end of the ride is a charging area, and the car is plugged in within a 2 minutes time frame, the system must apply a 30% discount on the final fare.
17. If the position of the car at the end of the ride is more than 3 km away from the nearest charging area or if the battery level is lower than 20% of the total charge, the system must apply a 30% additional charge on the final fare.

*Goal 12*: Users can choose a money saving option.
- *Domain assumption* 2: Every electric car is equipped with a GPS.
- *Domain assumption* 15: Every car is equipped with an information display.
- *Domain assumption* 16: The set of safe areas and charging areas is pre-defined by the system.
- *Requirement* 16: If the position of the car at the end of the ride is a charging area, and the car is plugged in within a 2 minutes time frame, the system must apply a 30% discount on the final fare.
18. The system must allow users to insert a specific destination.
19. The system estimates at which charging area the user has to park the car, depending on the specified destination and plug availability, in order to achieve a uniform distribution of cars.
20. The system displays to the user the route to follow.

*Goal 13*: A user who can't pay will be banned.
- *Domain assumption* 7: Every user has valid credentials of a third party digital payment system.
21. If the system detects the payment operation of a user fails due to insufficient funds, then that user is banned until he/she pays it off.
22. If a user is banned, the system must prevent him/her from having access to the service.