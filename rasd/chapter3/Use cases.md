## Use Cases

### 1.User registration

Actor: person

Goals: Goal 2

Input Condition: /

Event Flow: 
- visitor clicks the "register" button on the home page of PowerEnJoy app or website and is redirected to the registration form page.
- visitor fills the form with his email, a chosen password, his personal data and billing information.
- visitor accepts the terms and conditions of use of PowerEnJoy service.
- visitor clicks on the "confirm" button.
- visitor accesses the provided email to verify it.
- visitor is shown a page that confirms registration has succesfully completed.

Output Condition: visitor becomes a user of the system and is now able to log into PowerEnJoy

Exception:
- visitor fills the form with invalid information.
- form is filled with information belonging to an already existing account.
- visitor does not fill all the mandatory fields of the form.

### 2.User login

Actor: user

Goals: Goal 3

Input Condition:/ (user is by definition registered in the system)

Event Flow:
- user completes the form in the home page of PowerEnJoy app or website by inserting his username and password.
- user clicks the "login" button on the page.

Output Condition: user's credentials are validated and he can access to PowerEnJoy services.

Exception:
- user types an incorrect username and/or password and the system notifies him the error, by asking his credentials again.

### 3.Car lookup

Actor: user

Goals: Goal 4, Goal 5

Input Condition: user is logged into the app or the website.

Event Flow:
- user accesses the "Find a car" area.
- user inserts an address, otherwise by default his current address is found by the GPS and inserted.
- user clicks on the "look for cars" button.

Output Condition: user is shown a page with the position level of all the available cars nearby the inserted address.

Exception:
- user inserts an incorrect address and the system notifies him the error, by asking an address again.

### 4.Car Reservation

Actor: user

Goals: Goal 6

Input Condition: user looked for available cars nearby a position.

Event Flow:
- user chooses one of the available cars and selects it by clicking on it.
- user is redirected to the "Reserve a car" page where he is shown the model name of the reserved car, its battery level and the name of the nearest address to it.
- user confirms the reservation request by clicking on the "√" button.
- user is notified in another page that the operation was succesful.

Output Condition: the system removes the car selected by the user from the available cars and the user can use it.

Exception:
- the car the user is trying to reserve is no more available, the system notifies him the error and automatically refreshes the available cars page, so that the user can choose a different car.

### 5.Car lock and unlock

Actor: user

Goals: Goal 7, Goal 8, Goal 11

Input Condition: user reserved a car from the PowerEnJoy website or app.

Event Flow:
- user accesses the "My reservation" area.
- user selects the reserved car and clicks the "unlock" buttom.
- car doors are automatically locked by the system as soon as the user gets out of the car with the engine turned off.

Output Condition: user can use the reserved car and when he has finished using it, it becomes available again or it is picked up by a PowerEnjoy employee if not parked in a safe area and/or with less than 20% battery charge of the total.

Exception: /

### 6.Money Saving option

Actor: user

Goals: Goal 13

Input Condition: user reserved a car from the PowerEnJoy website or app.

Event Flow:
- user clicks on the money saving option "€" button directly from the car information display or from the "My reservation" area in the website or in the app.
- user inserts his destination by typing its address.
- the system estimates a charging station position by taking into account the distance from the user's destination and the available plugs.

Output Condition: money saving option is enabled and the user's car GPS destination is automatically set to the estimated charging station by the system.

Exception:/

### 7.Price discounts and increase management

Actor: system

Goals: Goal 12

Input Condition: user parked the car he was using and the system saved the number of the people that were inside the car.

Event Flow:
- the system checks if the position of the car in at least 3 km far from that of the nearest charging station: if this is the case the sysyem increases the fare for the ride by 30% and skips the other controls.
- the system checks if the battery level of the car is 20% of the total: if this is the case the sysyem increases the fare for the ride and skips the other controls.
- the system checks if the position of the car coincides with that of a charging station and if the sensor signals the car is plugged within 2 minutes: if this is the case the sysyem decreases the fare for the ride by 30% and skips other controls.
- the system checks if the sensor signals that the battery level of the car is at least 50% of the total: if this is the case the sysyem decreases the fare for the ride by 20% and skips other controls.
- the system checks if the number of the people that were inside the car is at least equal to 3: if this is the case the sysyem decreases the fare for the ride by 10%.

Output Condition: the fare is possibly increased or decreased by the appropriate amount according to the user's behaviour.

Exception: /

### 8.Electronic payment

Actor: system, third party digital payment system

Goals: Goal 9, Goal 14

Input Condition: Price discounts and increase management possibly increased or decreased the fare by the appropriate amount according to the user's behaviour.

Event Flow:
- the system sends the payment data to the third party digital payment system and waits for the outcome of the payment operation.
- the system receives the succesful outocome of the payment operation.
- the system makes the recepit available on the user's account.

Output Condition: the user's bill is decreased by the fare amount and he can check the receipt on his account

Exception:
- the system receives an unsuccesful outcome from the third party digital payment system, because there are not enough funds on the user's bill to perform the payment operation and the user's account is banned until the system receives a succesful outcome.