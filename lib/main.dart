import 'package:adv_flutter_animation/view/task_3/provider/home_page_provider.dart';
import 'package:adv_flutter_animation/view/task_3/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomePageProvider(),)

  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProviderTrue =
    Provider.of<HomePageProvider>(context, listen: true);
    return MaterialApp(
      // theme: homePageProviderTrue.isMoved ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/':(context)=>const HomeScreen(),
      //   '/product':(context)=>const ProductScreen(),
      // },
      home: HomePage(),
    );
  }
}
