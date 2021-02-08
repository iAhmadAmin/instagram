import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostController extends GetxController {
  var mediaList = [].obs;
  int selectedImageIndex = 0;
  int selectedCategory = 0;

  @override
  void onInit() {
    _fetchNewMedia();
    super.onInit();
  }

  void updateCategory(int index) {
    selectedCategory = index;
    update();
  }

  void updateSelectedImageIndex(int index) {
    selectedImageIndex = index;
    update();
  }

  _fetchNewMedia() async {
    final result = await PhotoManager.requestPermission();
    if (result) {
      final List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      if (albums.isNotEmpty) {
        final List<AssetEntity> media =
            await albums[0].getAssetListPaged(0, 50);
        mediaList.assignAll(media);
      } else {
        print("nothing found in gallery");
      }
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }
}
