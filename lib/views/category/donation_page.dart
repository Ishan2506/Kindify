import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationScreen extends StatefulWidget {
  final String title; // e.g. "Clothes Distribution"
  final String subtitle; // e.g. "Number of Clothes"
  final List<Map<String, dynamic>> options;

  const DonationScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
  });

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  List<int> selectedIndexes = []; // Multiple selection
  int total = 0;
  DateTime? selectedDate;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  void toggleOption(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
      calculateTotal();
    });
  }

  void calculateTotal() {
    total = selectedIndexes.fold<int>(
      0,
      (sum, index) => sum + (widget.options[index]["value"] as int),
    );
  }

  Future<void> pickDate() async {
    DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat("dd-MM-yy").format(picked);
      });
    }
  }

  Widget optionItem(String title, int index) {
    bool isSelected = selectedIndexes.contains(index);
    return InkWell(
      onTap: () => toggleOption(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.deepOrangeAccent : Colors.orangeAccent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Icon(
              isSelected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.deepOrangeAccent : Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Donation Date with DatePicker
              SizedBox(height: 100,),
              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.event,
                        color: Colors.orangeAccent,
                      ),
                      labelText: "Donation Date",
                      hintText: "Select Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.orangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Subtitle
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.checkroom, color: Colors.orangeAccent),
                    const SizedBox(width: 8),
                    Text(widget.subtitle, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Options (Multi-Select)
              ...List.generate(
                widget.options.length,
                (index) => optionItem(widget.options[index]["label"], index),
              ),

              const SizedBox(height: 20),

              // Total Donation
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹ $total", style: const TextStyle(fontSize: 18)),
                    const Text("Donate Now"),
                  ],
                ),
              ),

              const Spacer(),

              // Donate Button
              InkWell(
                onTap: () {
                  // Handle Donate Action
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepOrangeAccent, Colors.orange],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Donate Now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
