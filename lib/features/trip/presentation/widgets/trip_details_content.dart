import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;

import '../bloc/trip_bloc.dart';
import 'trip_images_banner.dart';

class TripDetailsContent extends StatelessWidget {
  final TripDataFetchedState state;

  const TripDetailsContent({@required this.state});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TripImagesBanner(
            images: state.trip.img,
            isLiked: state.trip.isLiked,
          ),
          _buildSymmetricPadding(
            child: Text(
              '${state.trip.interest}#',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          _buildSymmetricPadding(
            child: Text(
              state.trip.title,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          _buildSymmetricPadding(
            child: FutureBuilder(
              future: getDateFormatted(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) return Container();

                return _buildInfoRow(
                  'assets/images/calendar.png',
                  '${snapshot.data}',
                );
              },
            ),
          ),
          _buildSymmetricPadding(
            child:
                _buildInfoRow('assets/images/pushpin.png', state.trip.address),
          ),
          _buildCustomDivider(),
          _buildTrainerPart(),
          _buildCustomDivider(),
          _buildSymmetricPadding(
            child: Text(
              'عن الدورة',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          _buildSymmetricPadding(
            child: Text(
              state.trip.occasionDetail,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
          _buildCustomDivider(),
          _buildSymmetricPadding(
            child: Text(
              'تكلفة الدورة',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          _buildPriceSammry(),
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            buttonColor: Theme.of(context).primaryColor,
            minWidth: double.infinity,
            height: 60.0,
            child: RaisedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  'قم بالحجز الآن',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCustomDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildPriceSammry() {
    return _buildSymmetricPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: state.trip.reservTypes
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SAR ${e.price}'),
                  Text(e.name),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSymmetricPadding({Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 2,
      ),
      child: child,
    );
  }

  Widget _buildTrainerPart() {
    print(state.trip.trainerImg);
    return _buildSymmetricPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.trip.trainerName),
              CircleAvatar(
                //! this will display a purple circle because there is a problem
                //! with the link of the image. i tried to open it from browser but
                //! i figured the link leads to unsecure connection issue. i tried
                //! a random imageg link from google and it works so it is not an app issue.
                backgroundImage: NetworkImage(state.trip.trainerImg),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            state.trip.trainerInfo,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String imagePath, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          textAlign: TextAlign.right,
        ),
        SizedBox(
          width: 10.0,
        ),
        Image.asset(
          imagePath,
          height: 25,
          color: Colors.black54,
        ),
      ],
    );
  }

  Future<String> getDateFormatted() async {
    await initializeDateFormatting('ar_SA', null);
    return intl.DateFormat('E, MM MMM, hh:mm a', 'ar_SA')
        .format(state.trip.date);
  }
}
