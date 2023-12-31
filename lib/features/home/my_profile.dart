import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/widgets/custom_button.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/headerbg.png',
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 30),
                        child: Text(
                          context.getTranslationOf('my_profile')!,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      top: 44,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 16),
                        child: Text(
                            context.getTranslationOf('everything_about_us')!,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.subtitle2),
                      ),
                    ),
                    PositionedDirectional(
                        end: 30,
                        top: 8,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            FadedScaleAnimation(
                              CircleAvatar(
                                child: Icon(
                                  Icons.person_add_alt_rounded,
                                  color: theme.backgroundColor,
                                  size: 60,
                                ),
                                radius: 60,
                              ),
                              durationInMilliseconds: 400,
                            ),
                            PositionedDirectional(
                              start: 100,
                              top: 48,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: theme.primaryColor,
                                  size: 20,
                                ),
                                radius: 20,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    padding: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                context.getTranslationOf('full_name')!,
                                style: theme.textTheme.bodyText1,
                              ),
                            ),
                            subtitle: Text(
                              'Linjith Kunnon',
                              style: theme.textTheme.bodyText1,
                            ),
                          ),
                          Spacer(),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                context.getTranslationOf('email_address')!,
                                style: theme.textTheme.bodyText1,
                              ),
                            ),
                            subtitle: Text('linjith.kunnon@mail.com'),
                          ),
                          Spacer(),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                context.getTranslationOf('phone_number')!,
                                style: theme.textTheme.bodyText1,
                              ),
                            ),
                            subtitle: Text('+1 987 654 3210'),
                          ),
                          Spacer(
                            flex: 15,
                          ),
                          CustomButton(
                            text: context
                                .getTranslationOf('logout')!
                                .toUpperCase(),
                            onTap: () {
                              Navigator.pushNamed(context, PageRoutes.signIn);
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.1),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        slideDurationInMilliseconds: 10,
        durationInMilliseconds: 10,
      ),
    );
  }
}
