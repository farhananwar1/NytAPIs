import 'package:geekinn_test/core/network_service.dart';
import 'package:geekinn_test/core/repository.dart';
import 'package:geekinn_test/module/articles/controller/ArticleController.dart';
import 'package:geekinn_test/module/books/controller/BooksController.dart';
import 'package:geekinn_test/module/login/controller/LoginController.dart';
import 'package:geekinn_test/module/search/controller/SearchController.dart';
import 'package:geekinn_test/module/signup/controller/SignUpController.dart';
import 'package:get/instance_manager.dart';

final kSignupController = Get.put(SignUpController());
final kLoginController = Get.put(LoginController());
final kSearchController = Get.put(SearchController());
final kArticleController = Get.put(ArticleController(
    repository: Repository(networkService: NetworkService())));
final kBookController = Get.put(
    BookController(repository: Repository(networkService: NetworkService())));
