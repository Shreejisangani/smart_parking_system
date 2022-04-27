import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_parking/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class MarkerTap extends StatefulWidget {
  const MarkerTap({Key? key}) : super(key: key);

  @override
  State<MarkerTap> createState() => _MarkerTapState();
}

class _MarkerTapState extends State<MarkerTap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 600.0,
      left: 10.0,
      right: 10.0,
      child: GestureDetector(
        onTap: () {
          bottomSheet(context);
        },
        child: Container(
          height: 130.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20.0),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'D-mart, ChandKheda'
                      .text
                      .xl2
                      .color(Colors.black)
                      .make()
                      .pOnly(top: 20, left: 20.0),
                  'Chandkheda, Ahmedabad'
                      .text
                      .textStyle(TextStyle(fontSize: 12.0))
                      .color(const Color(0xFF919191))
                      .align(TextAlign.left)
                      .make()
                      .pOnly(left: 20.0, top: 5.0),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.car,
                        size: 19,
                      ).pOnly(left: 20.0, top: 5.0),
                      '15'
                          .text
                          .align(TextAlign.center)
                          .medium
                          .bold
                          .make()
                          .pOnly(left: 10.0, top: 6.0),
                      const Icon(CupertinoIcons.money_dollar)
                          .pOnly(left: 25.0, top: 5.0),
                      'free'
                          .text
                          .align(TextAlign.center)
                          .medium
                          .bold
                          .make()
                          .pOnly(left: 5.0, top: 6.0),
                    ],
                  ),
                ],
              ),
              Image.asset(
                'assets/car.png',
                scale: 8,
              ).pOnly(left: 0.0, top: 35)
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        // height: 500.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(246, 255, 255, 255),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25.0),
            topEnd: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 3.0,
              color: Color.fromARGB(255, 187, 187, 187),
              indent: 165.0,
              endIndent: 165.0,
            ),
            Container(
              height: 300.0,
              width: 300.0,
              margin: const EdgeInsets.only(top: 25.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: {
                    Marker(
                      markerId: MarkerId('_kGooglePlex'),
                      infoWindow: InfoWindow(title: 'D-Mart'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(23.101895385895173, 72.5937573122577),
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(23.101895385895173, 72.5937573122577),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            'D-mart, ChandKheda'
                .text
                .xl2
                .color(Colors.black)
                .make()
                .pOnly(top: 20, left: 20.0),
            'Chandkheda, Ahmedabad'
                .text
                .textStyle(TextStyle(fontSize: 12.0))
                .color(const Color(0xFF919191))
                .align(TextAlign.left)
                .make()
                .pOnly(left: 20.0, top: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.car,
                  size: 19,
                ).pOnly(top: 5.0),
                '15'
                    .text
                    .align(TextAlign.center)
                    .medium
                    .bold
                    .make()
                    .pOnly(left: 10.0, top: 6.0),
                const Icon(CupertinoIcons.money_dollar)
                    .pOnly(left: 25.0, top: 5.0),
                'free'
                    .text
                    .align(TextAlign.center)
                    .medium
                    .bold
                    .make()
                    .pOnly(left: 5.0, top: 6.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 140.0,
                  width: 150.0,
                  child: Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Colors.grey[400],
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.map_pin_ellipse).pOnly(top: 20.0),
                        'B1'.text.xl2.bold.make().pOnly(top: 5),
                        'Parking Place'
                            .text
                            .xl
                            .color(Colors.grey.shade500)
                            .make()
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140.0,
                  width: 150.0,
                  child: Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    // shadowColor: Colors.grey[400],
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.square_line_vertical_square_fill)
                            .pOnly(top: 20.0),
                        '1h 32m'.text.xl2.bold.make().pOnly(top: 5),
                        'Time'.text.xl.color(Colors.grey.shade500).make()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                'free'.text.xl3.make().pOnly(top: 10.0, bottom: 10.0),
                ElevatedButton(
                  onPressed: popUp,
                  child: 'Book Now'.text.make(),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 40.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 24.0),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 253, 220, 52),
                    ),
                  ),
                ).pOnly(top: 10.0, bottom: 20.0)
              ],
            )
          ],
        ),
      ),
    );
  }

  void popUp() {
    showDialog(
      context: context,
      builder: (context) => Container(
        // height: 700,
        // width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              height: 100,
              width: 80,
              child: Card(
                color: Color.fromARGB(255, 253, 220, 52),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: 'P'.text.xl6.make().centered(),
              ).pOnly(top: 20.0),
            ),
            'You Booked It!'.text.bold.xl5.make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Parking Slot'.text.xl.color(Colors.grey.shade500).make(),
                    'B1'.text.xl4.bold.make(),
                    'Parking Pass'.text.xl.color(Colors.grey.shade500).make(),
                    '531245'.text.xl4.bold.make(),
                    'Vehical'.text.xl.color(Colors.grey.shade500).make(),
                    'GJ01XXXXXX'.text.xl4.bold.make(),
                  ],
                ),
                Container(
                  height: 150.0,
                  width: 150.0,
                  child: Card(
                    child: Image.asset('assets/Qrcode.png'),
                  ),
                )
              ],
            ).pOnly(top: 20.0),
            Divider(
              indent: 50,
              endIndent: 50,
              color: Color.fromARGB(255, 199, 199, 199),
              thickness: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Enter After'.text.xl.color(Colors.grey.shade500).make(),
                    '10:00 AM'.text.xl4.bold.make(),
                    'Tue,17 Dec'.text.xl.color(Colors.grey.shade500).make(),
                  ],
                ),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 30.0,
                ),
                Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Exit Before'.text.xl.color(Colors.grey.shade500).make(),
                    '12:00 PM'.text.xl4.bold.make(),
                    'Tue,17 Dec'.text.xl.color(Colors.grey.shade500).make(),
                  ],
                ),
              ],
            ).pOnly(top: 10.0, bottom: 10.0),
            Divider(
              indent: 50,
              endIndent: 50,
              color: Color.fromARGB(255, 199, 199, 199),
              thickness: 1.0,
            ),
            'Address'.text.xl.color(Colors.grey.shade500).make(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                'Sangath Mall-2, Visat Petrol  '.text.xl.make(),
                'Pump, Nr Viswakarma Mandir,  '.text.xl.make(),
                'Chandkheda, Ahmedabad  '.text.xl.make(),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homepage);
              },
              child: 'Get Direction'.text.make(),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 24.0),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 253, 220, 52),
                ),
              ),
            ).pOnly(top: 30.0, bottom: 20.0)
          ],
        ),
      ),
    );
  }
}
