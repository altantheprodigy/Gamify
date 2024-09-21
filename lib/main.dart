import 'package:flutter/material.dart';
import 'package:gamify/pages/DetailPage/detail_page_binding.dart';
import 'package:gamify/pages/DetailPage/detail_page_view.dart';
import 'package:gamify/pages/FavoritPage/favorite_page_binding.dart';
import 'package:gamify/pages/FavoritPage/favorite_page_view.dart';
import 'package:gamify/pages/HomePage/home_page_binding.dart';
import 'package:gamify/pages/HomePage/home_page_view.dart';
import 'package:gamify/pages/HomePage/widgets/home_card.dart';
import 'package:gamify/pages/SearchPage/search_page_binding.dart';
import 'package:gamify/pages/SearchPage/search_page_view.dart';
import 'package:get/get.dart';

import 'db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home-page",
      getPages: [
        GetPage(
            name: "/home-page",
            page: () => const HomePage(),
            binding: HomePageBinding()),
        GetPage(
            name: "/detail-page",
            page: () => const DetailPageView(),
            binding: DetailPageBinding()),
        GetPage(
            name: "/favorit-page",
            page: () => const FavoritePageView(),
            binding: FavoritePageBinding()),
        GetPage(
            name: "/search-page",
            page: () => const SearchPageView(),
            binding: SeacrhPageBinding()),
      ],
    );
  }
}
