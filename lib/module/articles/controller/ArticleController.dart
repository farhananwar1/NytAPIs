import 'package:geekinn_test/core/repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/overlay_progress_bar/overlay_progress_bar.dart';

class ArticleController extends GetxController {
  final Repository repository;

  ArticleController({required this.repository});

  RxBool isLoading = false.obs;
  RxList getArticlesResponse = [].obs;
  RxString filteredOption = ''.obs;
  RxBool body = false.obs;
  RxBool specPg = false.obs;
  RxBool cWork = false.obs;

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

  getArticlesOnTheBasesOfFilter(context, value, page) {
    if (page > 1) {
      showSendingProgressBar(context);
    } else {
      isLoading.value = true;
      hideSendingProgressBar();
    }
    repository.getArticlesOnTheBasesOfFilter(value, page).then((res) {
      if (res[0] == true) {
        if (page == 1) {
          Navigator.of(context).pop();
        }
        hideSendingProgressBar();
        isLoading.value = false;
        getArticlesResponse.value = [...getArticlesResponse, ...res[1]];
      } else {
        hideSendingProgressBar();
        isLoading.value = false;
        Get.snackbar('Error', 'Something went wrong',
            snackPosition: SnackPosition.TOP);
      }
    });
  }
}
