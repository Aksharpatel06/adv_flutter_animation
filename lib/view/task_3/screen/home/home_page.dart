import 'package:adv_flutter_animation/utils/global_variable.dart';
import 'package:adv_flutter_animation/view/task_3/provider/home_page_provider.dart';
import 'package:adv_flutter_animation/view/task_3/screen/widget/widget_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProviderfalse =
        Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Widget'),
      ),
      body: ListView.builder(
        itemCount: animationWidgetNameList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: (index == 6)
                ? Hero(
                    tag: 'box',
                    child: Material(
                      child: Text(
                        animationWidgetNameList[index],
                      ),
                    ),
                  )
                : Text(
                    animationWidgetNameList[index],
                  ),
            onTap: () {
              homePageProviderfalse.changeIndex(index);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WidgetScreen(),
                  ));
            },
          );
        },
      ),
    );
  }
}
