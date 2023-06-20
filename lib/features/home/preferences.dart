import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/colors.dart';
import 'package:tek_capsule/core/themes/theme_cubit.dart';

class BlueContainerContent {
  final IconData icon;
  final String? title;
  final String? subtitle;

  BlueContainerContent(this.icon, this.title, this.subtitle);
}

class WhiteContainerContent {
  final IconData icon;
  final String? title;
  final String? subtitle;

  WhiteContainerContent(this.icon, this.title, this.subtitle);
}

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

bool notifications = false;

class _PreferencesState extends State<Preferences> {
  late ThemeCubit _themeCubit;
  bool _theme = false;

  @override
  void initState() {
    super.initState();
    getTheme();
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  getTheme() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if (isDark == null)
      setState(() {
        _theme = false;
      });
    else if (isDark)
      setState(() {
        _theme = false;
      });
    else
      setState(() {
        _theme = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<BlueContainerContent> _blueContainerContent = [
      BlueContainerContent(
          Icons.nightlight_round,
          getTranslationOf('night_mode'),
          getTranslationOf('better_reading_experience')),
      BlueContainerContent(Icons.public, getTranslationOf('language'),
          getTranslationOf('select_preferred_language')),
      BlueContainerContent(
          Icons.notifications,
          getTranslationOf('notifications'),
          getTranslationOf('get_notifications')),
    ];
    List<WhiteContainerContent> _whiteContainerContent = [
      WhiteContainerContent(Icons.verified_user, getTranslationOf('about_us'),
          getTranslationOf('know_our_story')),
      WhiteContainerContent(
          Icons.event_note_sharp,
          getTranslationOf('privacy_policy'),
          getTranslationOf('know_our_privacy_policies')),
      WhiteContainerContent(Icons.mail, getTranslationOf('support'),
          getTranslationOf('connect_us')),
      WhiteContainerContent(Icons.live_help_sharp, getTranslationOf('faqs'),
          getTranslationOf('get_your_answers')),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.myProfile);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Linjith Kunnon',
                      style: theme.textTheme.headline6,
                    ),
                    Text(
                      getTranslationOf('my_profile')!,
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              end: 28,
              top: 8,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfile);
                },
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(50),
                  child: FadedScaleAnimation(
                    CircleAvatar(
                      child:  Icon(
                      Icons.person_add_alt_rounded,
                      color: theme.backgroundColor,
                      size: 60,
                    ),
                      radius: 40,
                    ),
                    durationInMilliseconds: 800,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              end: 90,
              top: 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfile);
                },
                child: CircleAvatar(
                  backgroundColor: theme.backgroundColor,
                  child: Icon(
                    Icons.camera_alt_sharp,
                    color: theme.primaryColor,
                    size: 16,
                  ),
                  radius: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: index == 1
                            ? () {
                                Navigator.pushNamed(
                                    context, PageRoutes.language);
                              }
                            : () {},
                        leading: Icon(
                          _blueContainerContent[index].icon,
                          color: iconColor,
                        ),
                        title: Text(
                          _blueContainerContent[index].title!,
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: whiteTextColor,
                          ),
                        ),
                        subtitle: Text(
                          _blueContainerContent[index].subtitle!,
                          style: theme.textTheme.caption!.copyWith(
                            color: whiteTextColor.withOpacity(0.7),
                          ),
                        ),
                        trailing: index == 0
                            ? Switch(
                                value: _theme,
                                onChanged: (value) {
                                  setState(() {
                                    _theme = value;
                                  });
                                  if (value)
                                    _themeCubit.selectLightTheme();
                                  else
                                    _themeCubit.selectDarkTheme();
                                },
                              )
                            : index == 1
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        getTranslationOf('english')! + ' ',
                                        style: theme.textTheme.caption!.copyWith(
                                          color:
                                              whiteTextColor.withOpacity(0.7),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: iconColor,
                                      ),
                                    ],
                                  )
                                : Switch(
                                    value: notifications,
                                    onChanged: (value) {
                                      setState(() {
                                        notifications = !notifications;
                                      });
                                    },
                                  ),
                      );
                    },
                    itemCount: _blueContainerContent.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.all(8),
                            shrinkWrap: true,
                            itemCount: _whiteContainerContent.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: index == 0
                                    ? () {
                                        Navigator.pushNamed(
                                            context, PageRoutes.aboutUs);
                                      }
                                    : index == 1
                                        ? () {
                                            Navigator.pushNamed(context,
                                                PageRoutes.privacyPolicy);
                                          }
                                        : index == 2
                                            ? () {
                                                Navigator.pushNamed(context,
                                                    PageRoutes.support);
                                              }
                                            : () {
                                                Navigator.pushNamed(
                                                    context, PageRoutes.faqs);
                                              },
                                leading: Icon(
                                  _whiteContainerContent[index].icon,
                                  color: theme.primaryColor,
                                ),
                                title: Text(
                                  _whiteContainerContent[index].title!,
                                  style: theme.textTheme.bodyText1,
                                ),
                                subtitle: Text(
                                  _whiteContainerContent[index].subtitle!,
                                  style: theme.textTheme.caption,
                                ),
                              );
                            })),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
