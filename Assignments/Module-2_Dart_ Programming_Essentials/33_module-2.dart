import 'package:intl/intl.dart';

void formatDateExample() {
  DateTime now = DateTime.now();

  // Default format
  String defaultFormat = DateFormat.yMMMMd().format(now);

  // Custom format
  String customFormat = DateFormat('EEEE, MMM d, yyyy').format(now);

  // Locale-specific format
  String frenchFormat = DateFormat.yMMMMd('fr_FR').format(now);

  print('Default: $defaultFormat');
  print('Custom: $customFormat');
  print('French: $frenchFormat');
}
/*
Default: August 16, 2025
Custom: Saturday, Aug 16, 2025
French: 16 août 2025
 */