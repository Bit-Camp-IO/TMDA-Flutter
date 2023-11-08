import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmda/app.dart';
import 'package:tmda/bloc_observer.dart';
import 'package:tmda/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  configureDependencies(); 
  Bloc.observer = MyBlocObserver();
  runApp(const TmdaApp());
}