// === WORK IN PROGRESS ===
// This model is not complete and not fully checked!

// Alloy model for PowerEnJoy system.

// Defines Bool, True, False
open util/boolean

// Dates are expressed as the number of seconds
// that have passed from January 1, 1970,
// because other signatures aren’t comparable.

// === SIGNATURES ===

sig Stringa {}
sig Float {}
sig BillingInfo {}
sig Plug {}

sig Position {
	latitude: one Float,
	longitude: one Float
	}

abstract sig Area {
	point: some Position
	}

sig SafeArea extends Area {}

sig ChargingArea extends SafeArea {
	hasPlug: some Plug
	}

one sig ManagementSystem {
	users: some User,
	cars: some Car,
	safeAreas: some SafeArea
	}

sig Credential {
	username: one Stringa,
	password: one Stringa
	}

/*
 * This signature represents a registered User.
 */
sig User {
	credential: one Credential,
	licenseNo: one Stringa,
	billingInfo: one BillingInfo,
	currentPosition: lone Position
	}

sig Car {
	licensePlate: one Stringa,
	locked: one Bool,
	currentPosition: one Position,
	batteryLevel: one Int,
	state: one CarState,
	pluggedIn: lone Plug
	}{
	batteryLevel >= 0
	batteryLevel <= 100
	}

abstract sig CarState {}
one sig AVAILABLE extends CarState {}
one sig RESERVED extends CarState {}
one sig RUNNING extends CarState {}
one sig CHARGING extends CarState {}

sig Reservation {
	date: one Int,
	madeBy: one User,
	selectedCar: one Car
	}

sig Ride {
	driver: one User,
	car: one Car,
	numOfTravellers: one Int,
	moneySaving: one Bool,
	destination: lone Position,
	}{
	numOfTravellers <= 4
	moneySaving = True implies some a: ChargingArea | destination & a.point != none
	moneySaving = False implies destination = none
	}

// === FACTS ===

fact licensePlatesAreUnique {
	all c1, c2: Car | (c1 != c2) => c1.licensePlate != c2.licensePlate
	}

fact drivingLicensesAreUnique {
	all u1, u2: User | (u1 != u2) => u1.licenseNo != u2.licenseNo
	}

fact usernamesAreUnique {
	all c1, c2: Credential | (c1 != c2) => c1.username != c2.username
	}

fact credentialsAreUnique {
	all u1, u2: User | (u1 != u2) => u1.credential != u2.credential
	}

fact plugCannotBelongToDifferentChargingAreas {
	no disjoint c1, c2: ChargingArea | c1.hasPlug & c2.hasPlug != none
	}

fact noRideWithAvailableCar {
	all c: Car | c.state = AVAILABLE implies no r: Ride | r.car = c
	}

fact noReservationOfAvailableCar {
	all c: Car | c.state = AVAILABLE implies no r: Reservation | r.selectedCar = c
	}

fact availableCarIsLocked {
	all c: Car | c.state = AVAILABLE implies c.locked = True
	}

fact reservedCarHasOnlyOneReservation {
	all c: Car | c.state = RESERVED implies one r: Reservation | r.selectedCar = c
	}

fact nonReservedCarHasNoReservations {
	all c: Car | c.state != RESERVED implies no r: Reservation | r.selectedCar = c
	}

fact runningCarIsNotLocked {
	all c: Car | c.state = RUNNING implies c.locked = False
	}

fact chargingCarIffIsPluggedIn {
	all c: Car | c.state = CHARGING <=> c.pluggedIn != none
	}

fact chargingCarIsAtChargingArea {
	all c: Car | c.state = CHARGING implies c.currentPosition in c.pluggedIn.(~hasPlug).point
	}

fact carsCannotHaveTheSamePosition {
	all c1, c2: Car | (c1 != c2) => c1.currentPosition != c2.currentPosition
	}

fact userHasSamePositionAsCarHeIsDriving {
	all r: Ride | r.driver.currentPosition = r.car.currentPosition
	}

fact carIsRunningDuringRide {
	all c: Car | c.state = RUNNING <=> one r: Ride | r.car = c
	}

fact userCannotReserveMoreThanOneCar {
	no disjoint r1, r2: Reservation | r1.madeBy = r2.madeBy
	}

fact userCannotRideMoreThanOneCar {
	no disjoint r1, r2: Ride | r1.driver = r2.driver
	}

fact noDifferentRidesOnTheSameCar {
	no disjoint r1, r2: Ride | r1.car = r2.car
	}

fact areasOfTheSameTypeDoNotOverlap {
	no disjoint s1, s2: SafeArea | s1.point & s2.point != none
	no disjoint c1, c2: ChargingArea | c1.point & c2.point != none
	}

fact noUnusedPlug {
	#(Plug) = #(ChargingArea.hasPlug)
	}

fact noUnusedPosition {
	#(Position) = #(User.currentPosition + Car.currentPosition)
	}

// === ASSERTIONS ===

assert noUnreservedCarInReservation {
	all r: Reservation | r.selectedCar.state = RESERVED
	}
check noUnreservedCarInReservation

assert noCarReservedMoreThanOnce {
	no disjoint r1, r2: Reservation | r1.selectedCar = r2.selectedCar
	}
check noCarReservedMoreThanOnce

assert noUserWithMoreThanOneReservation {
	no disjoint r1, r2: Reservation | r1.madeBy = r2.madeBy
	}
check noUserWithMoreThanOneReservation

assert moneySavingRideHasDestination {
	no r: Ride | r.moneySaving = True and r.destination = none
	}
check moneySavingRideHasDestination

pred show() {}

run show for 4
