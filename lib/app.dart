import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_exchange/Providers/providers.dart';
import 'package:virtual_exchange/Widgets/show_progress.dart';

import '/pages/navigation/navigation.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  bool initTheme = false;
  @override
  void initState() {
    themeProvider.getTheme().then((value) {
      initTheme = true;
      setState(() {});
    });

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initTheme ? const Navigation() : const ShowProgress();
  }
}
