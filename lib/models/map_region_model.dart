import 'dart:convert';
import 'package:flutter/material.dart';

class MapData {
  final String countryName;
  final double width;
  final double height;
  final Map<String, String> geographicBoundaries;
  final List<MapRegionModel> regions;

  MapData({
    required this.countryName,
    required this.width,
    required this.height,
    required this.geographicBoundaries,
    required this.regions,
  });

  factory MapData.fromInstructions(String instructionsJson) {
    Map<String, dynamic> data = json.decode(instructionsJson);

    // Parse regions
    List<MapRegionModel> regions = [];
    if (data['i'] is List) {
      for (var region in data['i']) {
        regions.add(MapRegionModel.fromJson(region));
      }
    }

    // Parse geographic boundaries
    Map<String, String> boundaries = {};
    if (data['g'] is Map) {
      data['g'].forEach((key, value) {
        boundaries[key] = value.toString();
      });
    }

    return MapData(
      countryName: data['n'] ?? 'Unknown',
      width: (data['w'] ?? 0).toDouble(),
      height: (data['h'] ?? 0).toDouble(),
      geographicBoundaries: boundaries,
      regions: regions,
    );
  }
}

class MapRegionModel {
  final String name;
  final String id;
  Color? color;
  bool isSelected;
  double scale;

  MapRegionModel({
    required this.name,
    required this.id,
    this.color,
    this.isSelected = false,
    this.scale = 1.0,
  });

  factory MapRegionModel.fromJson(Map<String, dynamic> json) {
    return MapRegionModel(
      name: json['n'],
      id: json['u'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'color': color?.value,
      'isSelected': isSelected,
      'scale': scale,
    };
  }

  // Create a copy with updated values
  MapRegionModel copyWith({
    String? name,
    String? id,
    Color? color,
    bool? isSelected,
    double? scale,
  }) {
    return MapRegionModel(
      name: name ?? this.name,
      id: id ?? this.id,
      color: color ?? this.color,
      isSelected: isSelected ?? this.isSelected,
      scale: scale ?? this.scale,
    );
  }
}
