// // import 'package:flutter/material.dart';
// // import 'package:kindify_app/utils/colors.dart';

// // class JoinVolunteerScreen extends StatefulWidget {
// //   const JoinVolunteerScreen({super.key});

// //   @override
// //   State<JoinVolunteerScreen> createState() => _JoinVolunteerScreenState();
// // }

// // class _JoinVolunteerScreenState extends State<JoinVolunteerScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();

// //   String? _selectedDay;
// //   bool _checkbox1 = false;
// //   bool _checkbox2 = false;

// //   final List<String> _days = [
// //     "Monday",
// //     "Tuesday",
// //     "Wednesday",
// //     "Thursday",
// //     "Friday",
// //     "Saturday",
// //     "Sunday"
// //   ];

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             "Thank you for joining on $_selectedDay!",
// //           ),
// //         ),
// //       );
// //     }
// //   }

// //   InputDecoration _inputDecoration(String label) {
// //     return InputDecoration(
// //       labelText: label,
// //       labelStyle: const TextStyle(color: AppColors.primaryPink),
// //       focusedBorder: const OutlineInputBorder(
// //         borderSide: BorderSide(color: AppColors.primaryPink),
// //       ),
// //       errorBorder: const OutlineInputBorder(
// //         borderSide: BorderSide(color: Colors.red, width: 2),
// //       ),
// //       enabledBorder: const OutlineInputBorder(
// //         borderSide: BorderSide(color: Colors.grey),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           /// 🔹 Gradient Header (same as before)
// //           Container(
// //             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
// //             decoration: const BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [AppColors.primaryPink, AppColors.orange],
// //                 begin: Alignment.centerLeft,
// //                 end: Alignment.centerRight,
// //               ),
// //             ),
// //             child: ListTile(
// //               leading: IconButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 icon: const Icon(Icons.arrow_back, color: Colors.white),
// //               ),
// //               title: const Text(
// //                 "Join as a Volunteer",
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),

// //           const SizedBox(height: 50),

// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.all(20),
// //               child: Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   children: [
// //                     /// Logo + Title (same as before)
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.asset(
// //                           "assets/images/kindifyLogoTransparent.png",
// //                           height: 60,
// //                           width: 60,
// //                           fit: BoxFit.contain,
// //                         ),
// //                         const SizedBox(width: 12),
// //                         ShaderMask(
// //                           shaderCallback: (bounds) =>
// //                               const LinearGradient(
// //                                 colors: [AppColors.primaryPink, AppColors.orange],
// //                                 begin: Alignment.centerLeft,
// //                                 end: Alignment.centerRight,
// //                               ).createShader(
// //                                 Rect.fromLTWH(0, 0, bounds.width, bounds.height),
// //                               ),
// //                           child: const Text(
// //                             "Kindify",
// //                             style: TextStyle(
// //                               fontSize: 32,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),

// //                     const SizedBox(height: 20),

// //                     /// Name
// //                     TextFormField(
// //                       controller: _nameController,
// //                       decoration: _inputDecoration("Full Name"),
// //                       validator: (value) =>
// //                           value!.isEmpty ? "Please enter your name" : null,
// //                     ),
// //                     const SizedBox(height: 20),

// //                     /// Email
// //                     TextFormField(
// //                       controller: _emailController,
// //                       decoration: _inputDecoration("Email"),
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return "Please enter your email";
// //                         } else if (!value.contains("@")) {
// //                           return "Enter a valid email";
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 20),

// //                     /// 🔹 Dropdown for Days
// //                     DropdownButtonFormField<String>(
// //                       value: _selectedDay,
// //                       items: _days.map((day) {
// //                         return DropdownMenuItem(
// //                           value: day,
// //                           child: Text(day),
// //                         );
// //                       }).toList(),
// //                       decoration: _inputDecoration("Select a Day"),
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _selectedDay = value;
// //                           _checkbox1 = false;
// //                           _checkbox2 = false;
// //                         });
// //                       },
// //                       validator: (value) =>
// //                           value == null ? "Please select a day" : null,
// //                     ),

// //                     /// 🔹 Show checkboxes only when day selected
// //                     if (_selectedDay != null) ...[
// //                       const SizedBox(height: 20),
// //                       CheckboxListTile(
// //                         value: _checkbox1,
// //                         onChanged: (val) {
// //                           setState(() => _checkbox1 = val!);
// //                         },
// //                         title: const Text("Morning"),
// //                         activeColor: AppColors.primaryPink,
// //                       ),
// //                       CheckboxListTile(
// //                         value: _checkbox2,
// //                         onChanged: (val) {
// //                           setState(() => _checkbox2 = val!);
// //                         },
// //                         title: const Text("Evening"),
// //                         activeColor: AppColors.primaryPink,
// //                       ),
// //                     ],

