import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:money_lending_wizard/services/internationalization.dart';
import 'package:money_lending_wizard/widgets/money_lending_font_icons.dart';

class BiometricPage extends StatefulWidget {
  @override
  _BiometricPageState createState() => _BiometricPageState();
}

class _BiometricPageState extends State<BiometricPage> {
  LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authenticate();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              right: -80,
              child: Icon(MoneyLendingFont.fingerprint,
                  size: 330, color: Color.fromRGBO(249, 249, 249, 1)),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Icon(
                      MoneyLendingFont.fingerprint,
                      size: 90,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  AutoSizeText(
                      AppLocalizations.of(context)
                          .translate('BIOMETRIC_AUTH_LABEL'),
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  authenticate() async {
    bool didAuthenticate = await localAuthentication.authenticateWithBiometrics(
        localizedReason:
            AppLocalizations.of(context).translate('BIOMETRIC_ALERT_REASON'));

    if (didAuthenticate) {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}
