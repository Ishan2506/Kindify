import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindify_app/controller/request/requestController.dart';
import 'package:kindify_app/services/location_service.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/colors.dart';

class RequestPage extends StatefulWidget {
  RequestPage({super.key,required this.categoryName,required this.trustName});
  String? categoryName;
  String? trustName;


  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  RequestController requestController = RequestController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  List<String> states = [];
  String? selectedState;
  List<String> cities = [];
  String? selectedCity;
  @override
  void initState() {
    super.initState();
    _loadStatesAndCities();
    _loadUserId();
  }
  Future<void> _loadStatesAndCities() async {
    await LocationService.loadStateCityFile();
    setState(() {
      states = LocationService.getStates();
      // Initially, cities empty until state selected
      cities = [];
    });
  }
  Future<void> _loadUserId() async {
  Map<String, dynamic>? user = await TokenStorageService.getUser();

  if (user != null) {
      debugPrint(user['email'] as String? ?? '');
    setState(() {
      requestController.email.text = user['email'] as String? ?? ''; // prefill email field
    });
  }
}

  // Future<void> _loadStates() async {
  //   try {
  //     final responseStates = await LocationService.fetchStates();
  //     setState(() {
  //       states = responseStates;
  //     });
  //   } catch (e) {
  //     debugPrint("Error fetching states: $e");
  //   }
  // }

  // Future<void> _loadCities() async {
  //   try {
  //     cityStateMapping = await LocationService.fetchAllCitiesWithStates();
  //     cities = cityStateMapping.map((e) => e["city"]!).toList();
  //     setState(() {});
  //   } catch (e) {
  //     debugPrint("Error fetching cities: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    double fieldWidth = screenWidth * 0.9;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          children: [
            Container(
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
                  "Request for Distribution",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: SizedBox(
                  width: screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle("Category"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: screenWidth * 0.9,
                            child: TextFormField(
                              readOnly: true,
                              controller: requestController.categoryName,
                              decoration: _inputDecoration(widget.categoryName??''),
                            ),
                          ),
                        ),
                        _sizedBoxSpacing(),

                        /// Username, phone, email
                        _sectionTitle("Details"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: screenWidth * 0.9,
                            child: TextFormField(
                              readOnly: true,
                              controller: requestController.userName,
                              decoration: _inputDecoration(widget.trustName??''),
                            ),
                          ),
                        ),
                        _inputField(requestController.phone, "Phone", screenWidth),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: screenWidth * 0.9,
                            child: TextFormField(
                              readOnly: true,
                              controller: requestController.email,
                              decoration: _inputDecoration('E-mail'),
                            ),
                          ),
                        ),
                        //_inputField(requestController.email, "E-mail", screenWidth),

                        _sizedBoxSpacing(),

                        /// Address
                        _sectionTitle("Address"),
                        _inputField(requestController.streetName, "StreetName", screenWidth),
                        Row(
                          children: [
                            SizedBox(
                              width: fieldWidth * 0.44,
                              child: _dropdownField(
                                hint: "Select State",
                                //width: screenWidth * 0.47,
                                items: states,
                                selectedValue: selectedState,
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      selectedState = val;
                                      // Update city list based on selected state
                                      cities = LocationService.getCities(val);
                                      selectedCity = null; // reset selected city
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: fieldWidth * 0.44,
                              child: _dropdownField(
                                hint: "Select City",
                                //width: screenWidth * 0.47,
                                items: cities,
                                selectedValue: selectedCity,
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      selectedCity = val;
                                    });
                                  }
                                },
                              ),
                            ),
                            //_inputField(requestController.stateName, "City", screenWidth*0.485),
                            //const SizedBox(width: 10),
                            //_inputField(TextEditingController(text: selectedState ?? ""), "State", screenWidth*0.485),
                          ],
                        ),
                        _inputField(requestController.pinCode, "PinCode", screenWidth * 0.5),

                        _sizedBoxSpacing(),

                        /// Proof image upload
                        _sectionTitle("Proof Image"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: requestController.pickedFile == null
                              ? InkWell(
                            onTap: () async {
                              final error = await requestController.pickFile();
                              if (error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                              } else {
                                setState(() {});
                              }
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              dashPattern: const [8, 4],
                              color: Colors.blueGrey,
                              strokeWidth: 2,
                              child: Container(
                                width: screenWidth * 0.88,
                                height: screenHeight * 0.1,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.cloud_upload, color: Colors.blueGrey, size: 20),
                                    Text(
                                      "Upload File",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Supported file types: .jpg, .png, .jpeg, .pdf",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                              : Container(
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(1, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                                        colors: [AppColors.primaryPink, AppColors.orange],
                                      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                                      child: const Icon(Icons.check_circle_rounded, size: 24, color: Colors.white),
                                    ),
                                    const SizedBox(width: 8),
                                    ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                                        colors: [AppColors.primaryPink, AppColors.orange],
                                      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                                      child: const Text(
                                        "Uploaded Successfully!!",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    requestController.pickedFile = null;
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.cancel),
                                ),
                              ],
                            ),
                          ),
                        ),

                        _inputField(requestController.selectItem, "Select required item", screenWidth),
                       // _inputField(requestController.noOfItem, "No. of required item", screenWidth),
                        _inputField(requestController.msg, "Message", screenWidth,maxLines: 4),

                        _sendNowBtn(),
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

  Widget _sizedBoxSpacing() => const SizedBox(height: 12);

  Widget _dropdownField({
    required String hint,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        isExpanded: true, // fixes overflow
        value: items.contains(selectedValue) ? selectedValue : null,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              overflow: TextOverflow.ellipsis, // truncate long names
            ),
          );
        }).toList(),
        onChanged: items.isNotEmpty ? onChanged : null,
        disabledHint: const Text("No options"),
      ),
    );
  }



  Widget _inputField(
    TextEditingController controller,
    String hint,
    double width, {
    int maxLines = 1, // default single line
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: width * 0.9,
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: _inputDecoration(hint),
        ),
      ),
    );
  }


  Widget _sectionTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.primaryPink, AppColors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _sendNowBtn(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () async {
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: 50,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
          ),
          child: const Center(
            child: Text(
              "Send Now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: AppColors.blackColor.withValues(alpha: 0.8)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryPink, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
