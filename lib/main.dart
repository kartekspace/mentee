import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/business_logic/widget/root_injector_widget.dart';
import 'package:tek_capsule/core/locale/language_cubit.dart';
import 'package:tek_capsule/core/locale/language_ui.dart';
import 'package:tek_capsule/core/locale/locales.dart';
import 'package:tek_capsule/core/routes/routes.dart';
import 'package:tek_capsule/core/themes/theme_cubit.dart';
import 'package:tek_capsule/features/auth/sign_in/login_ui.dart';
import 'package:tek_capsule/infrastructure/network/http_client/http_client_override.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isDark = prefs.getBool('theme');
  HttpOverrides.global = HttpClientOverride();
  final GlobalKey<ScaffoldMessengerState> globalscaffoldKey =
      new GlobalKey<ScaffoldMessengerState>();
  final injectorWidget = RootInjectorWidget(
      child: MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LanguageCubit()),
    BlocProvider(create: (context) => ThemeCubit(isDark)),
  ], child: Phoenix(child: MyApp(globalscaffoldKey))));
  injectorWidget.init(globalscaffoldKey);
  runApp(injectorWidget);
}

class MyApp extends StatelessWidget {
  late GlobalKey<ScaffoldMessengerState> globalscaffoldKey;

  MyApp(GlobalKey<ScaffoldMessengerState> scaffoldKey) {
    this.globalscaffoldKey = scaffoldKey;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return BlocBuilder<LanguageCubit, Locale>(builder: (context, locale) {
          return StreamBuilder<Locale>(
            stream: ApplicationBloc().appLocale,
            builder: (context, snapshot) {
              return MaterialApp(
                scaffoldMessengerKey: globalscaffoldKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en'),
                  const Locale('ar'),
                  const Locale('pt'),
                  const Locale('fr'),
                  const Locale('id'),
                  const Locale('es'),
                  const Locale('it'),
                  const Locale('tr'),
                  const Locale('sw'),
                ],
                locale: snapshot.data,
                theme: theme,
                home: SignInUI(),
                routes: PageRoutes().routes(),
              );
            }
          );
        });
      },
    );
  }
}
