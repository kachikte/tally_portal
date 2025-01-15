import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? _socket;

  void connect(String serverUrl, String userId, String deviceId) {
    // Initialize the socket connection
    _socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // Listen for connection
    _socket!.on('connect', (_) {
      print('Connected to the server: ${_socket!.id}');

      // Register the user
      _socket!.emit('register', {'userId': userId, 'deviceId': deviceId});
      print('User $userId registered with device $deviceId');
    });

    // Handle disconnection
    _socket!.on('disconnect', (_) {
      print('Disconnected from the server');
    });

    // Listen for messages
    _socket!.on('message', (data) {
      print('Message received: $data');
      // Handle the message (e.g., update UI)
    });
  }

  void disconnect() {
    _socket?.disconnect();
    print('Socket disconnected');
  }

  void sendMessage(String recipientId, String message) {
    _socket?.emit('send-message', {'recipientId': recipientId, 'message': message});
  }
}
