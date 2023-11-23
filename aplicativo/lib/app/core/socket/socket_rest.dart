import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class SocketRest {
  late final Socket socket;
  final Map<String, Function> channels = {};

  Future<void> init({required String ip, required int port}) async {
    socket = await Socket.connect(ip, port);
    log('Socket start');
    socket.listen((data) {
      Map<String, dynamic> serverResponse = json.decode((String.fromCharCodes(data)));
      if (serverResponse.containsKey('channel')) {
        final propagateChannel = serverResponse['channel'];

        if (channels.containsKey(propagateChannel)) {
          channels[propagateChannel]!(serverResponse);
        }
      }
    });
  }

  void addChannel(String channel, Function(dynamic data) f) {
    channels[channel] = f;
  }
}
