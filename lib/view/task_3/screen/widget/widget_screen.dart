import 'dart:math';

import 'package:adv_flutter_animation/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen>
    with TickerProviderStateMixin {
  late Animation<Color?> colorAnimation;
  late Animation<TextStyle> _textStyleAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Decoration> _decorationAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fadeAnimation;
  late Widget _animatedModalBarrier;
  GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    animation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1.5)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticIn,
      ),
    );

    colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black.withOpacity(0.5),
    ).animate(animationController);

    _sizeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    _textStyleAnimation = TextStyleTween(
      begin: const TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      end: const TextStyle(
        color: Colors.red,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeIn,
      ),
    );



    _decorationAnimation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(0),
      ),
      end: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159, // 2π radians (360 degrees)
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    _animatedModalBarrier = AnimatedModalBarrier(
      color: colorAnimation,
      dismissible: true,
    );

    _opacityAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleFade() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  void addData() {
    globalKey.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 500));
    data.insert(0, '${data.length} Data ');
  }

  void removeData(int index) {
    globalKey.currentState!.removeItem(
      index,
      duration: const Duration(milliseconds: 500),
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            child: ListTile(
              tileColor: Colors.red,
            ),
          ),
        );
      },
    );
    data.removeAt(index);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;
    HomePageProvider homePageProviderfalse =
        Provider.of<HomePageProvider>(context, listen: false);
    HomePageProvider homePageProviderTrue =
        Provider.of<HomePageProvider>(context, listen: true);

    List<Widget> animationWidget = [
      AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 500),
        height: 55,
        width: homePageProviderTrue.width,
        decoration: BoxDecoration(
          color: homePageProviderTrue.color,
          borderRadius: homePageProviderTrue.borderRadius,
        ),
      ),
      AnimatedOpacity(
        opacity: homePageProviderTrue.opacity,
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
      SizedBox(
        width: 200,
        height: 350,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AnimatedPositioned(
              width: homePageProviderTrue.isMoved ? 120 : 50,
              height: homePageProviderTrue.isMoved ? 50 : 120,
              top: 2,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
      AnimatedAlign(
        duration: const Duration(milliseconds: 500),
        alignment: homePageProviderTrue.alignment,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
      AnimatedCrossFade(
        firstChild: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
              child:
                  Text('First Child', style: TextStyle(color: Colors.white))),
        ),
        secondChild: Container(
          width: 200,
          height: 300, // Different height to show size transition
          color: Colors.green,
          child: const Center(
              child:
                  Text('Second Child', style: TextStyle(color: Colors.white))),
        ),
        crossFadeState: homePageProviderTrue.isMoved
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        sizeCurve: Curves.bounceOut,
        layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
          return Stack(
            children: <Widget>[
              Positioned(
                key: bottomChildKey,
                child: bottomChild,
              ),
              Positioned(
                key: topChildKey,
                child: topChild,
              ),
            ],
          );
        },
      ),
      AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: homePageProviderTrue.isMoved
            ? Container(
                key: const ValueKey(1),
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                    child: Text('First Child',
                        style: TextStyle(color: Colors.white))),
              )
            : Container(
                key: const ValueKey(2),
                width: 200,
                height: 200,
                color: Colors.green,
                child: const Center(
                    child: Text('Second Child',
                        style: TextStyle(color: Colors.white))),
              ),
      ),
      const Hero(
        tag: 'box',
        child: Text('Hero Widget'),
      ),
      FadeTransition(
        opacity: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
              child: Text('Fade Me', style: TextStyle(color: Colors.white))),
        ),
      ),
      ScaleTransition(
        scale: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: homePageProviderTrue.color,
          child: const Center(
              child: Text('Scale Me', style: TextStyle(color: Colors.white))),
        ),
      ),
      SlideTransition(
        position: animation,
        child: const FlutterLogo(
          size: 50,
        ),
      ),
      RotationTransition(
        turns: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
              child: Text('Rotate Me', style: TextStyle(color: Colors.white))),
        ),
      ),
      SizeTransition(
        sizeFactor: _sizeAnimation,
        axis: Axis.vertical,
        axisAlignment: -1.0,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                  child: Text('Animate Me',
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;
          return Stack(
            children: <Widget>[
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                    biggest,
                  ),
                  end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest,
                  ),
                ).animate(CurvedAnimation(
                  parent: animationController,
                  curve: Curves.elasticInOut,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(),
                ),
              ),
            ],
          );
        },
      ),
      DecoratedBoxTransition(
        position: DecorationPosition.background,
        decoration: _decorationAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              width: 200,
              height: 200,
              child: const Center(
                  child: Text('Animate Me',
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
      DefaultTextStyleTransition(
        style: _textStyleAnimation,
        child: const Text('Hello, Flutter!'),
      ),
      SizedBox(
        height: 100,
        width: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    homePageProviderTrue.isMoved = true;
                  });
                  animationController.reset();
                  animationController.forward();
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      homePageProviderTrue.isMoved = false;
                    });
                  });
                },
                child: const Text("Click")),
            if (homePageProviderTrue.isMoved) _animatedModalBarrier
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 630,
            child: AnimatedList(
              key: globalKey,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    color: Colors.green.shade200,
                    child: ListTile(
                      title: Text(data[index]),
                      trailing: IconButton(
                        onPressed: () {
                          removeData(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton(
            onPressed: () {
              addData();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: animationController,
        size: 50,
      ),
      AnimatedPhysicalModel(
        duration: const Duration(seconds: 1),
        shape: BoxShape.rectangle,
        elevation: homePageProviderTrue.isMoved ? 10.0 : 2.0,
        color: homePageProviderTrue.isMoved ? Colors.blue : Colors.red,
        shadowColor:
            homePageProviderTrue.isMoved ? Colors.blueAccent : Colors.redAccent,
        borderRadius:
            BorderRadius.circular(homePageProviderTrue.isMoved ? 20 : 5),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.transparent,
          child: const Center(
            child: Text(
              'Tap Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      AnimatedSize(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: Container(
          width: homePageProviderTrue.isMoved ? 200 : 100,
          height: homePageProviderTrue.isMoved ? 200 : 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            'Tap Me',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return AnimatedPadding(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(provider.padding),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Text(
                'Tap Me',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
      TweenAnimationBuilder(
        tween: Tween<double>(
          begin: 0,
          end: 2 * pi,
        ),
        // tween: ColorTween(begin: Colors.amber, end: Colors.deepPurple),
        duration: const Duration(seconds: 10),
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image-removebg-preview.png')),
          ),
        ),
        builder: (context, value, child) => Transform.rotate(
          angle: value,
          child: child,
        ),
      ),
      AnimatedBuilder(
        animation: animationController,
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image-removebg-preview.png')),
          ),
        ),
        builder: (context, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return RotationTransition(
                turns: animationController,
                child: child,
              );
            },
          );
        },
      ),
      AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        style: const TextStyle(
            color: Colors.black, fontSize: 22, letterSpacing: 1),
        curve: Curves.bounceIn,
        child: Text(
          homePageProviderTrue.isMoved ? 'Sucefully' : 'hello',
        ),
      ),
      AnimatedTheme(
        data: homePageProviderTrue.themeData,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
              child: Text('Theme change Me', style: TextStyle(color: Colors.white))),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            Text(animationWidgetNameList[homePageProviderTrue.animationIndex]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _toggleFade();
                });
                  homePageProviderfalse.animatorChange();
              },
              child: animationWidget[homePageProviderTrue.animationIndex]),
        ),
      ),
    );
  }
}

late AnimationController animationController;
late Animation<double> _animation;
late Animation<Offset> animation;
List data = [];
