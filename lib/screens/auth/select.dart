// import 'package:farmer22for/screens/auth/login.dart';
// import 'package:flutter/material.dart';
//
//
//
// class select_prof extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Radio Button with Image',
//       home: RadioImageExample(),
//     );
//   }
// }
//
// class RadioImageExample extends StatefulWidget {
//   @override
//   _RadioImageExampleState createState() => _RadioImageExampleState();
// }
//
// class _RadioImageExampleState extends State<RadioImageExample> {
//   String selectedFruit = 'Farmer';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//         Text('Select your profession'),
//       ),
//       body: Column(
//         children: [
//           RadioListTile<String>(
//             title: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/farmer.png',
//                   width: 150,
//                   height: 150,
//                 ),
//                 SizedBox(height: 10),
//                 Text('Farmer' ,style: TextStyle(fontSize: 30, color: Colors.black),),
//               ],
//             ),
//             value: 'farmer',
//             groupValue: selectedFruit,
//             onChanged: (value) {
//               setState(() {
//                 selectedFruit = 'farmer';
//               });
//             },
//           ),
//           SizedBox(height: 20),
//           RadioListTile<String>(
//             title: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/farmer.png',
//                   width: 150,
//                   height: 150,
//                 ),
//                 SizedBox(height: 10),
//                 Text('counsumer' ,style: TextStyle(fontSize: 30, color: Colors.black),),
//               ],
//             ),
//             value: 'consumer',
//             groupValue: selectedFruit,
//             onChanged: (value) {
//               setState(() {
//                 selectedFruit = 'consumer';
//               });
//             },
//           ),
//           SizedBox(height: 140,),
//
//           SizedBox(
//             width: MediaQuery.of(context).size.width*0.8,
//
//             child: ElevatedButton(onPressed: ()
//             {Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Login_screen()));
//
//             },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Define your desired background color here
//                 ),
//                 child:Text('Next' , style: TextStyle(fontSize: 20, color: Colors.white)))
//           ),
//         ],
//       ),
//     );
//   }
// }
