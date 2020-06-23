import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/trip_bloc.dart';
import '../widgets/trip_details_content.dart';

class TripDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripBloc, TripState>(
        builder: (ctx, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return _buildErrorColumn(state, ctx);
          } else if (state is TripDataFetchedState) {
            return TripDetailsContent(
              state: state,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildErrorColumn(ErrorState state, context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 30),
          Text(state.message),
          SizedBox(height: 5),
          OutlineButton(
            onPressed: () {
              BlocProvider.of<TripBloc>(context).add(GetTripDataEvent());
            },
            child: Text(
              'Retry',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
