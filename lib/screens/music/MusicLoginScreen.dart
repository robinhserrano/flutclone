/*
* File : Music Login
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/music/MusicFullApp.dart';
import 'package:UIKit/screens/music/MusicPasswordScreen.dart';
import 'package:UIKit/screens/music/MusicRegisterScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class MusicLoginScreen extends StatefulWidget {
  @override
  _MusicLoginScreenState createState() => _MusicLoginScreenState();
}

class _MusicLoginScreenState extends State<MusicLoginScreen> {
  late ThemeData themeData;

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.scaffoldBackgroundColor,
                body: Container(
                  padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!),
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Sign in",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24!),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "Email address",
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              prefixIcon: Icon(
                                MdiIcons.emailOutline,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: TextFormField(
                            obscureText: _passwordVisible,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: themeData.colorScheme.surface,
                                      width: 1.2)),
                              prefixIcon: Icon(
                                MdiIcons.lockOutline,
                                size: 22,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                child: Icon(
                                  _passwordVisible
                                      ? MdiIcons.eyeOutline
                                      : MdiIcons.eyeOffOutline,
                                  size: MySize.size22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MusicPasswordScreen()));
                            },
                            child: Text(
                              "Forgot Password ?",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24!),
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: Color(0xffe33239),
                                  child: InkWell(
                                    splashColor: Colors.white.withAlpha(100),
                                    highlightColor:
                                        themeData.colorScheme.primary,
                                    // inkwell color
                                    child: SizedBox(
                                        width: MySize.size36,
                                        height: MySize.size36,
                                        child: Icon(MdiIcons.google,
                                            color: Colors.white, size: MySize.size20)),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: ClipOval(
                                  child: Material(
                                    color: Color(0xff335994),
                                    child: InkWell(
                                      splashColor: Colors.white.withAlpha(100),
                                      highlightColor:
                                          themeData.colorScheme.primary,
                                      // inkwell color
                                      child: SizedBox(
                                          width: MySize.size36,
                                          height: MySize.size36,
                                          child: Center(
                                              child: Text(
                                            "F",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.headline6,
                                                color: Colors.white,
                                                letterSpacing: 0),
                                          ))),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ),
                              Spacing.width(32),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MusicFullApp()));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "NEXT",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            letterSpacing: 0.5),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: MySize.size16!),
                                        child: Icon(
                                          MdiIcons.chevronRight,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          size: MySize.size18,
                                        ),
                                      )
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MusicRegisterScreen()));
                              },
                              child: Text(
                                "I haven't an account",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}