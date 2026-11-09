import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination;

  CruiseBookingViewModel({this.destination = CruiseDestination.rajangExpress})
      : _rating = destination.initialRating,
        _selectedPackage = destination.packages.first;

  int _rating;
  bool _isFavorited = false;
  DateTime _visitDate = DateTime(2026, 11, 15);
  String _selectedPackage;
  bool _isDarkMode = false;

  int get rating => _rating;
  bool get isFavorited => _isFavorited;
  DateTime get visitDate => _visitDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // 把日期格式化成 dd/MM/yyyy,例如 15/11/2026
  String get formattedDate {
    final d = _visitDate;
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  void toggleRating() {
    _isFavorited = !_isFavorited;
    _rating += _isFavorited ? 1 : -1;
    notifyListeners();
  }

  void setVisitDate(DateTime date) {
    _visitDate = date;
    notifyListeners();
  }

  void setPackage(String? value) {
    if (value == null) return;
    _selectedPackage = value;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}