import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/app.dart';
import 'package:tmda/bloc_observer.dart';
import 'package:tmda/injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}