// donate_now_page.dart
import 'package:flutter/material.dart';

class DonateNowPage extends StatelessWidget {
  const DonateNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController =
        TextEditingController(text: "500");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate Now"),
        backgroundColor: Colors.orange.shade400,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and title
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.orange, size: 40),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Kindify",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "Donating to Help Feed Children",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),

            // Amount field
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: "₹ ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Payment methods
            const Text(
              "Pay with",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),

            _buildPaymentButton(Icons.account_balance_wallet, "UPI"),
            const SizedBox(height: 10),
            _buildPaymentButton(Icons.credit_card, "Credit Card"),
            const SizedBox(height: 10),
            _buildPaymentButton(Icons.credit_card_outlined, "Debit Card"),
            const SizedBox(height: 10),
            _buildPaymentButton(Icons.account_balance, "Net Banking"),

            const Spacer(),

            // Donate button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add your payment logic here
                },
                child: const Text(
                  "Donate Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentButton(IconData icon, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}