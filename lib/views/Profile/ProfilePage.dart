import 'package:flutter/material.dart';
import 'package:kindify_app/utils/toast_service.dart';
import 'package:kindify_app/utils/tokenHelper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const _gradLeft = Color(0xFFF56A79);
  static const _gradRight = Color(0xFFFCB248);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  static Widget _outlinedAction(String text, VoidCallback onTap)  {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: Colors.black45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  // --- Sample data ---
  final String name = "Shailesh Prajapati";

  final String state = "Gujarat";

  final String role = "user";

  final String address =
      "opposite apple cinema,\nmaninagar, Ahmedabad, 380008";

  final int donateCount = 3;

  final int supporters = 10;

  final int supported = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ProfilePage._gradLeft, ProfilePage._gradRight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Top row: Avatar + name/state =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: ProfilePage._gradLeft,
                    child: Icon(Icons.person, color: Colors.white, size: 36),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ],
              ),

              // ===== Row: Role + Address (left) | Stats (right) =====
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left block: role + address
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          role,
                          style: const TextStyle(
                            color: ProfilePage._gradLeft,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Address",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          address,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right block: stats
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _stat(donateCount, "Donate"),
                        _stat(supporters, "Supporters"),
                        _stat(supported, "Supported"),
                      ],
                    ),
                  ),
                ],
              ),

              // ===== Buttons row =====
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(child: ProfilePage._outlinedAction("Edit", () {})),
                  const SizedBox(width: 10),
                  Expanded(child: ProfilePage._outlinedAction("Share", () {})),
                  const SizedBox(width: 10),
                  Expanded(child: ProfilePage._outlinedAction("Contact", () {})),
                ],
              ),

              // ===== Tabs row =====
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.picture_as_pdf, color: ProfilePage._gradLeft, size: 32),
                  Icon(Icons.check_box, color: Colors.black54, size: 32),
                  Icon(Icons.save, color: Colors.black54, size: 32),
                ],
              ),

              // ===== Grid =====
              const SizedBox(height: 18),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (_, __) => const Icon(
                  Icons.picture_as_pdf,
                  size: 56,
                  color: Color(0xFFE74C3C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widgets ---
  Widget _stat(int value, String label) {
    return Column(
      children: [
        _gradientNumber(value.toString()),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12.5)),
      ],
    );
  }

  Widget _gradientNumber(String text) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [ProfilePage._gradLeft, ProfilePage._gradRight],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white, // masked
        ),
      ),
    );
  }
}
