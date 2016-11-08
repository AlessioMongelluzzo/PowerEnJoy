## Chapter 2

# Overall description


### Product perspective

##### User interfaces
All the user interfaces should be intuitive and user friendly, meaning that they should not require the reading of detailed documentation to be used. There should be very little difference between the user interface of the web application and that of the mobile applications, in order to provide a consistent user experience across all platforms.

##### Hardware interfaces
The main hardware interface of the system consists in the access to the GPS data in the mobile application. The application also requires Internet connectivity and internal storage access.

##### Software interfaces
The mobile application must support Android and iOS. The web application works on any web server that supports Java. The back-end stores its data in a DBMS and can run on every platform that supports the JVM.


### Product functions

The system allows users to look for an available car, reserve it, unlock it, drive it, and finally pay for the ride.
This is a list of what the users of the service can do.
- All users can:
	- create an account
	- log in
	- edit profile data and billing info
	- delete their account
	- look for available cars around them
	- look for available cars near a particular address
	- reserve an available car
	- tell the system to open a car they have reserved
	- choose a money saving option

	
### User characteristics

The only kind of user of the system is the customer of the car sharing service. We give for granted that users have access to the Internet. Users can look for a car and reserve it both via the web and the mobile application.

### Constraints

##### Regulatory policies
It's user responsibility to ensure that the use of the system complies with the local laws and policies. The system must ask the user for the permission to acquire, store and process personal data and web cookies. The system must offer to the user the possibility to delete all personal data.

##### Hardware limitations
The system has to run under the following worst-case conditions:
- Mobile applications:
	- 3G connection, at 2 Mb/s
	- 50 MB of free space
	- 1 GB of RAM
- Web application:
	- 2 Mb/s Internet connection
	- 800x600 resolution

##### Reliability requirements
The system must have a minimum availability of 98%.

##### Criticality of the application
The system is not employed in life-critical applications.

##### Parallel operations
Every feature offered by the system must support, on the back-end, simultaneous operations from multiple users.

##### Safety and security considerations
Information concerning every active or completed ride, as its duration, destination (if any) and position of the car, must be kept private and available only to the user who is driving the car. Also, information concerning every reservation must be kept private and available only to the user who made the reservation. Only people with a valid driving license must be able to register to the service and use it. Sensitive user information such as credentials and billing information must be stored securely (i.e. not in plain text).

### Assumptions and dependencies

We assume that:

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

### Future extensions

The system will be implemented foreseeing the possibility of further extensions, for example:
1. Create a fidelity score for every user, which gives them the opportunity to benefit from special offers. The score increases every time the user drives a PowerEnJoy electric car, proportionally with the time spent.