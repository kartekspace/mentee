import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';


class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        getTranslationOf('register')!,
                        style: theme.textTheme.headline6,
                      ),
                      Text(
                        getTranslationOf('in_less_than')!,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.subtitle2,
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: FadedScaleAnimation(
                        Image.asset("assets/vct_register.png")),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: ListView(
                  children: [
                    EntryField(
                      label: getTranslationOf('full_name'),
                      hint: getTranslationOf('enter_full_name'),
                    ),
                    EntryField(
                      label: getTranslationOf('email_address'),
                      hint: getTranslationOf('enter_email_address'),
                    ),
                    EntryField(
                      label: getTranslationOf('phone_number'),
                      hint: getTranslationOf('enter_phone_number'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        getTranslationOf('we_will_send')!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1,
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.verification);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
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
