import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class ProfileScreen extends StatefulWidget {
  final String? name;
  final int? age;
  final String? phoneNumber;
  final String? location;

  ProfileScreen({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.location,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50,),
                Text("Profile", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((_) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login_screen(),
                        ));
                      }).catchError((error) {
                        // Handle sign out error
                        print("Sign out error: $error");
                      });
                    },
                    icon: Icon(Icons.logout),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/images10.png'),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Name'),
                subtitle: Text('Piyush sahu'),
                leading: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Age'),
                subtitle: Text('18'),
                leading: Icon(Icons.health_and_safety),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Phone Number'),
                subtitle: Text('8960995237'),
                leading: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                title: Text('Address'),
                subtitle: Text('Banda, MP, India'),
                leading: Icon(Icons.near_me),
              ),
            )
          ],
        ),
      ),
    );
  }
}
