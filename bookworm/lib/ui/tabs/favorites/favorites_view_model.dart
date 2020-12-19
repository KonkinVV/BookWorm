import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/book_details.dart/book_details_view.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/get.dart';

class FavoritesViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final favoritesRepository = Get.find<FavoriteBooksRepository>();

  List<BookModel> favorites;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    setBusy(true);
    favorites = (await favoritesRepository.getFavoriteBooks()).favorites;
    setBusy(false);
    update();
  }

  void showDetails(int index) {
    Get.to(BookDetailsView(book: favorites[index]));
  }

  void showBooksList() {
    BWTabBar.state.showIndex(0);
  }
}
