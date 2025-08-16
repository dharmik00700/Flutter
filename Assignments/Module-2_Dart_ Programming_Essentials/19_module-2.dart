// Superclass
class Vehicle {
  String type;
  String fuelType;
  int maxSpeed;

  Vehicle(this.type, this.fuelType, this.maxSpeed);

  void displayDetails() {
    print('Vehicle Type: $type');
    print('Fuel Type: $fuelType');
    print('Max Speed: $maxSpeed km/h');
  }
}

// Subclass: Car
class Car extends Vehicle {
  Car(String fuelType, int maxSpeed) : super('Car', fuelType, maxSpeed);

  void honk() {
    print('Car horn: Beep beep!');
  }
}

// Subclass: Bike
class Bike extends Vehicle {
  Bike(String fuelType, int maxSpeed) : super('Bike', fuelType, maxSpeed);

  void ringBell() {
    print('Bike bell: Ring ring!');
  }
}

void main() {
  Car myCar = Car('Petrol', 220);
  Bike myBike = Bike('Electric', 80);

  print('\nCar Details:');
  myCar.displayDetails();
  myCar.honk();

  print('\nBike Details:');
  myBike.displayDetails();
  myBike.ringBell();
}
/*
Car Details:
Vehicle Type: Car
Fuel Type: Petrol
Max Speed: 220 km/h
Car horn: Beep beep!

Bike Details:
Vehicle Type: Bike
Fuel Type: Electric
Max Speed: 80 km/h
Bike bell: Ring ring!
 */