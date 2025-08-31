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
  final _skillsController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
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
      errorBorder: const OutlineInputBorder(   // 🔹 when validation fails (not focused)
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
          /// 🔹 Custom Gradient Header
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
                  color: Colors.white, // ✅ White text
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          /// 🔹 Main Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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

                    // Skills
                    TextFormField(
                      controller: _skillsController,
                      decoration:
                          _inputDecoration("Your Skills / Area of Interest"),
                      validator: (value) => value!.isEmpty
                          ? "Please mention your skills"
                          : null,
                    ),
                    const SizedBox(height: 30),

                    /// 🔹 Submit Button with Gradient
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
                            color: Colors.white, // ✅ White text
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
