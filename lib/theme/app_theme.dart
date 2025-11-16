// import 'package:flutter/material.dart';

// class AppTheme {
//   // Tailwind-like palette
//   static const brandBlue = Color(0xFF2563EB); // blue-600
//   static const blue100 = Color(0xFFDBEAFE);
//   static const blue700 = Color(0xFF1D4ED8);

//   static const gray50  = Color(0xFFF9FAFB);
//   static const gray200 = Color(0xFFE5E7EB);
//   static const gray600 = Color(0xFF4B5563);
//   static const gray800 = Color(0xFF1F2937);
//   static const gray900 = Color(0xFF111827);

//   static const yellow100 = Color(0xFFFEF3C7);
//   static const yellow800 = Color(0xFF92400E);

//   static ThemeData get light {
//     final base = ThemeData.light(useMaterial3: false);
//     return base.copyWith(
//       scaffoldBackgroundColor: gray50,
//       primaryColor: brandBlue,
//       colorScheme: ColorScheme.fromSeed(seedColor: brandBlue).copyWith(
//         primary: brandBlue,
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: brandBlue,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: false,
//       ),
//       cardTheme: CardThemeData(
//         color: Colors.white,
//         elevation: 1.5,
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: const BorderSide(color: gray200),
//         ),
//       ),
//       chipTheme: const ChipThemeData(
//         backgroundColor: blue100,
//         labelStyle: TextStyle(
//           color: blue700,
//           fontWeight: FontWeight.bold,
//           fontSize: 12,
//         ),
//         shape: StadiumBorder(),
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: brandBlue,
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           elevation: 0,
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFFBCBCBC), width: 2),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: brandBlue, width: 2),
//           borderRadius: BorderRadius.circular(6),
//         ),
//       ),
//       dividerTheme: const DividerThemeData(color: gray200, thickness: 1),
//       snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
//     );
//   }
// }