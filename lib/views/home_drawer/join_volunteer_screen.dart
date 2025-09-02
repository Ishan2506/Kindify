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

//   String? _selectedDay;
//   bool _checkbox1 = false;
//   bool _checkbox2 = false;

//   final List<String> _days = [
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday",
//     "Sunday"
//   ];

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             "Thank you for joining on $_selectedDay!",
//           ),
//         ),
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
//           /// 🔹 Gradient Header (same as before)
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

//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     /// Logo + Title (same as before)
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

//                     /// Name
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: _inputDecoration("Full Name"),
//                       validator: (value) =>
//                           value!.isEmpty ? "Please enter your name" : null,
//                     ),
//                     const SizedBox(height: 20),

//                     /// Email
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
//                       value: _selectedDay,
//                       items: _days.map((day) {
//                         return DropdownMenuItem(
//                           value: day,
//                           child: Text(day),
//                         );
//                       }).toList(),
//                       decoration: _inputDecoration("Select a Day"),
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedDay = value;
//                           _checkbox1 = false;
//                           _checkbox2 = false;
//                         });
//                       },
//                       validator: (value) =>
//                           value == null ? "Please select a day" : null,
//                     ),

//                     /// 🔹 Show checkboxes only when day selected
//                     if (_selectedDay != null) ...[
//                       const SizedBox(height: 20),
//                       CheckboxListTile(
//                         value: _checkbox1,
//                         onChanged: (val) {
//                           setState(() => _checkbox1 = val!);
//                         },
//                         title: const Text("Morning"),
//                         activeColor: AppColors.primaryPink,
//                       ),
//                       CheckboxListTile(
//                         value: _checkbox2,
//                         onChanged: (val) {
//                           setState(() => _checkbox2 = val!);
//                         },
//                         title: const Text("Evening"),
//                         activeColor: AppColors.primaryPink,
//                       ),
//                     ],

//                     const SizedBox(height: 30),

//                     /// Submit Button
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

import 'package:flutter/material.dart';
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
  final FocusNode _checkboxFocusNode = FocusNode();
  //String? selectedDay = "Select a day"; 
  String? selectedDay;
  // default value
  bool option1 = false;
  bool option2 = false;

  final List<String> days = [
    "Select a day",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (selectedDay == "Select a day") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a day")),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Thank you for joining as a volunteer!")),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.primaryPink),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryPink),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const SizedBox(height: 50),

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
                    const SizedBox(height: 20),

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
                        } else if (!value.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    /// 🔹 Dropdown for Days
                    DropdownButtonFormField<String>(
                      value: selectedDay,
                      decoration: _inputDecoration("Select Day"),
                      items: days.map((day) {
                        return DropdownMenuItem(
                          value: day,
                          child: Text(day),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                          option1 = false;
                          option2 = false;
                        });
                      },
                      validator: (value) =>
                          value == null || value == "Select a day"
                              ? "Please select a day"
                              : null,
                    ),
                    const SizedBox(height: 20),

                    /// 🔹 Show Checkboxes only when a valid day is selected
                    if (selectedDay != null && selectedDay != "Select a day") ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            // Give focus when user taps anywhere inside container
                            _checkboxFocusNode.requestFocus();
                          },
                          child: Focus(
                            focusNode: _checkboxFocusNode,
                            child: InputDecorator(
                              isFocused: _checkboxFocusNode.hasFocus, // ✅ Pass focus state
                              decoration: _inputDecoration("Options"),
                              child: Column(
                                children: [
                                  CheckboxListTile(
                                    title: const Text("Morning"),
                                    value: option1,
                                    activeColor: AppColors.primaryPink,
                                    onChanged: (val) {
                                      setState(() => option1 = val ?? false);
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  CheckboxListTile(
                                    title: const Text("Evening"),
                                    value: option2,
                                    activeColor: AppColors.primaryPink,
                                    onChanged: (val) {
                                      setState(() => option2 = val ?? false);
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
    );
  }
}
