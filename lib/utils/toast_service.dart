// // lib/services/toast_service.dart
// import 'package:flutter/material.dart';
// import 'package:toastification/toastification.dart';

// class ToastService {
//   static void show(BuildContext context, String message) {
//     toastification.show(
//       context: context,
//       title: Text(
//         message,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//       style: ToastificationStyle.flat, // always flat style
//       autoCloseDuration: const Duration(seconds: 3),
//       alignment: Alignment.topCenter, // toast at top
//       animationDuration: const Duration(milliseconds: 300),
//       backgroundColor: Colors.black87,
//       borderRadius: BorderRadius.circular(8),
//     );
//   }
// }


// lib/services/toast_service.dart
// import 'package:flutter/material.dart';
// import 'package:toastification/toastification.dart';

// class ToastService {
//   static void show(BuildContext context, String message) {
//     toastification.showCustom(
//       context: context,
//       autoCloseDuration: const Duration(seconds: 3),
//       alignment: Alignment.topCenter,
//       animationDuration: const Duration(milliseconds: 300),
//       builder: (context, holder) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFFF26A4B), Color(0xFFFFB74D)],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 6,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Text(
//             message,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



// lib/services/toast_service.dart
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  /// ✅ Success Toast (Orange Gradient like Verify Button)
  static void showSuccess(BuildContext context, String message) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 300),
      builder: (context, holder) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF26A4B), Color(0xFFFFB74D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  
  static void showError(BuildContext context, String message) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 300),
      builder: (context, holder) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFe53935), Color(0xFFb71c1c)], // red tones
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

