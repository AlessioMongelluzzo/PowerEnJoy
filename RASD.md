# PowerEnJoy
### Introduction
We will design the specifications for the development of PowerEnJoy, a car-sharing service targetting electric vehicles only. The system is based on the interaction between users and a web or mobile application. PowerEnJoy allows clients to reserve and use available cars around them. Vehicles are spotted using the geolocalization of users’ devices. The system promotes a diligent behaviour of drivers by applying a discount on the fare.
### Domain assumptions
- Every electric car is equipped with a GPS.
- The GPS always provides an accurate¹ location.
- Cars' battery level can be monitored remotely.
- A PowerEnJoy employee is given the task to recharge cars left with less then 20% of battery level. The car is left at the nearest station.
- PowerEnJoy ensures no mechanical failures can happen to cars.
- Payments are always successful.
- PowerEnJoy ensures a car is always nearby. The number of cars is not fixed and depends on the trend of reservations.