import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> share(
      {required String title, required String shareString}) async {
    await Share.share(shareString, subject: title);
  }
}
