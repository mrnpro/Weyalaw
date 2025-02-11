// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

abstract class LaunchService {
  Future<void> launchMaps(double lat, double lon);
  Future<void> launchPhoneCall(String phoneNumber);

  Future<void> launchWebsite(String url);
}

class LaunchServiceImpl implements LaunchService {
  @override
  Future<void> launchMaps(double lat, double lon) async {
    String appleUrl =
        'https://maps.apple.com/?saddr=&daddr=$lat,$lon&directionsmode=driving';
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';

    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(appleUrl))) {
        await launch(appleUrl);
      } else {
        if (await canLaunchUrl(Uri.parse(googleUrl))) {
          await launch(googleUrl);
        } else {
          throw 'Could not open the map.';
        }
      }
    } else {
      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else {
        throw 'Could not open the map.';
      }
    }
  }

  @override
  Future<void> launchPhoneCall(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    await _launchUrl(phoneUrl);
  }

  @override
  Future<void> launchWebsite(String url) async {
    await _launchUrl(url);
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
