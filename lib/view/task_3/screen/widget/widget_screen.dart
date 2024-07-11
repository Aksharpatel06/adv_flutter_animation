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
    with SingleTickerProviderStateMixin {
  late Animation<TextStyle> _textStyleAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Decoration> _decorationAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<RelativeRect> animationPostioned;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    // _rotationAnimation = Tween<double>(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(CurvedAnimation(
    //   parent: animationController,
    //   curve: Curves.easeInOut,
    // ));
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

    animationPostioned = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(100, 100, 0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticInOut,
        left: homePageProviderTrue.leftPostioned,
        top: homePageProviderTrue.topPostioned,
        child: Container(
          width: 100,
          height: 100,
          color:homePageProviderTrue.color,
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
          child: const Center(child: Text('First Child', style: TextStyle(color: Colors.white))),
        ),
        secondChild: Container(
          width: 200,
          height: 300, // Different height to show size transition
          color: Colors.green,
          child: const Center(child: Text('Second Child', style: TextStyle(color: Colors.white))),
        ),
        crossFadeState: homePageProviderTrue.isMoved ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
              child:
              Text('First Child', style: TextStyle(color: Colors.white))),
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
          child: const Center(child: Text('Scale Me', style: TextStyle(color: Colors.white))),
        ),
      ),
      SlideTransition(
        position: animation,
        child: const FlutterLogo(size: 50,),
      ),
      RotationTransition(
        turns: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(child: Text('Rotate Me', style: TextStyle(color: Colors.white))),
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
              child: const Center(child: Text('Animate Me', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
      PositionedTransition(
        rect: animationPostioned,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: const Center(child: Text('Move Me', style: TextStyle(color: Colors.white))),
        ),
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
              child: const Center(child: Text('Animate Me', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
      DefaultTextStyleTransition(
        style: _textStyleAnimation,
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.yellow,
          child: Text('Animate Me'),
        ),
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text(animationWidgetNameList[homePageProviderTrue.animationIndex]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(onTap: () {
          setState(() {
            _toggleFade();

            homePageProviderfalse.animatorChange();
          });
        }, child: animationWidget[homePageProviderTrue.animationIndex]),
      ),
    );
  }
}



late AnimationController animationController;
late Animation<double> _animation;
late Animation<Offset> animation;
