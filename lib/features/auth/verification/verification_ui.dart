import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';


class VerificationUI extends StatefulWidget {
  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.focusColor),
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslationOf('verification')!,
                        style: theme.textTheme.headline6,
                      ),
                      Text(
                        getTranslationOf('in_less_than')!,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  FadedScaleAnimation(
                      Image.asset("assets/vct_verification.png", scale: 1.5)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 16, bottom: 30, right: 16),
                        child: Text(
                          getTranslationOf('we_have')!,
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                      EntryField(
                        label: getTranslationOf('enter_code'),
                        hint: getTranslationOf('enter_six'),
                      ),
                      Spacer(),
                      CustomButton(
                        text: getTranslationOf('get_started'),
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.news);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
