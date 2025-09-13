// lib/models/donation_category.dart
import 'package:flutter/material.dart';

class DonationOption {
  final String label;
  final int value;

  DonationOption({required this.label, required this.value});

  factory DonationOption.fromJson(Map<String, dynamic> json) {
    return DonationOption(
      label: json['label'] as String,
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "value": value,
    };
  }
}

class DonationCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<DonationOption> options;

  DonationCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.options,
  });

  factory DonationCategory.fromJson(Map<String, dynamic> json) {
    return DonationCategory(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      icon: json['icon'] as IconData, // ✅ Keep IconData directly
      options: (json['options'] as List)
          .map((e) => DonationOption.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subtitle": subtitle,
      "icon": icon,
      "options": options.map((e) => e.toJson()).toList(),
    };
  }
}
