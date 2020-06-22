import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Trip extends Equatable {
  final int id;
  final String title;
  final List<String> img;
  final String interest;
  final num price;
  final DateTime date;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final String latitude;
  final String longitude;
  final bool isLiked;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  final int specialForm;
  final dynamic questionnaire;
  final dynamic questExplanation;
  final List<ReservType> reservTypes;

  Trip({
    @required this.id,
    @required this.title,
    @required this.img,
    @required this.interest,
    @required this.price,
    @required this.date,
    @required this.address,
    @required this.trainerName,
    @required this.trainerImg,
    @required this.trainerInfo,
    @required this.occasionDetail,
    @required this.latitude,
    @required this.longitude,
    @required this.isLiked,
    @required this.isSold,
    @required this.isPrivateEvent,
    @required this.hiddenCashPayment,
    @required this.specialForm,
    @required this.questionnaire,
    @required this.questExplanation,
    @required this.reservTypes,
  });

  @override
  List<Object> get props => [
        id,
        title,
        img,
        interest,
        price,
        date,
        address,
        trainerName,
        trainerImg,
        trainerInfo,
        occasionDetail,
        latitude,
        longitude,
        isLiked,
        isSold,
        isPrivateEvent,
        hiddenCashPayment,
        specialForm,
        questionnaire,
        questExplanation,
        reservTypes,
      ];
}

class ReservType extends Equatable {
  final int id;
  final String name;
  final int count;
  final num price;

  ReservType({
    @required this.id,
    @required this.name,
    @required this.count,
    @required this.price,
  });

  @override
  List<Object> get props => [id, name, count, price];
}
