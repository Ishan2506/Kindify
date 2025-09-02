
  // final List<Map<String, String>> posts = [
  //   {
  //     "name": "Annupurna food donation",
  //     "location": "Gujarat",
  //     "image": "https://picsum.photos/300/200",
  //   },
  //   {
  //     "name": "Maruti donation",
  //     "location": "Surat",
  //     "image": "https://picsum.photos/301/200",
  //   },
  // ];
  // List<Map<String, dynamic>> posts = [
  //   // {"name": "Annupurna food donation", "location": "Gujarat", "image": "https://picsum.photos/300/200", "isLiked": false, "likes": 120},
  //   // {"name": "Maruti donation", "location": "Surat", "image": "https://picsum.photos/301/200", "isLiked": false, "likes": 90},
  // ];

  // late Future<List<Post>> futurePosts;

  // @override
  // void initState() {
  //   super.initState();
  //   futurePosts = PostRepository().fetchPosts();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     drawer: CustomDrawer(),

  //     // 🔹 Gradient AppBar
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       flexibleSpace: Container(
  //         decoration: const BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [AppColors.primaryPink, AppColors.orange],
  //             begin: Alignment.centerLeft,
  //             end: Alignment.centerRight,
  //           ),
  //         ),
  //       ),
  //       title: Container(
  //         height: 42,
  //         child: TextField(
  //           decoration: InputDecoration(
  //             hintText: "Search",
  //             prefixIcon: Icon(Icons.search, color: Colors.grey, size: 26),
  //             filled: true,
  //             fillColor: Colors.white,
  //             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(30),
  //               borderSide: BorderSide.none,
  //             ),
  //           ),
  //         ),
  //       ),
  //       centerTitle: true,
  //       leading: Builder(
  //         builder: (context) => IconButton(
  //           icon: Icon(Icons.menu, color: Colors.white, size: 30),
  //           onPressed: () => Scaffold.of(context).openDrawer(),
  //         ),
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.notifications, color: Colors.white, size: 30),
  //           onPressed: () {},
  //         ),
  //       ],
  //     ),

  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           // 🔹 Carousel Slider
  //           Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 8.0),
  //             child: CarouselSlider(
  //               options: CarouselOptions(
  //                 height: 160,
  //                 autoPlay: true,
  //                 enlargeCenterPage: true,
  //               ),
  //               items: carouselImages.map((imgUrl) {
  //                 return ClipRRect(
  //                   borderRadius: BorderRadius.circular(12),
  //                   child: Image.network(
  //                     imgUrl,
  //                     fit: BoxFit.cover,
  //                     width: 1000,
  //                   ),
  //                 );
  //               }).toList(),
  //             ),
  //           ),

  //           FutureBuilder<List<Post>>(
  //             future: futurePosts,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return const Center(child: CircularProgressIndicator());
  //               } else if (snapshot.hasError) {
  //                 return Center(child: Text('Error: ${snapshot.error}'));
  //               }

  //               final posts = snapshot.data!;
  //               return ListView.separated(
  //                 padding: const EdgeInsets.all(16),
  //                 itemCount: posts.length,
  //                 separatorBuilder: (_, __) => const SizedBox(height: 16),
  //                 itemBuilder: (context, index) {
  //                   final post = posts[index];
  //                   return DonationCard(
  //                     title: post.name,
  //                     location: post.location,
  //                     imageAsset:
  //                         'https://kindify-backend.onrender.com${post.picture}',
  //                   );
  //                 },
  //               );
  //             },
  //           ),

  //           // 🔹 Posts List
  //           // ListView.builder(
  //           //   shrinkWrap: true,
  //           //   physics: NeverScrollableScrollPhysics(),
  //           //   itemCount: posts.length,
  //           //   itemBuilder: (context, index) {
  //           //     final post = posts[index];
  //           //     return Card(
  //           //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //           //       shape: RoundedRectangleBorder(
  //           //         borderRadius: BorderRadius.circular(16),
  //           //       ),
  //           //       elevation: 4,
  //           //       child: Column(
  //           //         crossAxisAlignment: CrossAxisAlignment.start,
  //           //         children: [
  //           //           // Trust Info
  //           //           ListTile(
  //           //             leading: CircleAvatar(
  //           //               backgroundImage: NetworkImage(
  //           //                 "https://picsum.photos/50",
  //           //               ),
  //           //             ),
  //           //             title: Text(
  //           //               post["name"]!,
  //           //               style: TextStyle(
  //           //                 fontWeight: FontWeight.bold,
  //           //                 fontSize: 16,
  //           //               ),
  //           //             ),
  //           //             subtitle: Text(post["location"]!),
  //           //             trailing: Text(
  //           //               "Support+",
  //           //               style: TextStyle(
  //           //                 color: Colors.red,
  //           //                 fontWeight: FontWeight.bold,
  //           //               ),
  //           //             ),
  //           //           ),

  //           //           // Post Image
  //           //           ClipRRect(
  //           //             borderRadius: BorderRadius.circular(16),
  //           //             child: Image.network(
  //           //               post["image"]!,
  //           //               fit: BoxFit.cover,
  //           //               width: double.infinity,
  //           //               height: 200,
  //           //             ),
  //           //           ),

  //           //           // Buttons
  //           //           Padding(
  //           //             padding: const EdgeInsets.all(12.0),
  //           //             child: Row(
  //           //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           //               children: [
  //           //                 Row(
  //           //                   children: [
  //           //                     IconButton(
  //           //                       icon: post["isLiked"]
  //           //                           ? const Icon(
  //           //                               Icons.favorite,
  //           //                               size: 30,
  //           //                               color: Colors.redAccent,
  //           //                             )
  //           //                           : const Icon(
  //           //                               Icons.favorite_border,
  //           //                               size: 30,
  //           //                               color: Colors.grey,
  //           //                             ),
  //           //                       onPressed: () {
  //           //                         setState(() {
  //           //                           post["isLiked"] = !post["isLiked"];
  //           //                           post["isLiked"]
  //           //                               ? post["likes"]++
  //           //                               : post["likes"]--;
  //           //                         });
  //           //                       },
  //           //                     ),
  //           //                     IconButton(
  //           //                       icon: Icon(
  //           //                         Icons.send,
  //           //                         size: 30,
  //           //                         color: Colors.grey[700],
  //           //                       ),
  //           //                       onPressed: () {},
  //           //                     ),
  //           //                   ],
  //           //                 ),
  //           //                 Padding(
  //           //                   padding: const EdgeInsets.only(left: 12.0),
  //           //                   child: Text(
  //           //                     "${post["likes"]}",
  //           //                     style: const TextStyle(
  //           //                       fontWeight: FontWeight.bold,
  //           //                       fontSize: 14,
  //           //                       //color: [AppColors.primaryPink,AppColors.orange]
  //           //                     ),
  //           //                   ),
  //           //                 ),
  //           //                 // 🔹 Gradient Donate Button
  //           //                 Container(
  //           //                   height: 40,
  //           //                   decoration: const BoxDecoration(
  //           //                     gradient: LinearGradient(
  //           //                       colors: [
  //           //                         AppColors.primaryPink,
  //           //                         AppColors.orange,
  //           //                       ],
  //           //                       begin: Alignment.centerLeft,
  //           //                       end: Alignment.centerRight,
  //           //                     ),
  //           //                     borderRadius: BorderRadius.all(
  //           //                       Radius.circular(20),
  //           //                     ),
  //           //                   ),
  //           //                   child: ElevatedButton(
  //           //                     style: ElevatedButton.styleFrom(
  //           //                       backgroundColor: Colors.transparent,
  //           //                       shadowColor: Colors.transparent,
  //           //                       shape: RoundedRectangleBorder(
  //           //                         borderRadius: BorderRadius.circular(20),
  //           //                       ),
  //           //                     ),
  //           //                     onPressed: () {},
  //           //                     child: const Text(
  //           //                       "Donate Now",
  //           //                       style: TextStyle(
  //           //                         fontSize: 16,
  //           //                         fontWeight: FontWeight.bold,
  //           //                         color: Colors.white,
  //           //                       ),
  //           //                     ),
  //           //                   ),
  //           //                 ),
  //           //               ],
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //     );
  //           //   },
  //           // ),
  //         ],
  //       ),
  //     ),




   // 🔹 Carousel Slider
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 8.0),
            //     child: CarouselSlider(
            //       options: CarouselOptions(
            //         height: 160,
            //         autoPlay: true,
            //         enlargeCenterPage: true,
            //       ),
            //       items: carouselImages.map((imgUrl) {
            //         return ClipRRect(
            //           borderRadius: BorderRadius.circular(12),
            //           child: Image.network(
            //             imgUrl,
            //             fit: BoxFit.cover,
            //             width: 1000,
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),


            

// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';
// import 'package:kindify_app/views/home/PostService.dart';
// import 'package:kindify_app/views/home/post.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:kindify_app/views/home/post_repository.dart';

// class HomeScreens extends StatefulWidget {
//   const HomeScreens({super.key});

//   @override
//   State<HomeScreens> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreens> {
//   final PostService _postService = PostService();
//   late Future<List<Post>> _futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     _futurePosts = _postService.fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.black, size: 28),
//           onPressed: () {},
//         ),
//         title: Container(
//           height: 40,
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: const TextField(
//             decoration: InputDecoration(
//               hintText: "Search",
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(vertical: 8),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black, size: 28),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 🔹 Carousel (dummy imgs for now)
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 height: 150,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//               ),
//               items: [
//                 "https://placekitten.com/400/200",
//                 "https://placebear.com/400/200",
//                 "https://picsum.photos/400/200",
//               ].map((url) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(url, fit: BoxFit.cover, width: 1000),
//                 );
//               }).toList(),
//             ),
//           ),

//           // 🔹 Posts from API
//           Expanded(
//             child: FutureBuilder<List<Post>>(
//               future: _futurePosts,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text("No posts found"));
//                 }

//                 final posts = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (context, index) {
//                     final post = posts[index];
//                     return _buildPostCard(post);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // 🔹 Bottom Nav Bar
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [AppColors.primaryPink, AppColors.orange],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white70,
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.payment, size: 28), label: "Payments"),
//             BottomNavigationBarItem(icon: Icon(Icons.person, size: 28), label: "Profile"),
//             BottomNavigationBarItem(icon: Icon(Icons.more_horiz, size: 28), label: "More"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPostCard(Post post) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage("assets/images/logo.png"), // Trust logo
//             ),
//             title: Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text(post.location),
//             trailing: Text("Support+", style: TextStyle(color: Colors.red[400])),
//           ),
//           if (post.picture.isNotEmpty)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 "https://kindify-backend.onrender.com${post.picture}",
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 200,
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
//                 IconButton(icon: const Icon(Icons.send), onPressed: () {}),
//                 const Spacer(),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryPink,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   onPressed: () {},
//                   child: const Text("Donate Now"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class OtpVerificationScreen extends StatefulWidget {
//   final String phoneNumber;

