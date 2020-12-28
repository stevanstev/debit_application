import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class PromptFingerprint {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> checkBiometrics() async {
    bool canCheckBiometrics;

    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    return canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;

    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    return availableBiometrics;
  }

  Future<bool> authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint',
        stickyAuth: false,
        sensitiveTransaction: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    return authenticated;
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }
}
