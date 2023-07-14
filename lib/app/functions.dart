import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = 'Unknown';
  String identifier = 'Unknown';
  String version = 'Unknown';

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if(Platform.isAndroid){
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + ' '.toString() + build.model;
      identifier = build.id;
      version = build.version.toString();
    }
    else if(Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = build.name + ' '.toString() + build.model;
      identifier = build.identifierForVendor.toString();
      version = build.systemVersion.toString();
    }
  } on PlatformException {
    // return default data
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}