//   const OtpVerificationScreen({Key? key, required this.phoneNumber})
//       : super(key: key);

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   String sessionId = ''; // Will be used with 2Factor API
//   String enteredOtp = '';

//   @override
//   void initState() {
//     super.initState();
//     sendOtp(); // Auto send OTP on screen load
//   }

//   Future<void> sendOtp() async {
//     // TODO: Replace with your 2Factor API Key and template ID
//     const apiKey = "YOUR_API_KEY";
//     final phone = widget.phoneNumber;

//     final url =
//         'https://2factor.in/API/V1/$apiKey/SMS/$phone/AUTOGEN'; // AUTOGEN uses your approved template

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final responseBody = response.body;
//       print("OTP Sent: $responseBody");

//       final sid = RegExp(r'"Details":"(.+?)"').firstMatch(responseBody)?.group(1);
//       if (sid != null) {
//         setState(() => sessionId = sid);
//         Fluttertoast.showToast(msg: "OTP sent to $phone");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Failed to send OTP");
//     }
//   }

//   Future<void> verifyOtp() async {
//     if (enteredOtp.length != 6 || sessionId.isEmpty) {
//       Fluttertoast.showToast(msg: "Enter complete OTP");
//       return;
//     }

//     final verifyUrl =
//         'https://2factor.in/API/V1/YOUR_API_KEY/SMS/VERIFY/$sessionId/$enteredOtp';

//     final response = await http.get(Uri.parse(verifyUrl));

//     if (response.statusCode == 200) {
//       final body = response.body;
//       print("OTP Verify: $body");

//       if (body.contains('"Status":"Success"')) {
//         Fluttertoast.showToast(msg: "OTP Verified ✅");
//         // TODO: Navigate to home/dashboard
//       } else {
//         Fluttertoast.showToast(msg: "OTP Verification Failed ❌");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Error verifying OTP");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OTP Verification"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             Text(
//               "Enter the OTP sent to ${widget.phoneNumber}",
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//             OtpTextField(
//               numberOfFields: 6,
//               borderColor: const Color(0xFF512DA8),
//               showFieldAsBox: true,
//               onCodeChanged: (String code) {},
//               onSubmit: (String otp) {
//                 setState(() => enteredOtp = otp);
//               },
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: verifyOtp,
//               child: const Text("Verify OTP"),
//             ),
//             const SizedBox(height: 16),
//             TextButton(
//               onPressed: sendOtp,
//               child: const Text("Resend OTP"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



// ignore_for_file: use_build_context_synchronously
