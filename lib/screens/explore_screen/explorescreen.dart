

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMarkerScreen extends StatefulWidget {
  const CustomMarkerScreen({Key? key}) : super(key: key);

  @override
  _CustomMarkerScreenState createState() => _CustomMarkerScreenState();
}

class _CustomMarkerScreenState extends State<CustomMarkerScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  List<String> images = [ 'assets/images/images8.png' ,'assets/images/images8.png', 'assets/images/images8.png' , 'assets/images/man.png', 'assets/images/images8.png' , 'assets/images/images8.png' ,];

  Uint8List? markerImage;
  final List<Marker> _markers =  <Marker>[];
  final List<LatLng> _latLang =  <LatLng>[
  LatLng(25.292571, 80.569427),LatLng(25.290571, 80.599427) ,LatLng(25.298571, 80.569427),
    LatLng(25.290571, 80.569427),
    LatLng(25.200571, 80.569427), LatLng(25.290571, 80.469427),];
  // LatLng(25.290571, 80.569427),
  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(25.290571, 80.569427),
    zoom: 18,
  );


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{

    for(int i = 0 ; i < images.length ; i++){

      if(i==3){
        final Uint8List markerIcon = await getBytesFromAsset(
            images[i].toString(), 100);
        _markers.add(Marker(
            markerId: MarkerId(i.toString()),
            position: _latLang[i],
            icon: BitmapDescriptor.fromBytes(markerIcon),
            infoWindow: InfoWindow(
                title: 'Piyush sahu'
            )
        )
        );
      }
      else {
        final Uint8List markerIcon = await getBytesFromAsset(
            images[i].toString(), 100);
        _markers.add(Marker(
            markerId: MarkerId(i.toString()),
            position: _latLang[i],
            icon: BitmapDescriptor.fromBytes(markerIcon),
            infoWindow: InfoWindow(
                title: 'Farmer+${i}',
            )
        )
        );
      }
      setState(() {

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20.0),
              Text("Connect with your near by farmer" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.77,
            width: MediaQuery.of(context).size.width ,
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:custom_info_window/custom_info_window.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//   class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }
//
//   class _ExploreScreenState extends State<ExploreScreen> {
//   CustomInfoWindowController _customInfoWindowController =
//   CustomInfoWindowController();
//   final List<Marker> _markers = <Marker>[];
//   final List<LatLng> _latLang = [
//     LatLng(25.492249, 80.336151),
//     LatLng(33.6844, 73.0479),
//     LatLng(33.738045, 73.084488),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
//    loadData() {
//     for (int i = 0; i <_latLang.length; i++) {
//       _markers.add(
//         Marker(
//           markerId: MarkerId(i.toString()),
//           icon: BitmapDescriptor.defaultMarker,
//           position: _latLang[i],
//           onTap:(){
//             _customInfoWindowController.addInfoWindow!(
//               Text("Hello" ,style: TextStyle(fontSize:15),),
//               _latLang[i],
//             );
//           }
//         ),
//       );
//       setState(() {
//
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _latLang[0], // Set initial position to the first LatLng
//               zoom: 12,
//             ),
//             markers: Set<Marker>.of(_markers),
//             onTap: (postition){
//                      _customInfoWindowController.hideInfoWindow!();
//             },
//             onCameraMove: (position){
//               _customInfoWindowController.onCameraMove!();
//             }
//             ,
//             onMapCreated: (GoogleMapController controller) {
//               _customInfoWindowController.googleMapController = controller;
//             },
//           ),
//           CustomInfoWindow(
//             controller: _customInfoWindowController,
//             height: 150,
//             width: 150,
//             offset: 2,
//           ),
//         ],
//       ),
//     );
//   }
// }
//



// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});
//   static const LatLng  _pGooglePlex = LatLng(33.6844, 73.0479);
//
//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }
//
// class _ExploreScreenState extends State<ExploreScreen> {
//
//   Completer<GoogleMapController> _controller = Completer();
//
//   List<Marker> _marker =[];
//   final List<Marker> _List = [
//     Marker(
//       markerId: MarkerId("1"),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//           title: 'My current Location'
//       ),
//     ),
//     Marker(
//       markerId: MarkerId("2"),
//       position: LatLng(33.738045, 73.084488),
//       infoWindow: InfoWindow(
//           title: 'My current Location'
//       ),
//     ),
//     Marker(
//       markerId: MarkerId("1"),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//           title: 'My current Location'
//       ),
//     ),
//   ];
//
//   @override
//   void initState() {
//
//     super.initState();
//     _marker.addAll(_List);
//   }
//   Future<Position>  getUserCurrentLocation() async {
//     await Geolocator.requestPermission().then((value){
//
//     }).onError((error, stackTrace) {
//       print("error"+ error.toString());
//     });
//     return await Geolocator.getCurrentPosition();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GoogleMap(
//           initialCameraPosition: CameraPosition(target:ExploreScreen._pGooglePlex , zoom: 13),
//           markers: Set<Marker>.of(_marker),
//           mapType: MapType.normal,
//           onMapCreated: (GoogleMapController controller){
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.location_disabled_outlined),
//         onPressed: () async{
//           // GoogleMapController controller = await _controller.future;
//           // controller.animateCamera(CameraUpdate.newCameraPosition(
//           //     CameraPosition(target: LatLng(33.6844, 73.0479),)));
//           getUserCurrentLocation().then((value){
//             print(value.latitude.toString()+""+ value.longitude.toString());
//           });
//         },
//       ),
//     );
//   }
// }
