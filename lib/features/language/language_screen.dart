// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayyah_ride_customer/application.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/features/language/bloc/language_bloc.dart';
import 'package:ayyah_ride_customer/features/language/bloc/language_event.dart';
import 'package:ayyah_ride_customer/features/language/bloc/language_state.dart';
import 'package:ayyah_ride_customer/features/onboard/onboard_screen.dart';
import 'package:ayyah_ride_customer/widgets/language_button.dart';

class LanguageScreen extends StatelessWidget {
  static const String routeName = "/language";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child: Language(),
    );
  }
}

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  LanguageBloc languageBloc;

  @override
  void initState() {
    super.initState();
    print("Language(): init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Language(): didChangeDependencies");
    languageBloc = BlocProvider.of<LanguageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    print("Language(): build");

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocListener<LanguageBloc, LanguageState>(
          listener: (context, languageState) {
            if (languageState is GoToOnBoardState) {
              Navigator.of(context).pushReplacementNamed(
                OnBoardScreen.routeName,
              );
            }
          },
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              if (languageState is InitialLanguageState) {
                return _buildInitialState();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  _buildInitialState() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 145,
              ),
              Text(
                "Select Language",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: 32,
              ),
              LanguageButton(
                btnTxt: "English",
                isShowIcon: true,
                btnOnTap: () {
                  application.onLocaleChanged(Locale("en", "English"));
                  languageBloc.add(
                    SelectLanEvent("en", "English"),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              LanguageButton(
                btnTxt: "Hausa",
                btnOnTap: () {
                  application.onLocaleChanged(Locale("fr", "Hausa"));
                  languageBloc.add(SelectLanEvent("fr", "Hausa"));
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/cloud_shape_bg.png",
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
