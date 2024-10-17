import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog_app/controller/file_controller.dart';
FileController fileController = Get.put(FileController());
Future pickFile() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
   fileController.file.value = result!.files.first;
}