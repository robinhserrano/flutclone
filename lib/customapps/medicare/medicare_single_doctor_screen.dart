import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/medicare/medicare_appointment_screen.dart';
import 'package:UIKit/customapps/medicare/models/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import 'medicare_single_chat_screen.dart';
import 'models/doctor.dart';

class MediCareSingleDoctorScreen extends StatefulWidget {
  final Doctor doctor;
  const MediCareSingleDoctorScreen(this.doctor);

  @override
  _MediCareSingleDoctorScreenState createState() =>
      _MediCareSingleDoctorScreenState();
}

class _MediCareSingleDoctorScreenState
    extends State<MediCareSingleDoctorScreen> {
  late Doctor doctor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctor = widget.doctor;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.medicarePrimary.withAlpha(80))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 44, 24, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FxContainer(
                    child: Icon(
                      Icons.chevron_left,
                      color: FxAppTheme.theme.colorScheme.onBackground
                          .withAlpha(160),
                      size: 24,
                    ),
                    paddingAll: 4,
                    borderRadiusAll: 8,
                  ),
                ),
                FxCard.rounded(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MediCareSingleChatScreen(Chat(doctor.image,doctor.name,'','','',false),),),);
                  },
                  child: Icon(
                    FeatherIcons.messageCircle,
                    color:
                        FxAppTheme.theme.colorScheme.onBackground.withAlpha(160),
                    size: 20,
                  ),
                  paddingAll: 8,

                ),
              ],
            ),
            FxSpacing.height(32),
            Row(
              children: [
                FxCard(
                  paddingAll: 0,
                  borderRadiusAll: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      fit: BoxFit.cover,
                      height: 160,
                      width: 120,
                      image: AssetImage(doctor.image),
                    ),
                  ),
                ),
                FxSpacing.width(24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.b1(
                        doctor.name,
                        fontWeight: 700,
                        fontSize: 18,
                      ),
                      FxSpacing.height(8),
                      FxText.b2(
                        doctor.category,
                        color: FxAppTheme.theme.colorScheme.onBackground,
                        xMuted: true,
                      ),
                      FxSpacing.height(12),
                      Row(
                        children: [
                          FxContainer(
                            child: Icon(
                              Icons.star_rounded,
                              color: AppTheme.customTheme.colorWarning,
                            ),
                            paddingAll: 8,
                          ),
                          FxSpacing.width(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.caption(
                                'Rating',
                                color: FxAppTheme.theme.colorScheme.onBackground,
                                xMuted: true,
                              ),
                              FxSpacing.height(2),
                              FxText.caption(
                                doctor.ratings.toString() + ' out of 5',
                                color: FxAppTheme.theme.colorScheme.onBackground,
                                fontWeight: 700,
                              ),
                            ],
                          ),
                        ],
                      ),
                      FxSpacing.height(8),
                      Row(
                        children: [
                          FxContainer(
                            child: Icon(
                              Icons.group,
                              color: AppTheme.customTheme.blue,
                            ),
                            paddingAll: 8,
                          ),
                          FxSpacing.width(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.caption(
                                'Patients',
                                color: FxAppTheme.theme.colorScheme.onBackground,
                                xMuted: true,
                              ),
                              FxSpacing.height(2),
                              FxText.caption(
                                doctor.patients.toString() + '+',
                                color: FxAppTheme.theme.colorScheme.onBackground,
                                fontWeight: 700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FxSpacing.height(32),
            FxContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.b1(
                    'Biography',
                    fontWeight: 600,
                  ),
                  FxSpacing.height(16),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: doctor.biography,
                          style: FxTextStyle.caption(
                            color: FxAppTheme.theme.colorScheme.onBackground,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: FxTextStyle.caption(
                          color: FxAppTheme.customTheme.blue,
                        ),
                      ),
                    ]),
                  ),
                  FxSpacing.height(24),
                  FxText.b1(
                    'Location',
                    fontWeight: 600,
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    paddingAll: 0,
                    borderRadiusAll: 16,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image(
                          fit: BoxFit.cover,
                          height: 140,
                          width: MediaQuery.of(context).size.width-96,
                          image: AssetImage('assets/other/map-md-snap.png'),),),),
                ],
              ),
              paddingAll: 24,
              borderRadiusAll: 16,
            ),
            FxSpacing.height(32),
            FxButton.block(
              elevation: 0,
              borderRadiusAll: 8,
              backgroundColor: AppTheme.customTheme.medicarePrimary,
              onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MediCareAppointmentScreen()));
            }, child: FxText.b1('Make Appointment',color:AppTheme.customTheme.medicareOnPrimary,fontWeight: 600,),),
          ],
        ),
      ),
    );
  }
}
