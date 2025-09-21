// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:upi_pay/upi_pay.dart';

// class UpiPayDemoPage extends StatefulWidget {
//   @override
//   _UpiPayDemoPageState createState() => _UpiPayDemoPageState();
// }

// class _UpiPayDemoPageState extends State<UpiPayDemoPage> {
//   final UpiPay _upiPay = UpiPay();
//   List<ApplicationMeta>? _apps;

//   @override
//   void initState() {
//     super.initState();
//     _fetchApps();
//   }

//   void _fetchApps() async {
//     _apps = await _upiPay.getInstalledUpiApps();
//     setState(() {});
//   }

//   void _startTransaction(ApplicationMeta appMeta) async {
//     final response = await _upiPay.initiateTransaction(
//       amount: '10.00',
//       app: appMeta.application,
//       receiverName: 'Receiver Name',
//       receiverUpiAddress: 'receiver@upi',
//       transactionRef: 'TXN${DateTime.now().millisecondsSinceEpoch}',
//       transactionNote: 'Test payment',
//     );
//     // handle response
//     print('Status: ${response.status}');
//     print('Response: ${response.rawResponse}');
//     // other fields: response.txnRef, etc.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('UPI Pay Demo')),
//       body: _apps == null
//         ? Center(child: CircularProgressIndicator())
//         : ListView.builder(
//             itemCount: _apps!.length,
//             itemBuilder: (context, idx) {
//               final app = _apps![idx];
//               return ListTile(
//                 leading: app.iconImage(40),
//                 title: Text(app.upiApplication.getAppName()),
//                 onTap: () => _startTransaction(app),
//               );
//             },
//           ),
//     );
//   }
// }

// extension on UpiPay {
//   Future<List<ApplicationMeta>?> getInstalledUpiApps() async {}
// }

// extension on ApplicationMeta {
//   get application =>null;
// }
