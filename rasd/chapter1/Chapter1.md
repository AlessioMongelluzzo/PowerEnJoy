## Chapter 1

# Introduction


### Purpose

This document is the Requirement Analysis and Specification Document for the PowerEnJoy application. Its aim is to completely describe the system to be developed and to lay out functional and non-functional requirements, constraints, relationships with the external world, and typical use cases describing user interactions that the software must provide. Moreover, this document will provide formal specification of some features of the applications, written in Alloy language. This document is written for project managers, developers, testers and software designers. It may be used in a contractual agreement between software suppliers and customers.

### Scope

The system supports a car-sharing service employing electric cars.
Its main goal is to make the access to the service and its use simple and efficient.
The system consists of a server application (PowerEnJoy Server), a web application front-end (PowerEnJoy Web) and in a mobile application (PowerEnJoy Mobile).
The system has the customers as its only type of user. It should allow them to register and login with their credentials.
The system has to know the location of both users and cars, in order to let users know the position of available cars around them or near a specified address.
The system allows users to reserve a car for a limited amount of time among the available ones around them, and use it as much as they want. The ride can be shared with other people.
The system should keep track of information related to every active and completed ride.
The system shouldn't allow users to know the position of cars that are not available.
The system allows users to pay for the service at the end of each ride, by communicating with a third party digital payment system.
The system should prevent users who failed to pay due to insufficient funds from using the service until they pay off their debt.
The system promotes diligent behaviour of drivers by applying a discount on the fare.
The system should charge the user an additional fee when a car is unnecessarily reserved or when, at the end of the ride, the car is left in a state requiring specific intervention by PowerEnJoy employees.
The system offers programming interfaces (APIs) to enable the development of additional services on top of the basic one.
The system is provided with an optional module:
- **Money saving option** allows the driver to specify the destination of the ride. The system will then suggest an optimal charging area to park at, in order to get a discount on the fare.

### Goals

The goals of the PowerEnJoy software are the following:

1. Make the access to the service and its use simple and efficient.
2. Users can register to the system.
3. Users can log into the system.
4. Users can find available cars around them.
5. Users can find available cars near a specified position.
6. Users can reserve a car.
7. Users can get into the reserved car.
8. Users can use the reserved car.
9. Users can pay for the car-sharing service.
10. Users can check the current fare while in the car.
11. Parked cars are automatically locked.
12. Discounts are applied to the fare of users who have a virtuous behaviour.
13. Users can choose a money saving option.
14. A user who can't pay will be banned.

### Definitions, acronyms, and abbreviations

- **RASD**: Requirements Analysis and Specification Document (this document).
- **System**: the car-sharing application to be developed.
- **Back-end**: application logic and APIs elaborating data coming from users and cars. It allows for the web and mobile application to be dynamic.
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
- **Plug**: a device that allows cars to be recharged at charging areas.
- **API**: Application Programming Interface.

### References

This document refers to the project rules of the Software Engineering 2 project and to the RASD assignment.
This document follows the IEEE Standard 830-1998 for the format of Software Requirements specifications.

### Overview

This document is structured in three parts:

- **Chapter 1: Introduction**.
- **Chapter 2: Overall description**.
- **Chapter 3: Specific requirements**.