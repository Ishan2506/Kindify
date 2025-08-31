// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';

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
//       // TODO: Send to DB using API call
//       print("Name: ${_nameController.text}");
//       print("Email: ${_emailController.text}");
//       print("Message: ${_messageController.text}");

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Your message has been sent!")),
//       );

//       _nameController.clear();
//       _emailController.clear();
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Contact with Us",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         //centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context); // goes back to previous screen (Home)
//           },
//         ),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [AppColors.primaryPink, AppColors.orange],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // App Logo
//                   Image.asset(
//                     "assets/images/kindifyLogo.png",
//                     height: 120,
//                   ),
//                   const SizedBox(height: 24),

//                   // Name field
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       labelText: "Name",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) =>
//                         value!.isEmpty ? "Please enter your name" : null,
//                   ),
//                   const SizedBox(height: 16),

//                   // Email field
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Email",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your email";
//                       } else if (!value.contains("@")) {
//                         return "Enter a valid email";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // Message textarea
//                   TextFormField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       labelText: "Message",
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 5,
//                     validator: (value) =>
//                         value!.isEmpty ? "Please enter your message" : null,
//                   ),
//                   const SizedBox(height: 20),

//                   // Submit Button with gradient
//                   Container(
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [AppColors.primaryPink, AppColors.orange],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: _submitForm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         "Send",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/widgets/custom_app_bar.dart';

class ContactWithUsPage extends StatefulWidget {
  @override
  _ContactWithUsPageState createState() => _ContactWithUsPageState();
}

class _ContactWithUsPageState extends State<ContactWithUsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Save to DB or API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your message has been sent!")),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryPink, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.orange, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(text: "Hiii"),
      body: Column(
        children: [
          /// 🔹 Custom Header (back + text)
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink,AppColors.orange],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.arrow_back, color: Colors.white),
              title: Text(
                "Contact With Us",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
          ),

          /// 🔹 Centered Body
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                            "assets/images/kindifyLogoTransparent.png", // make sure it's transparent PNG
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 12,),
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
                                color: Colors.white, // overridden by ShaderMask
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
                            } else if (!value.contains("@")) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Message
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _messageController,
                          maxLines: 5,
                          decoration: _inputDecoration("Message"),
                          validator: (value) => value!.isEmpty
                              ? "Please enter your message"
                              : null,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Button
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Send",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
    );
  }
}


