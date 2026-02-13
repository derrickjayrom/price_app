import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:price_app/app.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';

// import '/presentation/notifiers/ui_notifier.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      useOnlyLangCode: true,
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UiNotifier())],
        child: const App(),
      ),
    ),
  );
}
