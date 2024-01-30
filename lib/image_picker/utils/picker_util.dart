import 'package:image_picker/image_picker.dart';

class PickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> cameraCapture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }
}
