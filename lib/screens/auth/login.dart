import 'package:country_picker/country_picker.dart';
import 'package:farmer22for/screens/auth/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:geolocator/geolocator.dart';

import '../bottomsheet/BottomNavigation.dart';

class Login_screen extends StatefulWidget {
  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  bool loading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  Country country = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "In",
      e164Key: "");

  void isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationBarExample(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login_screen(),
          ));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                child: Image.asset('assets/images/phone.png'),
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Your Phone! ",
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "We will send you one time password \n \t \t \t \t \t \t \t on this number ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your Phone number',
                    suffixIcon: phoneNumberController.text.length > 9
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : SizedBox.shrink(),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                this.country = country;
                              });
                            },
                          );
                        },
                        child: CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IN',
                          favorite: ['+91', 'IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verficationId, int? resendtoken) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => otp_screen(
                                    verficationId: verficationId,
                                    phone: phoneNumberController.text.toString()),
                              )
                          );
                        },
                        codeAutoRetrievalTimeout: (String verficationId) {},
                        phoneNumber: '+' +
                            country.phoneCode.toString() +
                            phoneNumberController.text.toString());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent), // Set the background color
                  ),
                  child: Text('Get OTP' , style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
