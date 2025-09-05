class DonationModel {
  double donationValue;
  double previousValue;
  final double minValue;
  final double maxValue;
  DateTime? selectedDate;

  DonationModel({
    this.donationValue = 100,
    this.previousValue = 100,
    this.minValue = 100,
    this.maxValue = 9000,
    this.selectedDate,
  });

  /// Update donation value while keeping previous value for animation
  void updateDonationValue(double newValue) {
    previousValue = donationValue;
    donationValue = newValue;
  }

  /// Set selected date
  void setDate(DateTime date) {
    selectedDate = date;
  }

  /// Reset model to default values
  void reset() {
    donationValue = minValue;
    previousValue = minValue;
    selectedDate = null;
  }
}
