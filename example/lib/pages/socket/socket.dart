import 'package:get_server/get_server.dart';

class SocketPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Socket(context, builder: (socket) {
      socket.on('join', (val) {
        final join = socket.join(val);
        if (join) {
          socket.sendToRoom(val, 'socket: ${socket.hashCode} join to room');
        }
      });
      socket.onMessage((data) {
        print('data: $data');
        socket.send(data);
      });

      socket.onOpen((ws) {
        print('new socket opened');
      });

      socket.onClose((close) {
        print('socket has closed. Reason: ${close.message}');
      });
    });
  }
}
