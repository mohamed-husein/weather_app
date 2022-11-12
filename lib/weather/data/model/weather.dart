import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String description;
  final String main;
  final String icon;

  const Weather({
    required this.id,
    required this.description,
    required this.main,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      description: json['description'],
      main: json['main'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'idescriptiond':description,
      'main':main,
      'icon':icon,
      
    };
  }

  @override
  List<Object?> get props => [id, description, main, icon];
}
