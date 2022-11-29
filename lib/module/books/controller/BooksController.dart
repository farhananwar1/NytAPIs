import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/repository.dart';
import '../../../utils/overlay_progress_bar/overlay_progress_bar.dart';

class BookController extends GetxController {
  final Repository repository;

  BookController({required this.repository});

  RxBool isLoading = false.obs;
  RxList getBooksResponse = [].obs;
  RxString date = ''.obs;
  RxInt page = 1.obs;

  ProgressBar? _sendingMsgProgressBar = ProgressBar();

  void showSendingProgressBar(context) {
    _sendingMsgProgressBar!.show(context);
  }

  void hideSendingProgressBar() {
    _sendingMsgProgressBar!.hide();
  }

  @override
  void dispose() {
    _sendingMsgProgressBar!.hide();
    super.dispose();
  }

  getBooksOnTheBasesOfFilter(context, value, page, date) {
    if (page == 1) {
      isLoading.value = true;
      hideSendingProgressBar();
    } else {
      showSendingProgressBar(context);
      isLoading.value = false;
    }
    repository.getBooksOnTheBasesOfFilter(value, page, date).then((res) {
      if (res[0] == true) {
        hideSendingProgressBar();
        isLoading.value = false;
        getBooksResponse.value = [...getBooksResponse, ...res[1]];
      } else {
        hideSendingProgressBar();
        isLoading.value = false;
        Get.snackbar('Error', 'Something went wrong',
            snackPosition: SnackPosition.TOP);
      }
    });
  }
}
