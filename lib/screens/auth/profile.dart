import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

import '../../utlis/utlis.dart';
import '../bottomsheet/BottomNavigation.dart';
import 'database.dart';

class Profile extends StatefulWidget {
  String phoneno;
  Profile({required this.phoneno});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? selectedGender = '';

  String imageUrl = '';
  File? _image;
  final picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void selectImage() async {
    Uint8List imag = await pickImage(ImageSource.gallery);
    setState(() {
      _image = imag as File?;
    });
  }

  late String lat;
  late String long;
  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        LocationPermission ask = await Geolocator.requestPermission();
      } else {
        Position currentposition =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        log("Latitude: ${currentposition.latitude.toString()}");
        print("Longitude: ${currentposition.longitude.toString()}");
        setState(() {
          lat = currentposition.latitude.toString();
          long = currentposition.longitude.toString();
        });
      }
    } catch (e) {
      // Handle errors here
      print("Error getting location: $e");
    }
  }

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("no image ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 120.0),

              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_image!),
                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/images10.png'),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 50,
                      child: IconButton(
                        onPressed: getImageGallery,
                        icon: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text("Enter Your Name" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text("Enter Your Age" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
                ],
              ),
              SizedBox(height: 7,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text("Select your Gender" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Radio(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: 'Other',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              SizedBox(height: 20.0),
              // if (selectedGender == null || selectedGender!.isEmpty)
              //   Text(
              //     'Please select a gender',
              //     style: TextStyle(fontSize: 16.0, color: Colors.red),
              //   ),
              SizedBox(height: 4,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _getCurrentLocation();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent), // Set the background color
                  ),
                  child: Text("Use your Location" , style: TextStyle(fontSize: 17, color: Colors.white),),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          selectedGender != null &&
                          selectedGender!.isNotEmpty) {
                        // firebase_storage.Reference ref =
                        //     firebase_storage.FirebaseStorage.instance.ref('/foldername');
                        // firebase_storage.UploadTask uploadTask =
                        //     ref.putFile(_image!.absolute);
                        // await Future.value(uploadTask);
                        // var newUrl = ref.getDownloadURL();
                        Map<String, dynamic> employeeInfoMap = {
                          'name': nameController.text,
                          'age': ageController.text,
                          'gender': selectedGender,
                         ' lat' :lat,
                          'long': long,
                        };
                        await DatabaseMethods().addEmplyeeDeatils(employeeInfoMap, widget.phoneno).then((value) {
                          Fluttertoast.showToast(
                            msg: "Empolyee Details Added Successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigationBarExample()));
                      }
                    },
                    child: Text("Register" , style: TextStyle(fontSize: 20, color: Colors.white),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent), // Set the background color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
