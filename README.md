# adv_flutter_animation

## Drag & Drop Functionality
Drag and Drop functionality in Flutter allows users to move widgets (such as images, text, or other UI components) from one location to another within the app interface. This feature can be useful for creating interactive user experiences, such as rearranging list items, implementing custom drag-and-drop actions, or creating games and design tools. 

### Implementing Drag & Drop in Flutter

Here’s a basic guide to implementing drag and drop in Flutter:

1. **Using Draggable and DragTarget Widgets:**
   - `Draggable`: Makes a widget draggable.
   - `DragTarget`: Defines a target area where draggable widgets can be dropped.

2. **Basic Example:**

```dart
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<Color>(
              data: Colors.blue,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Dragging',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            DragTarget<Color>(
              onAccept: (color) {
                setState(() {
                  caughtColor = color;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: candidateData.isEmpty ? caughtColor : Colors.green,
                  child: Center(
                    child: Text(
                      'Drop here',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
```

### Key Points:

- **Draggable Widget:** 
  - `data`: The data you want to pass when the draggable widget is dropped.
  - `child`: The widget that will be displayed when not dragging.
  - `feedback`: The widget that will be displayed while dragging.
  - `childWhenDragging`: The widget that will replace the child widget during the drag operation.

- **DragTarget Widget:**
  - `onAccept`: A callback function that is called when the draggable widget is dropped on the target.
  - `builder`: A function that builds the target area, providing the current state of the target.

### Customizing and Extending:
You can customize the appearance and behavior of the draggable and drag target widgets to fit your app’s needs. This includes handling different types of data, changing the visual feedback during dragging, and defining complex drop targets.




### ScreenShoets

<p align='center'>
  <img src='https://github.com/Aksharpatel06/adv_flutter_animation/assets/143181114/44604257-4313-4ef1-8690-505a324c0143' width=240>
</p>

### video

https://github.com/Aksharpatel06/adv_flutter_animation/assets/143181114/d0fcd17d-fde3-4bae-95d3-bc172f69c347


##  Hero Widget [('Source Code')](https://github.com/Aksharpatel06/adv_flutter_animation/tree/master/lib/view/task_2/screen)

The `Hero` widget in Flutter is used to create a seamless transition effect between two screens. When navigating between screens, the `Hero` widget makes it appear as if a widget on the first screen is flying or transitioning smoothly to the corresponding widget on the second screen. This can create visually appealing animations that enhance the user experience.

### Key Features of `Hero` Widget

- **Tag**: The `Hero` widget uses a unique tag to identify the widgets involved in the animation. Both the source and destination `Hero` widgets must have the same tag.
- **Flight Animation**: When navigating from one screen to another, the widget identified by the tag will appear to fly from its position on the first screen to its position on the second screen.
- **Child**: The `Hero` widget wraps around the widget that you want to animate. This child widget will be the one that appears to fly between screens.

### Example Usage

Here's a simple example of how to use the `Hero` widget:

**Screen 1:**

```dart
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Hero(
            tag: 'hero-example',
            child: Icon(
              Icons.star,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
```

**Screen 2:**

```dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Hero(
          tag: 'hero-example',
          child: Icon(
            Icons.star,
            size: 150.0,
          ),
        ),
      ),
    );
  }
}
```

In this example:
- The `Hero` widget is used on both screens with the same `tag` value (`'hero-example'`).
- When you tap on the star icon on the first screen, it will transition to the second screen where the star icon is displayed in a larger size.

This creates a smooth animation that visually connects the two screens, enhancing the user experience.

### Best Practices
- Ensure that the `tag` is unique within the context of the transition.
- The child of the `Hero` widget should be identical in both screens for the best visual effect.
- Use the `Hero` widget to improve navigation experience, particularly when you want to emphasize the connection between two elements on different screens.

### ScreenShoets

<p align='center'>
  <img src='https://github.com/Aksharpatel06/adv_flutter_animation/assets/143181114/085d4ae7-e429-433f-a867-f306921406f3' width=240>
   <img src='https://github.com/Aksharpatel06/adv_flutter_animation/assets/143181114/fda2df7c-c73a-4ff9-bcb5-4a9040050dab' width=240>
</p>

### video

https://github.com/Aksharpatel06/adv_flutter_animation/assets/143181114/e943aa80-8bae-48b4-aecb-f13920d5069d

