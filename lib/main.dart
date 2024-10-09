import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_view_bloc.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_blocController.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_view.dart';
import 'package:gamify/pages/DetailPage/detail_page_view.dart';
import 'package:gamify/pages/FavoritPage/favorite_page_view.dart';
import 'package:gamify/pages/SearchPage/search_page_view.dart';

import 'pages/HomePage/BlocVersion/home_page_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc()..add(LoadGames()),
        ),
        // Tambahkan BlocProvider lain jika diperlukan untuk halaman lain
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/home-page", // Route awal untuk HomePage
        routes: {
          '/home-page': (context) => const HomePageViewBloc(),
          '/detail-page': (context) => DetailPageViewBloc(),
          // '/favorit-page': (context) => const FavoritePageView(),
          // '/search-page': (context) => const SearchPageView(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:gamify/pages/DetailPage/detail_page_binding.dart';
// import 'package:gamify/pages/DetailPage/detail_page_view.dart';
// import 'package:gamify/pages/FavoritPage/favorite_page_binding.dart';
// import 'package:gamify/pages/FavoritPage/favorite_page_view.dart';
// import 'package:gamify/pages/HomePage/home_page_binding.dart';
// import 'package:gamify/pages/HomePage/home_page_view.dart';
// import 'package:gamify/pages/HomePage/widgets/home_card.dart';
// import 'package:gamify/pages/SearchPage/search_page_binding.dart';
// import 'package:gamify/pages/SearchPage/search_page_view.dart';
// import 'package:get/get.dart';
//
// import 'db/db_helper.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DbHelper.initDb();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       initialRoute: "/home-page",
//       getPages: [
//         GetPage(
//             name: "/home-page",
//             page: () => const HomePage(),
//             binding: HomePageBinding()),
//         GetPage(
//             name: "/detail-page",
//             page: () => const DetailPageView(),
//             binding: DetailPageBinding()),
//         GetPage(
//             name: "/favorit-page",
//             page: () => const FavoritePageView(),
//             binding: FavoritePageBinding()),
//         GetPage(
//             name: "/search-page",
//             page: () => const SearchPageView(),
//             binding: SeacrhPageBinding()),
//       ],
//     );
//   }
// }
