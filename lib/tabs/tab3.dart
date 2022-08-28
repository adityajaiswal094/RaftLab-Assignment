import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // var location = 'No location';
  var latitude = '';
  var longitude = '';
  // var distance = '';

  List<String> greetings() {
    if (DateTime.now().hour < 12) {
      return ["Good Morning!!", "It's ${DateFormat().format(DateTime.now())}"];
    } else if (DateTime.now().hour < 18 && DateTime.now().hour >= 12) {
      return [
        "Good Afternoon!!",
        "It's ${DateFormat().format(DateTime.now())}"
      ];
    } else {
      return ["Good Evening!!", "It's ${DateFormat().format(DateTime.now())}"];
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final text = greetings();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text[0],
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                text[1],
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        //
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.center,
          child: Text(
            'Latitude: $latitude, Longitude: $longitude',
            style: const TextStyle(
              // color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Get Location
            Container(
              padding: const EdgeInsets.only(bottom: 12.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () async {
                  Position position = await _determinePosition();

                  setState(() {
                    latitude = '${position.latitude}';
                    longitude = '${position.longitude}';
                  });
                },
                child: const Text('Get Location'),
              ),
            ),

            // Check Internet Connection
            Container(
              padding: const EdgeInsets.only(bottom: 30.0, top: 12.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () async {
                  var hasInternet =
                      await InternetConnectionChecker().hasConnection;

                  final text =
                      hasInternet ? 'Internet Connected' : 'No Internet';

                  Fluttertoast.showToast(
                    msg: text,
                    backgroundColor: Colors.grey[600],
                  );
                  // Fluttertoast.cancel();
                },
                child: const Text('Check Connection'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
