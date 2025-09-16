import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/transaction/detail_transaction.dart';
import 'package:kindify_app/views/transaction/flip_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _topCards(),
                _transactionsTitleAndFilter(),
                _listOfTransactions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topCards() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // makes card square
              child: FlipCard(
                front: _buildFront(
                  "10",
                  Colors.blue,
                  "Given \nDonations",
                  numberSize: 30,
                ),
                back: _buildBack(Colors.deepOrange, Icons.favorite),
                interval: const Duration(seconds: 4),
              ),
            ),
          ),
          const SizedBox(width: 12), // spacing between cards
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: FlipCard(
                front: _buildFront(
                  "₹${amtConverter(10000)}",
                  Colors.blue,
                  "Amount \nDonated",
                  numberSize: 30,
                ),
                back: _buildBack(Colors.deepOrange, Icons.currency_rupee_rounded),
                interval: const Duration(seconds: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionsTitleAndFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Transactions",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                maxLines: 1, // number stays in one line
              ),
            ),
          ),
          Icon(Icons.filter_alt_sharp),
        ],
      ),
    );
  }

  Widget _listOfTransactions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.9,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _trustInfoCards(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailTransaction();
                                },
                              ),
                            );
                          },
                          "Dwarkadish Trust",
                          10000,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFront(
    String text,
    Color color,
    String msg, {
    double numberSize = 36, // default size for number
    double msgSize = 18, // default size for message
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// main number / amount
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: numberSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  maxLines: 1, // number stays in one line
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// description text
            Flexible(
              child: Text(
                msg,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: msgSize,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                // trims if too long
                maxLines: 2,
                // prevents extra spacing
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildBack(Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 6),
            color: Colors.black26,
          ),
        ],
      ),
      child: Center(child: Icon(icon, color: Colors.white, size: 60)),
    );
  }

  // Format amount in Indian Rupee style
  static String amtConverter(int? amt) =>
      NumberFormat.decimalPattern('en_IN').format(amt ?? 0);

  Widget _trustInfoCards(VoidCallback callFunc, String trustName, int subText) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
        vertical: MediaQuery.sizeOf(context).height * 0.015,
      ),
      child: InkWell(
        onTap: callFunc,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/03/28/Pictures/_982f2cde-7094-11ea-9530-7febd198d354.jpg",
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.50,
                          child: Text(
                            trustName,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [AppColors.primaryPink, AppColors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            "₹${amtConverter(subText)}",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Icon(
                  size: 18,
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white, // Needed so gradient is visible
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
