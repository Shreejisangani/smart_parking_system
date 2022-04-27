import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'HomeWidget/markerTap.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  final List<Marker> _marker = [
    Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'D-Mart'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(23.101895385895173, 72.5937573122577),
    ),
    Marker(
      markerId: MarkerId('_kLake'),
      infoWindow: InfoWindow(title: 'Croma'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(23.103828891044326, 72.59445199391834),
    ),
    Marker(
      markerId: MarkerId('_kLake1'),
      infoWindow: InfoWindow(title: 'Brand factory'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(23.10263000097888, 72.59475384225051),
      
    ),
  ];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.101895385895173, 72.5937573122577),
    zoom: 15,
  );
  static final CameraPosition _kLake1 = CameraPosition(
    target: LatLng(23.10263000097888, 72.59475384225051),
    zoom: 15,
  );

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(23.103828891044326, 72.59445199391834), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: Set.of(_marker),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          _menu(),
          _zoomButton(),
          const MarkerTap(),
          _searchBar()

          
        ],
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 12),
    ));
  }

Widget _searchBar(){
  return Positioned(
    top: 750,
    child: VxArc(
      
      height: 15,
      edge: VxEdge.TOP,
      arcType: VxArcType.CONVEY,
      child: Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Icon(Icons.search,size: 40,).pOnly(left: 20.0),
          TextField(decoration: InputDecoration(label: Text('Paeking Address',style: TextStyle(color: Colors.black),)),)
        ],
      ),
      ),
    ),);
}
  

  Widget _menu() {
    return Container(
      height: 56.0,
      width: 56.0,
      // color: const Color.fromARGB(255, 249, 249, 249),
      margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 249, 249, 249),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
    );
  }

  Widget _zoomButton() {
    return Positioned(
      top: 80,
      child: Container(
        height: 56.0,
        width: 56.0,
        // color: const Color.fromARGB(255, 249, 249, 249),
        margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(255, 249, 249, 249),
        ),
        child: IconButton(
          onPressed: _goToTheLake,
          icon: const Icon(Icons.location_searching),
          color: Colors.black,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(23.101895385895173, 72.5937573122577),
      zoom: 22,
    )));
  }
}

