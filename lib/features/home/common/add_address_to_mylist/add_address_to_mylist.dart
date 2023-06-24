import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/common/viiticons_icons.dart';
import 'package:ayyah_ride_customer/features/home/common/add_address_to_mylist/bloc/add_address_to_mylist_bloc.dart';
import 'package:ayyah_ride_customer/features/home/common/location_from_map/location_from_map_screen.dart';
import 'package:ayyah_ride_customer/widgets/recent_address_item_list.dart';
import 'package:ayyah_ride_customer/widgets/square_add_location_textfield_widget.dart';
import 'package:ayyah_ride_customer/widgets/viit_appbar.dart';

class AddAddressToMylistScreen extends StatelessWidget {
  static const String routeName = "addaddresstomylist";
  AddAddressToMylistScreenArguments arguments;

  AddAddressToMylistScreen({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: AddAddressToMylist(arguments),
      create: (context) => AddAddressToMylistBloc(),
    );
  }
}

class AddAddressToMylist extends StatefulWidget {
  AddAddressToMylistScreenArguments arguments;

  AddAddressToMylist(
    this.arguments,
  );

  @override
  _AddAdressToMylistState createState() => _AddAdressToMylistState();
}

class _AddAdressToMylistState extends State<AddAddressToMylist> {
  AddAddressToMylistBloc addAddressToMylistBloc;
  List<IconData> favAddIcons = [
    Viiticons.history,
    Viiticons.history,
    Icons.star,
    Viiticons.history,
    Viiticons.history,
    Icons.location_on,
  ];
  List<String> favAddTitle = [
    "Zaira Bus Stop",
    "Kings Hotel",
    "Niger Bus Stop",
    "Dakingari",
    "Kalambaina",
    "Set location on map"
  ];
  List<String> favAddAddresses = [
    "25, Independence Avenue, Central Business District, Abuja",
    "",
    "38, Victoria Island, Lagos",
    "19, Kaduna Road, Kano",
    "21, Sultan Muhammadu Maccido Road, Sokoto",
    "15, Yobe Road, Damaturu",
    "50, 10, Borno Road, Maiduguri"
  ];

  @override
  void initState() {
    super.initState();
    print("AddAddressToMylist() init");
    addAddressToMylistBloc = BlocProvider.of<AddAddressToMylistBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AddAddressToMylist() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("AddAddressToMylist() dispose");
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
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: <Widget>[
              SquareAddLocationTextFieldWidget(
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  hintText: widget.arguments.hintText,
                  onChanged: (str) {
                    print("");
                  },
                  onFabTap: () {
                    Navigator.of(context).pop();
                    /*Navigator.of(context).pushNamed(
                    LocationfromMapScreen.routeName,
                    arguments: LocationfromMapScreenArguments(
                      toolbarTitle: widget.arguments.toolbarTitle,
                      hintText: widget.arguments.hintText,
                    ),
                  );*/
                  }),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favAddTitle.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (index == (favAddTitle.length - 1)) {
                        Navigator.of(context).pushNamed(
                          LocationfromMapScreen.routeName,
                          arguments: LocationfromMapScreenArguments(
                            toolbarTitle: "Add Work Address",
                            hintText: "Enter work address",
                          ),
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          RecentAddressItemList(
                            addressTitle: favAddTitle[index],
                            myIcon: favAddIcons[index],
                            address: favAddAddresses[index],
                            myBackgrounColor: kSettingFavAddAvtarBg,
                            myIconColor: kTextLoginfaceid,
                            isLastIndex: index == (favAddTitle.length - 1),
                          ),
                          index == (favAddTitle.length - 1)
                              ? SizedBox()
                              : Container(
                                  height: 0.5,
                                  margin: const EdgeInsets.only(
                                    top: 14,
                                    left: 46,
                                    right: 16,
                                  ),
                                  color: kGrey,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAddressToMylistScreenArguments {
  final String toolbarTitle;
  final String hintText;

  AddAddressToMylistScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
