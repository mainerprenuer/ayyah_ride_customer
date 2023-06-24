import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/widgets/viit_appbar.dart';

class freeRidesHowWorkDetailsScreen extends StatelessWidget {
  static const String routeName = "freerideshowworksdetails";

  @override
  Widget build(BuildContext context) {
    return freeRidesHowWorkDetails();
  }
}

class freeRidesHowWorkDetails extends StatefulWidget {
  @override
  _freeRidesHowWorkDetailsState createState() =>
      _freeRidesHowWorkDetailsState();
}

class _freeRidesHowWorkDetailsState extends State<freeRidesHowWorkDetails> {
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
          titleWidget: ViitTitleWidget("free Rides"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Text(
                  "How Invites Work",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 20,
                        color: kLoginBlack,
                      ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Every time a new Ayyah rider signs up with your invite code, they get  a free ride (amount varies by location).\n\nTheir free ride automatically applies to their  first ride. \n\nDiscounts apply automatically in your country and expire 60 days from their issue date.",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kTextLoginfaceid,
                        fontSize: 14,
                        letterSpacing: 1.3,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
