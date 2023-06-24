import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/features/home/free_rides/free_rides_how_work_details_screen.dart';
import 'package:ayyah_ride_customer/widgets/border_button_widget.dart';
import 'package:ayyah_ride_customer/widgets/flat_button_widget.dart';
import 'package:share/share.dart';

import 'bloc/bloc.dart';

class freeRidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: freeRides(),
      create: (context) => freeRidesBloc(),
    );
  }
}

class freeRides extends StatefulWidget {
  @override
  _freeRidesState createState() => _freeRidesState();
}

class _freeRidesState extends State<freeRides> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/free_rides.png"),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Text(
              "Send your friends free rides",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Share the Vitt love and give friends free rides to try Vitt, worth up to ₦ 25 each!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kTextLoginfaceid,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: BorderButtonWidget(
                text: "How Invites Work",
                myOnTap: () {
                  Navigator.of(context)
                      .pushNamed(freeRidesHowWorkDetailsScreen.routeName);
                }),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              "Share your invite code",
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: kLoginBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: kShareCodeBg,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Share.share('melissa9913ue');
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.64,
                        child: Text(
                          "melissa9913ue",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: kLoginBlack,
                                fontSize: 15,
                              ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.90,
                        child: Icon(
                          Icons.share,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButtonWidget(
                    btnTxt: "Whatsapp",
                    btnColor: kAccentColor,
                    btnOnTap: () {},
                    height: 52,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }
}
