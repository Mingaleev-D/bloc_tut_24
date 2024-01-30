import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut_24/image_picker/page/image_picker_page.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/picker_util.dart';

part 'image_picker_event.dart';

part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final PickerUtils imagePickerPage;

  ImagePickerBloc(this.imagePickerPage) : super(const ImagePickerState()) {
    on<CameraEvent>((event, emit) async {
      XFile? file = await imagePickerPage.cameraCapture();
      emit(state.copyWith(file: file));
    });
    on<GalleryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
