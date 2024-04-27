import 'dart:ffi';

class Restaurant {
  final String name;
  final double rating;
  final double miles_away;
  final Array category;

  Restaurant(
      {required this.name,
      required this.rating,
      required this.miles_away,
      required this.category});
}
