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
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragDropDemo(),
    );
  }
}

class DragDropDemo extends StatefulWidget {
  @override
  _DragDropDemoState createState() => _DragDropDemoState();
}

class _DragDropDemoState extends State<DragDropDemo> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag & Drop Demo'),
      ),
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
    );
  }
}
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
