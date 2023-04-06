import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_way/app/app.dart';
import 'package:max_way/app/bloc_observer.dart';
import 'package:max_way/services/get_it.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
