import 'package:flutter/material.dart';
import 'package:progress_bar_example/controllers/progress_bar.dart';
import 'package:progress_bar_example/pens/pen.dart';
import 'package:progress_bar_example/styles/circular_painter.dart';
import 'package:progress_bar_example/widgets/semi_circular_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress bar example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ProgressBarController controller;
  late final SemiCircularPainterStyle style;
  @override
  void initState() {
    controller = ProgressBarController(initialProgress: 0.01);
    style = SemiCircularPainterStyle(
      backgroundPen: Pen(
        color: Colors.blue.withValues(alpha: 0.3),
        width: 9.0,
      ),
      progressPen: Pen(
        color: Colors.blue,
        width: 10.0,
      ),
      size: 200,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SemiCircularProgress(
              controller: controller,
              style: style,
              label: Text("${controller.value * 100}%"),
            ),
            OverflowBar(
              children: [
                IconButton(
                  onPressed: () {
                    controller.value = (controller.value - 0.25);
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    controller.value = (controller.value + 0.25);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
