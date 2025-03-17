import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zagel/core/services/locale_storage.dart';
import 'package:zagel/core/themes/dark_theme.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_cubit.dart';
import 'package:zagel/features/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocaleStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        home: const SplashView(),
        themeMode: ThemeMode.dark,
        darkTheme: appDarkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
