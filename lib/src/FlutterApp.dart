import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/services/localizations/localizations.dart';
import 'package:flutter_base_app/src/services/navigator.dart';
import 'package:flutter_base_app/src/services/routes.dart';
import 'package:flutter_base_app/src/theme/theme.dart';
import 'package:flutter_base_app/src/widgets/BlocProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base_app/src/blocs/localization/bloc.dart';

class FlutterApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _FlutterApp state = context.ancestorStateOfType(TypeMatcher<_FlutterApp>());
    state.setState(() {
      state.locale = newLocale;
    });
  }

  @override
  _FlutterApp createState() => _FlutterApp();
}

class _FlutterApp extends State<FlutterApp> {
  void initState() {
    super.initState();
  }

  Locale locale;
  build(_) {
    return AppBlocProviders(child: Builder(builder: (context) {
      final localizationBloc = BlocProvider.of<LocalizationBloc>(context);
      return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizationDelegate()
          ],
          // locale: Locale('en'),
          localeResolutionCallback: (systemLocale, supportedLocales) {
            if (this.locale == null || !(this.locale is Locale)) {
              this.locale = systemLocale;
            }
            return this.locale;
          },
          supportedLocales: AppLocalizations.availableLocalizations
              .map((item) => Locale(item.languageCode)),
          theme: flutterAppTheme,
          home: Navigator(
              onGenerateRoute: Router.generatedRoute,
              key: rootNavigationService.navigatorKey));
    }));
  }
}
