import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindify_app/utils/colors.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({super.key});

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topContainer(),
              _transactionCompletedTitle(),
              _rupeeReceiver(),
              _rupeePayer(),
              _transactionId(),
              _downloadReceipt(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomSection(),
    );
  }

  Widget _bottomSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thanks For Your Support",
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.6),
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.tag_faces_outlined,
                size: 14,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              "kindfy@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topContainer() {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final containerHeight = screenHeight * 0.295;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: containerHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryPink, AppColors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topRow(containerHeight),
          _paymentSuccessAndDateTime(containerHeight),
        ],
      ),
    );
  }

  Widget _topRow(double containerHeight) {
    final buttonTextSize = containerHeight * 0.07; // responsive text
    final iconSize = containerHeight * 0.08; // responsive icons

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, size: iconSize, color: Colors.white),
          ),
          Row(
            children: [
              _buildTopButton(
                "Share",
                Icons.share_outlined,
                containerHeight,
                buttonTextSize,
              ),
              const SizedBox(width: 6),
              _buildTopButton(
                "Help",
                Icons.help_outline,
                containerHeight,
                buttonTextSize,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopButton(
    String text,
    IconData icon,
    double containerHeight,
    double textSize,
  ) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.25,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: textSize, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: textSize),
          ),
        ],
      ),
    );
  }

  Widget _paymentSuccessAndDateTime(double containerHeight) {
    final amountSize = containerHeight * 0.18; // big responsive text
    final verifiedIconSize = containerHeight * 0.18;
    final statusSize = containerHeight * 0.1;
    final dateSize = containerHeight * 0.08;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "₹${amtConverter(10000)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: amountSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.verified, size: verifiedIconSize, color: Colors.white),
            ],
          ),
          Text(
            "Payment Successful",
            style: TextStyle(
              color: Colors.white,
              fontSize: statusSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "11 Sep, 2025 at 8:27PM",
            style: TextStyle(color: Colors.white, fontSize: dateSize),
          ),
        ],
      ),
    );
  }

  // Format amount in Indian Rupee style
  static String amtConverter(int? amt) =>
      NumberFormat.decimalPattern('en_IN').format(amt ?? 0);

  Widget _transactionCompletedTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primaryPink, AppColors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                "Transaction Completed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rupeeReceiver() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryPink,
                  AppColors.orange,
                ], // your gradient colors
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              // thickness of gradient border
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // inner background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          "To",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          "Dwarkadish Trust",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "78659552@kotak",
                            style: TextStyle(
                              color: Colors.black.withValues(alpha: 0.6),
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.25,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  // shadow color
                                  spreadRadius: 1,
                                  // how wide the shadow spreads
                                  blurRadius: 1,
                                  // softness of the shadow
                                  offset: const Offset(
                                    1,
                                    1,
                                  ), // x,y position of shadow
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryPink,
                                  AppColors.orange,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                softWrap: true,
                                "Pay Again",
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rupeePayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryPink,
                  AppColors.orange,
                ], // your gradient colors
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              // thickness of gradient border
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // inner background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          "From",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          "Devarsh Shah Gls",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "98659832@hdfc",
                            style: TextStyle(
                              color: Colors.black.withValues(alpha: 0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _transactionId() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryPink,
                  AppColors.orange,
                ], // your gradient colors
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              // thickness of gradient border
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // inner background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                      colors: [
                                        AppColors.primaryPink,
                                        AppColors.orange,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                child: Text(
                                  "Transaction ID",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "10051983201",
                                style: TextStyle(
                                  color: Colors.black.withValues(alpha: 0.6),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.copy_outlined,
                            size: 14,
                            color: Colors.black.withValues(alpha: 0.6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _downloadReceipt() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryPink,
                  AppColors.orange,
                ], // your gradient colors
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              // thickness of gradient border
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // inner background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.receipt_long,
                                  size: 16,
                                  color: Colors.black.withValues(alpha: 0.6),
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                      colors: [
                                        AppColors.primaryPink,
                                        AppColors.orange,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                child: Text(
                                  "Download Receipt",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.download,
                              size: 14,
                              color: Colors.black.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
