import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ayyah_ride_customer/common/my_colors.dart';
import 'package:ayyah_ride_customer/common/viiticons_icons.dart';


class PaymentMethodTypeWidget extends StatelessWidget {
  final String myLogo;
  final String myTitlel;
  final bool isIcon;
  final VoidCallback myOnTap;

  PaymentMethodTypeWidget({
    @required this.myLogo,
    @required this.myTitlel,
    @required this.myOnTap,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Card(
        elevation: 0,
        color: kSettingFavAddAvtarBg,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              isIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        Viiticons.payment,
                        size: 30,
                      ),
                    )
                  : Image.asset(
                      myLogo,
                      height: 35,
                      width: 35,
                    ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    myTitlel,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 17,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
