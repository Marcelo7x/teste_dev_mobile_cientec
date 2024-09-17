
import 'package:flutter/foundation.dart';

class HomeController {
  final currentPage = ValueNotifier<int>(0);

  void setCurrentPage(int index) {
    currentPage.value = index;
  }

  void dispose() {
    currentPage.dispose();
  }
}