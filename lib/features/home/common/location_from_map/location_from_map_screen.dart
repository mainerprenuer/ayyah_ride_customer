import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/common/viiticons_icons.dart';
import 'package:ayyah_ride_customer/widgets/square_add_location_textfield_widget.dart';
import 'package:ayyah_ride_customer/widgets/viit_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/bloc.dart';

/*class LocationfromMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

class LocationfromMapScreen extends StatelessWidget {
  static const String routeName = "locationfrommap";

  LocationfromMapScreenArguments arguments;

  LocationfromMapScreen({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LocationfromMap(arguments),
      create: (context) => LocationfromMapBloc(),
    );
  }
}

class LocationfromMap extends StatefulWidget {
  LocationfromMapScreenArguments arguments;

  LocationfromMap(this.arguments);

  @override
  _LocationfromMapState createState() => _LocationfromMapState();
}

class _LocationfromMapState extends State<LocationfromMap> {
  LocationfromMapBloc addAddressToMylistBloc;
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      10.314159, // Latitude of the location in Northern Nigeria
      9.838910,
    ),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    print("LocationfromMap() init");
    addAddressToMylistBloc = BlocProvider.of<LocationfromMapBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationfromMap() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationfromMap() dispose");
    addAddressToMylistBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget(
            widget.arguments.toolbarTitle,
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (CameraPosition cameraPosition) {
                print("Latitude: ${cameraPosition.target.latitude}");
                print("Latitude: ${cameraPosition.target.longitude}");
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(21),
                child: SquareAddLocationTextFieldWidget(
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    hintText: widget.arguments.hintText,
                    onChanged: (str) {
                      print("");
                    },
                    onFabTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Viiticons.location,
                size: 51,
                color: kAccentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationfromMapScreenArguments {
  final String toolbarTitle;
  final String hintText;

  LocationfromMapScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
