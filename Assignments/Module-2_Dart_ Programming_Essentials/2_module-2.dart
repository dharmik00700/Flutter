import 'dart:io';

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

void main() {
  print("️Temperature Converter");
  print("1. Celsius to Fahrenheit");
  print("2. Fahrenheit to Celsius");

  stdout.write("Choose conversion type (1 or 2): ");
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    stdout.write("Enter temperature in Celsius: ");
    double? celsius = double.tryParse(stdin.readLineSync() ?? '');
    if (celsius == null) {
      print("Invalid input. Please enter a number.");
      return;
    }
    double fahrenheit = celsiusToFahrenheit(celsius);
    print("${celsius}°C is ${fahrenheit.toStringAsFixed(2)}°F");
  } else if (choice == '2') {
    stdout.write("Enter temperature in Fahrenheit: ");
    double? fahrenheit = double.tryParse(stdin.readLineSync() ?? '');
    if (fahrenheit == null) {
      print("Invalid input. Please enter a number.");
      return;
    }
    double celsius = fahrenheitToCelsius(fahrenheit);
    print("${fahrenheit}°F is ${celsius.toStringAsFixed(2)}°C");
  } else {
    print("Invalid choice. Please enter 1 or 2.");
  }
}

/*
️Temperature Converter
1. Celsius to Fahrenheit
2. Fahrenheit to Celsius
Choose conversion type (1 or 2): 1
Enter temperature in Celsius: 12
12.0°C is 53.60°F
 */