// //                     const SizedBox(height: 30),

// //                     /// Submit Button
// //                     Container(
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         gradient: const LinearGradient(
// //                           colors: [AppColors.primaryPink, AppColors.orange],
// //                           begin: Alignment.centerLeft,
// //                           end: Alignment.centerRight,
// //                         ),
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                       child: ElevatedButton(
// //                         onPressed: _submitForm,
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.transparent,
// //                           shadowColor: Colors.transparent,
// //                           padding: const EdgeInsets.symmetric(vertical: 14),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                         ),
// //                         child: const Text(
// //                           "Submit",
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';

// class JoinVolunteerScreen extends StatefulWidget {
//   const JoinVolunteerScreen({super.key});

//   @override
//   State<JoinVolunteerScreen> createState() => _JoinVolunteerScreenState();
// }

// class _JoinVolunteerScreenState extends State<JoinVolunteerScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final FocusNode _checkboxFocusNode = FocusNode();
//   //String? selectedDay = "Select a day"; 
//   String? selectedDay;
//   // default value
//   bool option1 = false;
//   bool option2 = false;

//   final List<String> days = [
//     "Select a day",
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday",
//     "Sunday",
//   ];

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       if (selectedDay == "Select a day") {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Please select a day")),
//         );
//         return;
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Thank you for joining as a volunteer!")),
//       );
//     }
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       labelStyle: const TextStyle(color: AppColors.primaryPink),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.primaryPink),
//       ),
//       errorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.red, width: 2),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           /// 🔹 Gradient Header
//           Container(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [AppColors.primaryPink, AppColors.orange],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: ListTile(
//               leading: IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(Icons.arrow_back, color: Colors.white),
//               ),
//               title: const Text(
//                 "Join as a Volunteer",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 50),

//           /// 🔹 Main Body
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     /// Logo & Title
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/images/kindifyLogoTransparent.png",
//                           height: 60,
//                           width: 60,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(width: 12),
//                         ShaderMask(
//                           shaderCallback: (bounds) =>
//                               const LinearGradient(
//                                 colors: [AppColors.primaryPink, AppColors.orange],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ).createShader(
//                                 Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                               ),
//                           child: const Text(
//                             "Kindify",
//                             style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),

//                     // Name
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: _inputDecoration("Full Name"),
//                       validator: (value) =>
//                           value!.isEmpty ? "Please enter your name" : null,
//                     ),
//                     const SizedBox(height: 20),

//                     // Email
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: _inputDecoration("Email"),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your email";
//                         } else if (!value.contains("@")) {
//                           return "Enter a valid email";
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     /// 🔹 Dropdown for Days
//                     DropdownButtonFormField<String>(
//                       value: selectedDay,
//                       decoration: _inputDecoration("Select Day"),
//                       items: days.map((day) {
//                         return DropdownMenuItem(
//                           value: day,
//                           child: Text(day),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedDay = value;
//                           option1 = false;
//                           option2 = false;
//                         });
//                       },
//                       validator: (value) =>
//                           value == null || value == "Select a day"
//                               ? "Please select a day"
//                               : null,
//                     ),
//                     const SizedBox(height: 20),

//                     /// 🔹 Show Checkboxes only when a valid day is selected
//                     if (selectedDay != null && selectedDay != "Select a day") ...[
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: GestureDetector(
//                           onTap: () {
//                             // Give focus when user taps anywhere inside container
//                             _checkboxFocusNode.requestFocus();
//                           },
//                           child: Focus(
//                             focusNode: _checkboxFocusNode,
//                             child: InputDecorator(
//                               isFocused: _checkboxFocusNode.hasFocus, // ✅ Pass focus state
//                               decoration: _inputDecoration("Options"),
//                               child: Column(
//                                 children: [
//                                   CheckboxListTile(
//                                     title: const Text("Morning"),
//                                     value: option1,
//                                     activeColor: AppColors.primaryPink,
//                                     onChanged: (val) {
//                                       setState(() => option1 = val ?? false);
//                                     },
//                                     controlAffinity: ListTileControlAffinity.leading,
//                                     contentPadding: EdgeInsets.zero,
//                                   ),
//                                   CheckboxListTile(
//                                     title: const Text("Evening"),
//                                     value: option2,
//                                     activeColor: AppColors.primaryPink,
//                                     onChanged: (val) {
//                                       setState(() => option2 = val ?? false);
//                                     },
//                                     controlAffinity: ListTileControlAffinity.leading,
//                                     contentPadding: EdgeInsets.zero,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],



//                     const SizedBox(height: 30),

//                     /// 🔹 Submit Button
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [AppColors.primaryPink, AppColors.orange],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: _submitForm,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           "Submit",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
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

class JoinVolunteerScreen extends StatefulWidget {
  const JoinVolunteerScreen({super.key});

  @override
  State<JoinVolunteerScreen> createState() => _JoinVolunteerScreenState();
}

class _JoinVolunteerScreenState extends State<JoinVolunteerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final ApiClientService _apiClient = ApiClientService();
  /// Dropdown + Checkbox states
  String? selectedTrust;
  String? selectedAvailability;
  bool optionMorning = false;
  bool optionEvening = false;
  Map<String, dynamic> selectedData = {
  'trust': null,
  'availabilities': {} // Key: availability name, Value: List of options
};

  Map<String, List<String>> selectedAvailabilitySlots = {};
    String? currentlySelectedAvailability = '';

  /// FocusNode for checkbox container (to trigger pink border when focused)
  final FocusNode _checkboxFocusNode = FocusNode();
   List<String> trusts = [];

  final List<String> availabilityOptions = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

    Future<void> _getTrustName() async {
    try{
      final response = await _apiClient.get("/auth/trust/all");
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState(() {
          trusts = (data["trusts"] as List)
                  .map((t) => t["trustName"].toString()).toList();
        });
      }
      else{
        ToastService.showError(context, "Somethings went wrong!");
      }

    }catch(e){
      ToastService.showError(context, "Error : ${e}");
    }
  }
  @override
  void initState() {
    super.initState();
    _getTrustName();
  }
//   void _updateOptionsList() {
//   List<String> options = [];
//   if (optionMorning) options.add("Morning");
//   if (optionEvening) options.add("Evening");

//   if (selectedAvailability != null) {
//     // Only save if options are selected
//     if (options.isNotEmpty) {
//       selectedData['availabilities'][selectedAvailability!] = options;
//     } else {
//       // If no option selected, remove that availability entry
//       selectedData['availabilities'].remove(selectedAvailability);
//     }
//   }
// }



Future<void> _submitForm() async {
  FocusScope.of(context).unfocus();
  if (_formKey.currentState!.validate()) {
    // Trust Validation
    if (selectedTrust == null) {
      ToastService.showError(context,"Please select a trust");
      return;
    }
    final body = {
      "fullName": _nameController.text.trim(),
      "email": _emailController.text.trim(),
      "trust": selectedTrust,
      "availability": selectedAvailabilitySlots
    };
    debugPrint(jsonEncode(body));
    try {
      final response = await _apiClient.post("/api/volunteer",body);
      final data = jsonDecode(response.body);
      debugPrint(response.statusCode.toString());
      debugPrint(data["message"]);
      if (response.statusCode == 200 || data["success"] == true) {
          ToastService.showSuccess(context,data["message"] ?? "Submitted successfully");

          // Reset form
          _formKey.currentState!.reset();
          _nameController.clear();
          _emailController.clear();
          setState(() {
            selectedTrust = null;
            selectedAvailability = "Select Availability";
            selectedAvailabilitySlots = {};
            currentlySelectedAvailability = null;
            optionMorning = false;
            optionEvening = false;
          });
        
      } else {
        ToastService.showError(context,"Something went wrong!");
      }
    } catch (e) {
      ToastService.showError(context,"Error: $e");
    }
  }
}
void _updateAvailabilitySlot() {
  List<String> options = [];
  if (optionMorning) options.add('Morning');
  if (optionEvening) options.add('Evening');

  final selectedAvailability = currentlySelectedAvailability;

  if (selectedAvailability != null && selectedAvailability.isNotEmpty) {
    if (options.isNotEmpty) {
      selectedAvailabilitySlots[selectedAvailability] = options;
    } else {
      selectedAvailabilitySlots.remove(selectedAvailability);
    }
  }
}



Widget _buildSelectedAvailabilityCard(String availability, List<String> options) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 4,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [AppColors.primaryPink.withOpacity(0.6), AppColors.orange.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  availability,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Options: ${options.join(", ")}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              setState(() {
                selectedData['availabilities'].remove(availability);
              });
            },
          ),
        ],
      ),
    ),
  );
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
            /// 🔹 Gradient Header
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                title: const Text(
                  "Join as a Volunteer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
      
            /// 🔹 Main Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// Logo & Title
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
                      const SizedBox(height: 45),
      
                      // Name
                      TextFormField(
                        controller: _nameController,
                        decoration: _inputDecoration("Full Name"),
                        validator: (value) =>
                            value!.isEmpty ? "Please enter your name" : null,
                      ),
                      const SizedBox(height: 20),
      
                      // Email
                      TextFormField(
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
                      const SizedBox(height: 20),
      
                      /// 🔹 Dropdown 1 → Trust

                      DropdownButtonFormField<String>(
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
                            selectedAvailability = null;
                            optionMorning = false;
                            optionEvening = false;

                            selectedData['trust'] = value;
                            selectedData['availabilities'] ??= {};
                          });
                        },

                        validator: (value) =>
                            value == null ? "Please select a Trust" : null,
                      ),

                      const SizedBox(height: 20),
                      if (selectedTrust != null &&
                          selectedTrust != "Select a Trust") ...[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select Availability",
                            style: TextStyle(color: AppColors.primaryPink),
                          ),
                        ),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: availabilityOptions.map((day) {
                            final isSelected = selectedAvailabilitySlots.containsKey(day);
                            final isCurrentlyEditing = currentlySelectedAvailability == day;

                            return Container(
                              constraints: BoxConstraints(
                                minWidth: 80,
                                maxWidth: MediaQuery.of(context).size.width * 0.3,  // Max 30% of screen width
                              ),
                              child: InputChip(
                                avatar: isSelected
                                    ? Icon(Icons.check_circle, color: AppColors.primaryPink)
                                    : null,
                                label: Text(
                                  day,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,  // Prevent text overflow
                                  style: TextStyle(
                                    fontWeight: isCurrentlyEditing ? FontWeight.bold : FontWeight.normal,
                                    color: isCurrentlyEditing ? AppColors.primaryPink : Colors.black,
                                  ),
                                ),
                                selected: isCurrentlyEditing,
                                selectedColor: AppColors.primaryPink.withOpacity(0.6),
                                onSelected: (selected) {
                                  setState(() {
                                    currentlySelectedAvailability = selected ? day : '';
                                    optionMorning = selectedAvailabilitySlots[currentlySelectedAvailability]?.contains('Morning') ?? false;
                                    optionEvening = selectedAvailabilitySlots[currentlySelectedAvailability]?.contains('Evening') ?? false;
                                  });
                                },
                                deleteIcon: Icon(Icons.close, size: 24, color: Colors.red),
                                onDeleted: () {
                                  setState(() {
                                    selectedAvailabilitySlots.remove(day);
                                    if (currentlySelectedAvailability == day) {
                                      currentlySelectedAvailability = '';
                                      optionMorning = false;
                                      optionEvening = false;
                                    }
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                      const SizedBox(height: 20),

                      if (currentlySelectedAvailability != null && currentlySelectedAvailability!.isNotEmpty)...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select Slot", style: TextStyle(color: AppColors.primaryPink)),

                            CheckboxListTile(
                              title: Text("Morning"),
                              value: optionMorning,
                              activeColor: AppColors.primaryPink,
                              onChanged: (val) {
                                setState(() {
                                  optionMorning = val ?? false;
                                  _updateAvailabilitySlot();
                                });
                              },
                            ),

                            CheckboxListTile(
                              title: Text("Evening"),
                              value: optionEvening,
                              activeColor: AppColors.primaryPink,
                              onChanged: (val) {
                                setState(() {
                                  optionEvening = val ?? false;
                                  _updateAvailabilitySlot();
                                });
                              },
                            ),
                          ],
                        ),
                      ],  

                        

                        // Display selected data below
                        const SizedBox(height: 20),

                        // ✅ PLACE Display Selected Data Cards HERE 👇
                        if (selectedData['availabilities'].isNotEmpty) ...[
                          const Text(
                            "Selected Availabilities",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          ...selectedData['availabilities'].entries.map((entry) {
                            return _buildSelectedAvailabilityCard(entry.key, List<String>.from(entry.value));
                          }).toList(),
                        ],
                      

      
                      const SizedBox(height: 30),
      
                      /// 🔹 Submit Button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryPink, AppColors.orange],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
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
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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

