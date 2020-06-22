import 'dart:io';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //device is connected to internet
        print('Device is Connected');
        return true;
      }
    } on SocketException catch (error) {
      //device is not connected
      print('Device is not Connected');
      return false;
    }
    return false;
  }
}
