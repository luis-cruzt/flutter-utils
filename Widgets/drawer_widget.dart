import 'dart:io' show Platform;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:microactions/functions/alert.dart';
import 'package:microactions/functions/global.dart';
import 'package:microactions/providers/tabs_provider.dart';
import 'package:microactions/utils/colors.dart';
import 'package:microactions/utils/internationalization.dart';
import 'package:microactions/utils/preferences.dart';
import 'package:provider/provider.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RomeRockDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  RomeRockDrawer({@required this.scaffoldKey});

  @override
  _RomeRockDrawerState createState() => _RomeRockDrawerState(scaffoldKey);
}

class AppsListModel {
  final String path;
  final String title;
  final String storeUrl;

  AppsListModel(
      {@required this.path, @required this.title, @required this.storeUrl})
      : assert(path != null && title != null);
}

class _RomeRockDrawerState extends State<RomeRockDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey;

  _RomeRockDrawerState(this.scaffoldKey);

  // Path to SVG
  final String assetPremium = 'assets/app/icon-premium.svg';

  final String assetQr = 'assets/app/icon-qr.svg';

  final String assetBiometric = 'assets/app/icon-biometric.svg';

  final prefs = new SharedPrefs();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: UtilsColors().primaryText,
    );
    final TextStyle subtitleStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: UtilsColors().primaryText,
    );
    // We create a widget for each svg
    final Widget premiumSvg = SvgPicture.asset(
      assetPremium,
      color: UtilsColors().primaryText,
      semanticsLabel: 'Remove ads and more!',
      height: 30,
      width: 30,
    );

    final Widget qrSvg = SvgPicture.asset(
      assetQr,
      color: UtilsColors().primaryText,
      semanticsLabel: 'More control',
    );

    final Widget biometricSvg = SvgPicture.asset(
      assetBiometric,
      color: UtilsColors().primaryText,
      semanticsLabel: 'Enable',
    );

    final tabsProvider = Provider.of<TabsProvider>(context);

    List<AppsListModel> appsList = [
      // Piggy Goals: Money Savings
      AppsListModel(
        path: 'assets/apps/icon_piggy.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE1'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.moneysavingpiggy&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1458428639',
      ),
      // Cryptocurrency Converter
      AppsListModel(
        path: 'assets/apps/icon_crypto.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE2'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.cryptocurrencyconverter&#38;utm_source=latestcomics&#38;utm_medium=share&#38;utm_campaign=app'
            : '1469760000',
      ),
      // 52 Weeks Money Saving Challenge
      AppsListModel(
        path: 'assets/apps/icon_52weeks.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE3'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.fiftytwoweekchallenge&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1422523462',
      ),
      // Sales Tax and Discount Calculator
      AppsListModel(
        path: 'assets/apps/icon_tax.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE4'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.salestaxdiscountcalculator&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1384309113',
      ),
      // Finance Simulator
      AppsListModel(
        path: 'assets/apps/icon_loan.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE5'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.loancalculator&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1403190089',
      ),
      // Quick Unit Converter
      AppsListModel(
        path: 'assets/apps/icon_quick.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE6'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.quickunitconverter&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1343845631',
      ),
      // Currency Converter
      AppsListModel(
        path: 'assets/apps/icon_currency.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE7'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.currencyconverter&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app'
            : '1360648699',
      ),
      // Tip Calculator and Bill Split
      AppsListModel(
        path: 'assets/apps/icon_tipcalculator.png',
        title: AppLocalizations.of(context).translate('DRAWER_APPS_TITLE8'),
        storeUrl: Platform.isAndroid
            ? 'com.romerock.apps.utilities.tipcalculator&#38;utm_source=moneylendingwizard&#38;utm_medium=menu&#38;utm_campaign=app'
            : '1190244008',
      ),
    ];

    // ScrollController _scrollcontroller =
    //     ScrollController(keepScrollOffset: true);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: ListView(
                children: <Widget>[
                  // 1st Section
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.person,
                              color: UtilsColors().primaryText,
                              size: 30,
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_PROFILE_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_PROFILE_LABEL'),
                                    maxLines: 1,
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      tabsProvider.changeTab = 3;
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: premiumSvg,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_PREMIUM_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_PREMIUM_LABEL'),
                                    maxLines: 1,
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: qrSvg,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_SCAN_QR_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_SCAN_QR_LABEL'),
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: biometricSvg,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_BIOMETRIC_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_BIOMETRIC_LABEL'),
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Switch(
                              value: prefs.biometricPasscode,
                              onChanged: (bool value) async {
                                bool result = await biometric();
                                setState(() {
                                  if (result) {
                                    if (prefs.biometricPasscode == true) {
                                      prefs.biometricPasscode = false;
                                    } else {
                                      prefs.biometricPasscode = true;
                                    }
                                  }
                                });
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 2nd Section
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 6),
                    child: AutoSizeText(
                      AppLocalizations.of(context)
                          .translate('DRAWER_HELPUS_TITLE'),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _showRateUs(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 6),
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('RATEUS_SHEET_BUTTON'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('RATEUS_DRAWER_LABEL'),
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context, 'feedback');
                      GlobalFunctions().showFeedBack(
                          scaffoldKey.currentState.context, scaffoldKey);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 6),
                      margin: EdgeInsets.only(top: 5, bottom: 15),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_FEEDBACK_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_FEEDBACK_LABEL'),
                                    maxLines: 2,
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pop();
                      _showShare(scaffoldKey.currentState.context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 6),
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)
                                          .translate('DRAWER_SHARE_TITLE'),
                                      maxLines: 1,
                                      style: titleStyle),
                                ),
                                AutoSizeText(
                                    AppLocalizations.of(context)
                                        .translate('DRAWER_SHARE_LABEL'),
                                    maxLines: 1,
                                    style: subtitleStyle)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 3rd Section
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 6),
                    child: AutoSizeText(
                      AppLocalizations.of(context)
                          .translate('DRAWER_TRYAPPS_TITLE'),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Column(
                        children: List.generate(appsList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          StoreRedirect.redirect(
                              androidAppId: appsList[index].storeUrl,
                              iOSAppId: appsList[index].storeUrl);
                        },
                        child: Container(
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(appsList[index].path),
                            ),
                            title: AutoSizeText(
                              appsList[index].title,
                              maxLines: 2,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: UtilsColors().primaryText,
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
                  )
                ],
              ),
            ),
          ),
          Container(
              height: 64.0,
              width: double.infinity,
              color: Color(0xfff3f3f3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.facebook.com/romerockapps/');
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/app/combined_shape.svg',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://twitter.com/RomeRock_Apps');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 45),
                      child: SvgPicture.asset(
                        'assets/app/icon_twitter.svg',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.instagram.com/romerock_apps/');
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/app/icon_instagram.svg',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  _launchURL(urlext) async {
    final url = urlext;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showAlertDialog(
          text: AppLocalizations.of(context).translate('ALERT_FAILED_TITLE'),
          message: AppLocalizations.of(context).translate('ALERT_FAILED_LABEL'),
          messageText:
              AppLocalizations.of(context).translate('ALERT_FAILED_LABEL'),
          context: context,
          scaffolKey: scaffoldKey,
          type: 'error');
    }
  }

  _showShare(BuildContext dcontext) {
    showModalBottomSheet(
        context: dcontext,
        isDismissible: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              SafeArea(
                bottom: true,
                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 30,
                          top: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          AppLocalizations.of(dcontext)
                              .translate('DRAWER_SHARE_LABEL'),
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              color: UtilsColors().primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 30, bottom: 30),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(dcontext)
                                .translate('SHARE_SHAREAPP_LABEL'),
                            style: TextStyle(
                                color: Theme.of(dcontext).accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          color: Color(0xff82c7fd),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(16),
                          ),
                          onPressed: () async {
                            await SocialSharePlugin.shareToTwitterLink(
                                text: '',
                                url: 'https://lendingwizard.page.link/qL6j');
                          },
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('SHARE_BUTTONTW_LABEL'),
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          elevation: 0,
                          color: Color(0xff6886c4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(16),
                          ),
                          onPressed: () async {
                            await SocialSharePlugin.shareToFeedFacebookLink(
                                url: 'https://lendingwizard.page.link/qL6j');
                          },
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('SHARE_BUTTONFB_LABEL'),
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: OutlineButton(
                          onPressed: () => Navigator.of(dcontext).pop(),
                          borderSide: BorderSide.none,
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('APP_CANCEL_LABEL'),
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(dcontext).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  _showRateUs(BuildContext dcontext) {
    double starRating;

    showModalBottomSheet(
        context: dcontext,
        isDismissible: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              SafeArea(
                bottom: true,
                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 30, right: 20, bottom: 30),
                          alignment: Alignment.center,
                          child: SmoothStarRating(
                            starCount: 5,
                            color: Theme.of(dcontext).primaryColor,
                            borderColor: Theme.of(dcontext).primaryColor,
                            spacing: 0.0,
                            allowHalfRating: false,
                            size: 40,
                            onRated: (v) => starRating = v,
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(right: 20, bottom: 10, left: 20),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('RATEUS_SHEET_TITLE'),
                            // AppLocalizations.of(dcontext)
                            //     .translate('RATEUS_DRAWER_LABEL'),
                            style: GoogleFonts.montserrat(
                                color: Theme.of(dcontext).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(right: 20, bottom: 30, left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(dcontext)
                                .translate('RATEUS_SHEET_LABEL'),
                            style: GoogleFonts.montserrat(
                                color: Theme.of(dcontext).accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: OutlineButton(
                          highlightElevation: 6,
                          textColor: Theme.of(dcontext).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(16)),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          onPressed: () async {
                            if (starRating < 4.0) {
                              Navigator.pop(dcontext);
                              GlobalFunctions()
                                  .showFeedBack(context, scaffoldKey);
                            } else {
                              StoreRedirect.redirect(
                                  androidAppId:
                                      'com.romerock.apps.utilities.moneylendingwizard&#38;utm_source=moneylendingwizard&#38;utm_medium=share&#38;utm_campaign=app',
                                  iOSAppId: '1502279789');
                            }
                          },
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('RATEUS_SHEET_BUTTON'),
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        child: OutlineButton(
                          onPressed: () => Navigator.of(dcontext).pop(),
                          borderSide: BorderSide.none,
                          child: AutoSizeText(
                            AppLocalizations.of(dcontext)
                                .translate('APP_MAYBELATER_LABEL'),
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(dcontext).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  Future<bool> biometric() async {
    LocalAuthentication localAuthentication = LocalAuthentication();
    bool didAuthenticate = false;
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    if (canCheckBiometrics) {
      didAuthenticate = await localAuthentication.authenticateWithBiometrics(
          localizedReason:
              AppLocalizations.of(context).translate('BIOMETRIC_ALERT_REASON'));
    }

    return didAuthenticate;
  }
}
