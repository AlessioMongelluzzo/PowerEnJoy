## Introduction


### Purpose

This document is the Requirement Analysis and Specification Document for the PowerEnJoy application. Its aim is to completely describe the system to be developed and to lay out functional and non-functional requirements, constraints, relationships with the external world, and typical use cases describing user interactions that the software must provide. Moreover, this document will provide formal specification of some features of the applications, written in Alloy language. This document is written for project managers, developers, testers and software designers. It may be used in a contractual agreement between software suppliers and customers.

### Scope

The system supports a car-sharing service employing electric cars.
The system consists of a server application (PowerEnJoy Server), a web application front-end (PowerEnJoy Web) and in a mobile application (PowerEnJoy Mobile).
The system has the customer of the car-sharing service as its only type of user. It must allow them to subscribe to the service and identify themselves with their credentials. Only registered users should be able to make use of the service.
The system can show users the location of available cars.
The system allows users to reserve an available car for a limited amount of time. A user has to be able to tell to the system he/she is near the previously reserved car via mobile app or SMS in order to unlock it.
The system should keep track of information related to every active and completed ride.
The system shouldn't allow users to know the position of cars that are not available.
The system allows users to pay for the service at the end of each ride, by communicating with a third party digital payment system.
The system should prevent users who failed to pay due to insufficient funds from using the service until they pay off their debt.
The system promotes diligent behaviour of drivers by applying a discount on the fare.
The system should charge the user an additional fee when a car is unnecessarily reserved or when, at the end of the ride, the car is left in a state requiring specific intervention by PowerEnJoy employees.
The system interacts with PowerEnJoy employees in order to notice them when a car needs a maintenance intervention.
The system is provided with an optional module:
- **Money saving option** allows the driver to specify the destination of the ride. The system will then suggest an optimal charging area to park at, in order to get a discount on the fare.

### Goals

The goals of the PowerEnJoy software are the following:

1. A person can register to the system.
2. A person can log into the system.
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

### Definitions, acronyms, and abbreviations

- **RASD**: Requirements Analysis and Specification Document (this document).
- **System**: the car-sharing application to be developed.
- **Back-end**: application logic and APIs elaborating data coming from users and cars. It allows the web and mobile application to be dynamic.
- **Module**: an optional software component which uses the core system APIs to provide additional features.
- **Client**: the web application or the mobile app.
- **Position**: geographic coordinates (latitude, longitude) specifying where an object is located in the world.
- **Car**: PowerEnJoy electric car used for the car-sharing service. It has a unique license plate.
- **Locked car**: car whose doors cannot be opened from the outside.
- **Available car**: car which position is visible on the map and can be reserved by any non-banned user from the application.
- **Reserved car**: car which has been reserved by a user from the application. Its position is not visible on the map.
- **Running car**: car which has a running engine and is being driven by the user who has reserved it. Its position is not visible on the map.
- **Ride**: operation performed by a customer when using a car. A ride begins when the user ignites the engine and ends when the user turns off the engine. Information related to every ride is tracked by the system. During a ride, the car is always a running car.
- **Money saving ride**: special type of ride that can be chosen optionally. In a money saving ride, the user specifies a destination and the system suggests an optimal charging area to park at, in order to get a discount on the fare.
- **Active ride**: ride that is currently in progress.
- **Completed ride**: ride that took place in the past.
- **User** or **Customer**: person who has registered to PowerEnJoy service.
- **Banned**: a user who has been temporarily prevented from using the service.
- **Credential**: unique set of username and password linked to each user.
- **Billing information**: data used to access a third party digital payment system.
- **Reservation**: operation performed by a user who wants to ensure the access to a given car within one hour.
- **Safe area**: place where cars can be legally parked without any risk for a fine. The set of safe areas for parking cars is pre-defined by the system.
- **Charging area**: station with a power grid and a set of plugs, where electric cars can be recharged. Charging areas are also safe areas.
- **Employee**: a worker for PowerEnJoy whose task is to recharge cars with less than 20% of battery charge and to reapair damaged cars.
- **Plug**: a device that allows cars to be recharged at charging areas.
- **DBMS**: Data Base Management System. It is a computer software application used for the administration of data bases.
- **API**: Application Programming Interface.

### References

This document refers to the project rules of the Software Engineering 2 project and to the RASD assignment.
The structure of this document is inspired from that of the IEEE Standard 830-1998 for the format of Software Requirements specifications, with some variations.

### Overview

This document is structured in three parts:

- **Chapter 1: Introduction**. This section explains the target audience, the purpose and the references of the document.
- **Chapter 2: Overall description**. This section provides a general description of the system and its features, constraints, and assumptions about the users and the environment.
- **Chapter 3: Specific requirements**. This section contains all the necessary software requirements to allow a proper implementation.