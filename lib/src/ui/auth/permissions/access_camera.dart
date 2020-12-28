import 'package:permission_handler/permission_handler.dart';

Future requestCameraPermission() async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.camera].request();

  return statuses[Permission.camera] == PermissionStatus.granted;
}
