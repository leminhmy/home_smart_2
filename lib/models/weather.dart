import 'package:flutter/material.dart';


class WeatherModel{
  String name;
  String temp;
  IconData icon;

  WeatherModel({
    required this.name,
    required this.temp,
    required this.icon,
});


}

List<WeatherModel> demoWeather = [
  WeatherModel(name: "Temperature", temp: "29°C", icon: Icons.thermostat_outlined),
  WeatherModel(name: "Humidity", temp: "72%", icon: Icons.water_drop_outlined
  ),
  WeatherModel(name: "CO2", temp: "602 PPM", icon: Icons.co2),
];