import 'package:inovola_interview_task/features/trip/domain/entities/trip.dart';
import 'package:meta/meta.dart';

class TripModel extends Trip {
  TripModel({
    @required int id,
    @required String title,
    @required List<String> img,
    @required String interest,
    @required num price,
    @required DateTime date,
    @required String address,
    @required String trainerName,
    @required String trainerImg,
    @required String trainerInfo,
    @required String occasionDetail,
    @required String latitude,
    @required String longitude,
    @required bool isLiked,
    @required bool isSold,
    @required bool isPrivateEvent,
    @required bool hiddenCashPayment,
    @required int specialForm,
    @required dynamic questionnaire,
    @required dynamic questExplanation,
    @required List<ReservType> reservTypes,
  }) : super(
          id: id,
          title: title,
          img: img,
          interest: interest,
          price: price,
          date: date,
          address: address,
          trainerName: trainerName,
          trainerImg: trainerImg,
          trainerInfo: trainerInfo,
          occasionDetail: occasionDetail,
          latitude: latitude,
          longitude: longitude,
          isLiked: isLiked,
          isSold: isSold,
          isPrivateEvent: isPrivateEvent,
          hiddenCashPayment: hiddenCashPayment,
          specialForm: specialForm,
          questionnaire: questionnaire,
          questExplanation: questExplanation,
          reservTypes: reservTypes,
        );

  factory TripModel.fromJson(Map<String, dynamic> parsedJson) {
    final tempList = parsedJson['reservTypes'] as List<dynamic>;

    List<ReservTypeModel> reservTypesList = tempList.map((json) {
      return ReservTypeModel.fromJson(json);
    }).toList();

    return TripModel(
      id: parsedJson['id'],
      title: parsedJson['title'],
      img: List<String>.from(parsedJson['img'] as List<dynamic>),
      interest: parsedJson['interest'],
      price: parsedJson['price'],
      date: DateTime.parse(parsedJson['date']),
      address: parsedJson['address'],
      trainerName: parsedJson['trainerName'],
      trainerImg: parsedJson['trainerImg'],
      trainerInfo: parsedJson['trainerInfo'],
      occasionDetail: parsedJson['occasionDetail'],
      latitude: parsedJson['latitude'],
      longitude: parsedJson['longitude'],
      isLiked: parsedJson['isLiked'],
      isSold: parsedJson['isSold'],
      isPrivateEvent: parsedJson['isPrivateEvent'],
      hiddenCashPayment: parsedJson['hiddenCashPayment'],
      specialForm: parsedJson['specialForm'],
      questionnaire: parsedJson['questionnaire'],
      questExplanation: parsedJson['questExplanation'],
      reservTypes: reservTypesList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'img': img,
      'interest': interest,
      'price': price,
      'date': date,
      'address': address,
      'trainerName': trainerName,
      'trainerImg': trainerImg,
      'trainerInfo': trainerInfo,
      'occasionDetail': occasionDetail,
      'latitude': latitude,
      'longitude': longitude,
      'isLiked': isLiked,
      'isSold': isSold,
      'hiddenCashPayment': hiddenCashPayment,
      'specialForm': specialForm,
      'questionnaire': questionnaire,
      'questExplanation': questExplanation,
      'reservTypes': reservTypes,
    };
  }
}

class ReservTypeModel extends ReservType {
  ReservTypeModel({
    @required int id,
    @required String name,
    @required int count,
    @required num price,
  }) : super(
          id: id,
          name: name,
          count: count,
          price: price,
        );

  factory ReservTypeModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    return ReservTypeModel(
      id: parsedJson['id'] as int,
      name: parsedJson['name'] as String,
      count: parsedJson['count'] as int,
      price: parsedJson['price'] as num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'count': count,
      'price': price,
    };
  }
}
