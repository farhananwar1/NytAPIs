import 'network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List> getArticlesOnTheBasesOfFilter(value, page) async {
    final data =
        await networkService.getArticlesOnTheBasesOfFilter(value, page);
    if (data[0] == true) {
      try {
        return [true, data[1]['response']['docs']];
      } catch (e) {
        return [false, []];
      }
    }
    return [false, data[1]];
  }

  Future<List> getBooksOnTheBasesOfFilter(value, page, date) async {
    final data =
        await networkService.getBooksOnTheBasesOfFilter(value, page, date);
    if (data[0] == true) {
      try {
        return [true, data[1]['response']['docs']];
      } catch (e) {
        return [false, []];
      }
    }
    return [false, data[1]];
  }
}
