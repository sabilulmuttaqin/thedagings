import 'package:get/get.dart';

class HistoryController extends GetxController {
  // Daftar semua item riwayat
  var allItems = [
    'Tulang Sum-sum',
    'Daging Potong',
    'Tulang Iga',
    'Babat',
  ].obs;

  // Daftar item yang ditampilkan (bisa difilter)
  var displayedItems = <String>[].obs;

  // Teks pencarian
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    displayedItems.assignAll(allItems); // Awalnya tampilkan semua item

    // Setiap kali teks pencarian berubah, perbarui daftar displayedItems
    searchQuery.listen((query) {
      if (query.isEmpty) {
        displayedItems.assignAll(allItems);
      } else {
        displayedItems.assignAll(
          allItems.where((item) => item.toLowerCase().contains(query.toLowerCase())),
        );
      }
    });
  }

  // Fungsi untuk mengubah teks pencarian
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
