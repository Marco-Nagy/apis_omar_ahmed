import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/screens/daily_journal_screen.dart';
import 'package:apis_omar_ahmed/Features/Settings/presentation/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Features/feature/presentation/providers/user_provider.dart';
import 'core/ingection.dart';

void main() {
  initGetIt();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (_) => getIt<UserProvider>()),
        ChangeNotifierProvider<DailyJournalProvider>(
            create: (_) => getIt<DailyJournalProvider>()),
        ChangeNotifierProvider<AddEmployeeProvider>(
            create: (_) => AddEmployeeProvider()),
        ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DailyJournalScreen());
  }
}
