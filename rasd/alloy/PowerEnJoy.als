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
	registeredUser: some User,
	registeredCar: some Car,
	safeArea: some SafeArea
	}

sig Credential {
	username: one Stringa,
	password: one Stringa
	}{
	username != password
	}

/*
 * This signature represents a registered User.
 */
sig User {
	credential: one Credential,
	licenseNo: one Stringa,
	billingInfo: one BillingInfo,
	currentPosition: lone Position,
	banned: one Bool
	}

abstract sig CarState {}
one sig AVAILABLE extends CarState {}
one sig RESERVED extends CarState {}
one sig RUNNING extends CarState {}
one sig LOW_BATTERY extends CarState {}

sig Car {
	licensePlate: one Stringa,
	locked: one Bool,
	currentPosition: one Position,
	batteryLevel: one Int,
	state: one CarState,
	pluggedIn: lone Plug
	}{
	batteryLevel >= 0
	batteryLevel =< 100
	batteryLevel < 20 <=> state = LOW_BATTERY
	state = AVAILABLE implies locked = True
	state = RESERVED <=> one r: Reservation | r.selectedCar = this
	state = RUNNING <=> one r: Ride | r.state = ACTIVE and r.car = this
	state = LOW_BATTERY implies locked = True
	}

sig Reservation {
	date: one Int,
	madeBy: one User,
	selectedCar: one Car
	}{
	date > 0
	}

abstract sig RideState {}
one sig ACTIVE extends RideState {}
one sig COMPLETED extends RideState {}

sig Ride {
	driver: one User,
	car: one Car,
	numOfTravellers: one Int,
	state: one RideState,
	beginDate: one Int,
	endDate: lone Int,
	beginPosition: one Position,
	endPosition: lone Position,
	moneySaving: one Bool,
	moneySavingDestination: lone Position
	}{
	numOfTravellers > 0
	numOfTravellers <= 4
	beginDate > 0
	endDate != none implies endDate > beginDate
	state = COMPLETED <=> endPosition != none
	state = COMPLETED <=> endDate != none
	moneySaving = True implies some a: ChargingArea | moneySavingDestination & a.point != none
	moneySaving = False implies moneySavingDestination = none
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

fact chargingCarIsAtChargingArea {
	all c: Car | c.pluggedIn != none implies c.currentPosition & c.pluggedIn.(~hasPlug).point != none
	}

fact carsCannotHaveTheSamePosition {
	all c1, c2: Car | (c1 != c2) => c1.currentPosition != c2.currentPosition
	}

fact userHasSamePositionAsCarHeIsDriving {
	all r: Ride | r.driver.currentPosition = r.car.currentPosition
	}

fact userHasOnlyOneReservation {
	no disjoint r1, r2: Reservation | r1.madeBy = r2.madeBy
	}

fact carHasOnlyOneReservation {
	no disjoint r1, r2: Reservation | r1.selectedCar = r2.selectedCar
	}

fact userHasOnlyOneActiveRide {
	no disjoint r1, r2: Ride | r1.state = ACTIVE and r2.state = ACTIVE and r1.driver = r2.driver
	}

fact carHasOnlyOneActiveRide {
	no disjoint r1, r2: Ride | r1.state = ACTIVE and r2.state = ACTIVE and r1.car = r2.car
	}

fact ridesDoNotOverlapForSameUserOrCar {
	all r1, r2: Ride | {
			(r1 != r2) and (r1.driver = r2.driver or r1.car = r2.car) and (r1.state = COMPLETED) and (r2.state = COMPLETED) implies r1.endDate < r2.beginDate or r2.endDate < r1.beginDate
			(r1 != r2) and (r1.driver = r2.driver or r1.car = r2.car) and (r1.state = ACTIVE) and (r2.state = COMPLETED) implies r2.endDate < r1.beginDate
			(r1 != r2) and (r1.driver = r2.driver or r1.car = r2.car) and (r1.state = COMPLETED) and (r2.state = ACTIVE) implies r1.endDate < r2.beginDate
			}
	}

fact bannedUserHasNoReservationOrActiveRide {
	all u: User | u.banned = True implies (no r: Ride | r.state = ACTIVE and r.driver = u) and (no r: Reservation | r.madeBy = u)
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

fact everyUserBelongsToManagementSystem {
	#(User) = #(ManagementSystem.registeredUser)
	}

fact everyCarBelongsToManagementSystem {
	#(Car) = #(ManagementSystem.registeredCar)
	}

fact everySafeAreaBelongsToManagementSystem {
	#(SafeArea) = #(ManagementSystem.safeArea)
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
	no r: Ride | r.moneySaving = True and r.moneySavingDestination = none
	}
check moneySavingRideHasDestination

pred show() {
	some r: Ride | r.state = COMPLETED
	some r: Ride | r.state = ACTIVE
	}

run show for 4 but 8 int
