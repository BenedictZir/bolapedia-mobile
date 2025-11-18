import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF2563EB); 
  static const blue100 = Color(0xFFDBEAFE); 
  static const blue700 = Color(0xFF1D4ED8);

  static const gray50  = Color(0xFFF9FAFB);
  static const gray200 = Color(0xFFE5E7EB);
  static const gray600 = Color(0xFF4B5563);
  static const gray800 = Color(0xFF1F2937);
  static const gray900 = Color(0xFF111827);

  static const inputBorder = Color(0xFFBCBCBC); 
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
      primary: AppColors.primary,
      surface: Colors.white,
      background: AppColors.gray50,
      onPrimary: Colors.white,
      onSurface: AppColors.gray900,
      onBackground: AppColors.gray900,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.gray50,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.gray200),
        ),
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: AppColors.blue100,
        labelStyle: TextStyle(
          color: AppColors.blue700,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.inputBorder, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.gray200, thickness: 1),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }  
}