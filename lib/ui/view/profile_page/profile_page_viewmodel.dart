/*
this is the view model i created to run my test, 
the dev in charge can delete if he sees fit
 */

import 'package:hng/app/app.logger.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

class ProfilePageViewModel extends BaseViewModel {
  final log = getLogger('ProfilePageViewModel');
  // the image url should be replaced with image gotten from
  //the rest api, this is just for testing
  var url =
      'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ';
  void saveProfilePictureLocally() async {
    // ignore: todo
    //TODO Implement Permission Service and then link it to this code

    // final status = await Permission.storage.request();
    // if (status.isGranted) {
    //   final response = await Dio()
    //       .get(url, options: Options(responseType: ResponseType.bytes));

    // ignore: todo
    //TODO Implement Image Service and link it to this code

    // final result = await ImageGallerySaver.saveImage(
    //   Uint8List.fromList(response.data),
    //   quality: 60,
    //   // the username should be replaced with the username from the rest api
    //   name: 'User Name',
    // );
    // log.i(result);
    // log.i(response.statusCode);
    // }
  }
}
