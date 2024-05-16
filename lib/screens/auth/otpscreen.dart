import 'package:farmer22for/screens/auth/profile.dart';
import 'package:farmer22for/screens/auth/select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bottomsheet/BottomNavigation.dart';

class otp_screen extends StatelessWidget {
  String verficationId;
  String phone;
  otp_screen({required this.verficationId , required this.phone});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


                Container(
                  child: Image.asset('assets/images/images14.png'),
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Phone verfiication! ",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "We need to register your phone without \n \t \t \t \t \t \t \t \t getting started! ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),


          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: otpController,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: verficationId,
                          smsCode: '${otpController.text.toString()}');
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNavigationBarExample()));
                  });
                } catch (e) {

                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(phoneno: phone,),
                  ),
                );
              },
              child: Text('Submit', style: TextStyle(fontSize: 20, color: Colors.white),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent), // Set the background color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
