// constants of string
// screen sizing

import '../imports/generalImport.dart';

// instantiate classes
ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

// primary swatch color map
final Map<int, Color> primarySwatchColor = {
  50: green.withOpacity(0.1),
  100: green.withOpacity(0.2),
  200: green.withOpacity(0.3),
  300: green.withOpacity(0.4),
  400: green.withOpacity(0.5),
  500: green.withOpacity(0.6),
  600: green.withOpacity(0.7),
  700: green.withOpacity(0.8),
  800: green.withOpacity(0.9),
  900: green.withOpacity(1.0),
};

// constant sizes
const double hPadding = 16;

// credit transaction list
const List<String> creditTransactionId = ['11', '14', '15', '16', '21'];
