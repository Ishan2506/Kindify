
// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';
// import 'package:kindify_app/widgets/custom_app_bar.dart';

// class ContactWithUsPage extends StatefulWidget {
//   @override
//   _ContactWithUsPageState createState() => _ContactWithUsPageState();
// }

// class _ContactWithUsPageState extends State<ContactWithUsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // TODO: Save to DB or API
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Your message has been sent!")),
//       );
//       _nameController.clear();
//       _emailController.clear();
//       _messageController.clear();
//     }
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: AppColors.primaryPink, width: 1.5),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: AppColors.orange, width: 2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: CustomAppBar(text: "Hiii"),
//       body: Column(
//         children: [
//           /// 🔹 Custom Header (back + text)
//           Container(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [AppColors.primaryPink,AppColors.orange],
//               ),
//             ),
//             child: ListTile(
//               leading: Icon(Icons.arrow_back, color: Colors.white),
//               title: Text(
//                 "Contact With Us",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.pop(context); // close drawer
//               },
//             ),
//           ),

//           /// 🔹 Centered Body
//           Expanded(
//             child: Center(
//               child: SingleChildScrollView(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Logo
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/images/kindifyLogoTransparent.png", // make sure it's transparent PNG
//                             height: 60,
//                             width: 60,
//                             fit: BoxFit.contain,
//                           ),
//                           const SizedBox(width: 12,),
//                           ShaderMask(
//                             shaderCallback: (bounds) =>
//                                 const LinearGradient(
//                                   colors: [AppColors.primaryPink, AppColors.orange],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight,
//                                 ).createShader(
//                                   Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                                 ),
//                             child: const Text(
//                               "Kindify",
//                               style: TextStyle(
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white, // overridden by ShaderMask
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       // Name
//                       SizedBox(
//                         width: 350,
//                         child: TextFormField(
//                           controller: _nameController,
//                           decoration: _inputDecoration("Name"),
//                           validator: (value) =>
//                               value!.isEmpty ? "Please enter your name" : null,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Email
//                       SizedBox(
//                         width: 350,
//                         child: TextFormField(
//                           controller: _emailController,
//                           decoration: _inputDecoration("Email"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter your email";
//                             } else if (!value.contains("@")) {
//                               return "Enter a valid email";
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Message
//                       SizedBox(
//                         width: 350,
//                         child: TextFormField(
//                           controller: _messageController,
//                           maxLines: 5,
//                           decoration: _inputDecoration("Message"),
//                           validator: (value) => value!.isEmpty
//                               ? "Please enter your message"
//                               : null,
//                         ),
//                       ),
//                       const SizedBox(height: 30),

//                       // Button
//                       SizedBox(
//                         width: 350,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [AppColors.primaryPink, AppColors.orange],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: _submitForm,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shadowColor: Colors.transparent,
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text(
//                               "Send",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kindify_app/services/api_client.dart';
import 'package:kindify_app/services/toast_service.dart';
import 'package:kindify_app/utils/colors.dart';

class ContactWithUsPage extends StatefulWidget {
  const ContactWithUsPage({super.key});

  @override
  State<ContactWithUsPage> createState() => _ContactWithUsPageState();
}

class _ContactWithUsPageState extends State<ContactWithUsPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final ApiClientService _apiClient = ApiClientService();
  /// 🔹 Trust dropdown
  String? selectedTrust;
  final List<String> trusts = [
    "Trust A",
    "Trust B",
    "Trust C",
    "Trust D",
  ];

  Future<void> _submitForm() async {
    FocusScope.of(context).unfocus();
  if (!_formKey.currentState!.validate()) return;


  if (selectedTrust == null) {
    ToastService.showError(context,"Please select a trust");
    return;
  }

  final body = {
    "name": _nameController.text.trim(),
    "email": _emailController.text.trim(),
    "trust": selectedTrust!,
    "message": _messageController.text.trim(),
  };

  try {
    final response = await _apiClient.post("/api/contact", body);
    final data = jsonDecode(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 || data["success"] == true) {
      ToastService.showSuccess(context,data["message"] ?? "Submitted successfully");

      // ✅ Reset form after success
      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      setState(() => selectedTrust = null);
    } else {
      ToastService.showSuccess(context,data["message"] ?? "Something went wrong");
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Server error. Please try again later."),
        backgroundColor: Colors.red,
      ),
    );
    ToastService.showError(context,"Error ${e}");
  }
}


InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: AppColors.primaryPink),

    // Normal enabled border
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),

    // Border when focused
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryPink, width: 2),
    ),

    // Border when there's an error
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),

    // Border when focused + error
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            /// 🔹 Custom Header (back + text)
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.arrow_back, color: Colors.white),
                title: const Text(
                  "Contact With Us",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
      
            /// 🔹 Centered Body
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/kindifyLogoTransparent.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 12),
                            ShaderMask(
                              shaderCallback: (bounds) =>
                                  const LinearGradient(
                                    colors: [AppColors.primaryPink, AppColors.orange],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(
                                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                  ),
                              child: const Text(
                                "Kindify",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
      
                        // Name
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: _inputDecoration("Name"),
                            validator: (value) =>
                                value!.isEmpty ? "Please enter your name" : null,
                          ),
                        ),
                        const SizedBox(height: 20),
      
                        // Email
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: _inputDecoration("Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }

                              // ✅ Regex for proper email validation
                              final emailRegex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (!emailRegex.hasMatch(value)) {
                                return "Enter a valid email address";
                              }

                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 20),
      
                        // 🔹 Trust Dropdown
                        SizedBox(
                          width: 350,
                          child: DropdownButtonFormField<String>(
                            value: selectedTrust,
                            decoration: _inputDecoration("Select Trust"),
                            items: trusts.map((trust) {
                              return DropdownMenuItem(
                                value: trust,
                                child: Text(trust),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedTrust = value;
                              });
                            },
                            validator: (value) =>
                                value == null ? "Please select a trust" : null,
                          ),
                        ),
                        const SizedBox(height: 20),
      
                        // Message
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: _messageController,
                            maxLines: 5,
                            decoration: _inputDecoration("Message").copyWith(alignLabelWithHint: true),
                            validator: (value) => value!.isEmpty
                                ? "Please enter your message"
                                : null,
                          ),
                        ),
                        const SizedBox(height: 30),
      
                        // Send Button
                        SizedBox(
                          width: 350,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.primaryPink, AppColors.orange],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Send",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


