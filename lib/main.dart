import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sanya/app_router.dart';
import 'package:shop_sanya/home_page.dart';
import 'package:shop_sanya/order_row_prov.dart';
import 'package:flutter/foundation.dart';

//void main() => runApp(const MyApp());
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OrderRowProv(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return MaterialApp(
      title: MyApp._title,
      initialRoute: '/',
      onGenerateRoute: _appRouter.onGenerateRoute,
      home: const HomePage(),
    );
  }
}
