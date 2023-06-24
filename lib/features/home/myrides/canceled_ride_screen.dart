import 'package:flutter/material.dart';
import 'package:ayyah_ride_customer/widgets/upcoming_ride_itmelayout_widget.dart';

class CanceledRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CanceledRideScreen> {
  var arryLength = 1;
  List<String> rideTimes = [
    "Jul 2, 2023 8:25 AM",
  ];
  List<String> rideType = [
    "Ayyah Transport",
  ];
  List<String> pickUpAdd = [
    "38, Bills way",
  ];
  List<String> dropUpAdd = [
    "136, Ahmadu Bello Way, Kaduna",
  ];
  List<String> amount = ["₦ 4000", "₦ 6000", "₦ 10,000"];
  List<String> image = [
    "assets/mapiamge.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rideTimes.length,
      itemBuilder: (BuildContext context, int index) {
        return UpcomingRideItmeLayoutWidget(
          rideTime: rideTimes[index],
          rideName: rideType[index],
          droopupAddress: dropUpAdd[index],
          pickupAddress: pickUpAdd[index],
          rideAmount: amount[index],
          rideImage: image[index],
        );
      },
    );
  }
}
