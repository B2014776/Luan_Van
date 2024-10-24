import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraDetectionController extends GetxController {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  final picker = ImagePicker();
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  // Khởi tạo camera
  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras![0], // Sử dụng camera trước đầu tiên
      ResolutionPreset.high,
    );
    await cameraController?.initialize();
    update(); // Cập nhật trạng thái sau khi khởi tạo camera
  }

  // Chụp ảnh từ camera và trả về đường dẫn ảnh
  Future<String?> takePicture() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      final XFile file = await cameraController!.takePicture();
      imageFile.value = file;
      update(); // Cập nhật trạng thái sau khi chụp ảnh
      return file.path; // Trả về đường dẫn ảnh
    }
    return null; // Trả về null nếu không chụp được ảnh
  }

  // Chọn ảnh từ thư viện và trả về đường dẫn ảnh
  Future<String?> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
      update(); // Cập nhật trạng thái sau khi chọn ảnh
      return pickedFile.path; // Trả về đường dẫn ảnh
    }
    return null; // Trả về null nếu không chọn được ảnh
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
