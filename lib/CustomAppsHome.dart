import 'package:UIKit/customapps/cookify/cookify_splash_screen.dart';
import 'package:UIKit/customapps/estate/views/estate_splash_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_splash_screen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'AppTheme.dart';
import 'AppThemeNotifier.dart';
import 'SingleGridItem.dart';
import 'customapps/grocery/grocery_full_app.dart';
import 'customapps/shopping/shopping_full_app.dart';

class CustomAppsHome extends StatefulWidget {
  @override
  _CustomAppsHomeState createState() => _CustomAppsHomeState();
}

class _CustomAppsHomeState extends State<CustomAppsHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return Container(
            padding: Spacing.fromLTRB(8, 0, 8, 12),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: Spacing.fromLTRB(4, 16, 4, 0),
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    children: <Widget>[
                      SinglePageItem(
                        iconData: Icons.home_work_outlined,
                        navigation: EstateSplashScreen(),
                        title: "Estate",
                      ),
                      SinglePageItem(
                        iconData: Icons.outdoor_grill_outlined,
                        navigation: CookifySplashScreen(),
                        title: "Cookify",
                      ),
                      SinglePageItem(
                        iconData: Icons.health_and_safety_outlined,
                        navigation: MediCareSplashScreen(),
                        title: "Medi Care",
                      ),
                      SinglePageItem(
                        //icon: './assets/icons/newspaper-outline.png',
                        iconData: MdiIcons.foodAppleOutline,
                        title: "Grocery",
                        navigation: GroceryFullApp(),
                      ),
                      SinglePageItem(
                        iconData: MdiIcons.shoppingOutline,
                        navigation: ShoppingFullApp(),
                        title: "Shopping",
                      ),
                    ]),
                Container(
                  margin: FxSpacing.y(24),
                  child: Center(
                    child: Text("More Apps are coming soon... ",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0.5,
                          fontWeight: 500,
                        )),
                  ),
                )
              ],
            ));
      },
    );
  }
}
