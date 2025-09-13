// lib/repositories/donation_repository.dart
import 'package:flutter/material.dart';
import 'package:kindify_app/model/donationcardModel.dart';
import '../model/donationcardModel.dart';

class DonationRepository {
  static List<DonationCategory> getCategories() {
    return [
      DonationCategory(
        title: "Food Distribution",
        subtitle: "Number of People",
        icon: Icons.restaurant,
        options: [
          DonationOption(label: "10 People", value: 1000),
          DonationOption(label: "20 People", value: 2000),
          DonationOption(label: "50 People", value: 5000),
          DonationOption(label: "100 People", value: 10000),
        ],
      ),
      DonationCategory(
        title: "Clothes Distribution",
        subtitle: "Number of Clothes",
        icon: Icons.checkroom,
        options: [
          DonationOption(label: "10 Clothes", value: 500),
          DonationOption(label: "20 Clothes", value: 1000),
          DonationOption(label: "50 Clothes", value: 2500),
        ],
      ),
    ];
  }
}
