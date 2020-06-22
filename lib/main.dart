import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/trip/presentation/bloc/trip_bloc.dart';
import 'features/trip/presentation/pages/trip_details_screen.dart';
import 'injection_container.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'ElMessiri',
        textTheme: Theme.of(context).textTheme.copyWith(
              body1: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
                fontFamily: 'ElMessiri',
              ),
              title: TextStyle(
                fontSize: 24.0,
                color: Colors.purple.withOpacity(0.6),
                fontFamily: 'ElMessiri',
              ),
            ),
      ),
      home: BlocProvider<TripBloc>(
        create: (_) {
          final bloc = serviceLocator<TripBloc>();
          bloc.add(GetTripDataEvent());
          return bloc;
        },
        child: TripDetailsScreen(),
      ),
    );
  }
}
