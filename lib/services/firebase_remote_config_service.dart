import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';

import '../shared/constants/constants.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  String getString(String key) => _remoteConfig.getString(key);

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(milliseconds: 10),
        ),
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      debugPrint('The config has been updated.');
    } else {
      debugPrint('The config is not updated.');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await fetchAndActivate();
  }

  String get countryCode => getString(Constants.countryCodeKey);
}
