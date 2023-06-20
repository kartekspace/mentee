import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tek_capsule/core/locale/language_cubit.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/widgets/custom_button.dart';
import 'package:tek_capsule/widgets/entry_field.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //       Duration(seconds: 6), () => BuyThisApp.showSubscribeDialog(context));
  // }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LanguageCubit>(context).setCurrentLanguage('en');
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Spacer(flex: 2),
            Expanded(flex: 3, child: Image.asset("assets/logo_main.png")),
            Text(getTranslationOf('app_title')!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
                    Spacer(),
            Expanded(
                flex: 3,
                child:
                    FadedScaleAnimation(Image.asset("assets/img_signin.png"))),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Text(getTranslationOf('sign_in_now')!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1),
                        SizedBox(
                          height: 24,
                        ),
                        EntryField(
                          label: getTranslationOf('phone_number'),
                          hint: getTranslationOf('enter_phone_number'),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.news);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(getTranslationOf('or_continue_with')!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  start: 0,
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.only(bottom: 20, top: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        socialButton('assets/icons/ic_fb.png',
                            getTranslationOf('facebook')!),
                        Container(
                          width: 1,
                          height: 25,
                          color: Theme.of(context).backgroundColor,
                        ),
                        socialButton('assets/icons/ic_ggl.png',
                            getTranslationOf('google')!)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).backgroundColor,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
    );
  }
}
