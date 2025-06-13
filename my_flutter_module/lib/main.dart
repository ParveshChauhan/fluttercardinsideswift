import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vwo_insights_flutter_sdk/vwo_insights_flutter_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('com.example.flutter/arguments');

  // Default to 'card' if no arguments are received
  channel.setMethodCallHandler((call) async {
    if (call.method == 'setScreen') {
      print("Received screen argument: ${call.arguments}");
      String? screen = call.arguments as String?;
      if (screen == 'fullScreen') {
        runApp(const MyApp(initialScreen: 'fullScreen'));
      } else {
        runApp(const MyApp(initialScreen: 'card'));
      }
    }
  });

  // Fallback to card view if no arguments are provided
  runApp(const MyApp(initialScreen: 'card'));

  // runApp(const MyApp(
  //   initialScreen: '',
  // ));
}

// Entry point for the Flutter module
// void mainWithArguments(List<String> args) {
//   String initialScreen = args.isNotEmpty ? args[0] : 'card';
//   runApp(MyApp(initialScreen: initialScreen));
// }

class MyApp extends StatelessWidget {
  final String initialScreen;

  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    Widget homeWidget;

    // Decide which screen to show
    if (initialScreen == 'fullScreen') {
      homeWidget = const FullScreenPage();
    } else {
      homeWidget = const CardPage();
    }

    return MaterialApp(
      home: homeWidget,
    );
  }
}

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Call your function when the widget is first created
    onScreenVisible();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This method is called when the app's lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onScreenVisible();
    }
  }

  void onScreenVisible() {
    print('CardPage is now visible');
    VwoFlutter.setScreenViewed("flutter card");
    // Add any additional logic you want to execute when the screen becomes visible
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            width: 350,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Flutter Card',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CardPage extends StatelessWidget {
//   const CardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     VwoFlutter.setScreenViewed("flutter card");

//     return Scaffold(
//       body: Center(
//         child: Card(
//           child: Container(
//             width: 350,
//             height: 200,
//             color: Colors.blue,
//             child: Center(
//               child: const Text(
//                 'Flutter Card',
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({super.key});

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage>
    with WidgetsBindingObserver {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Call your function when the widget is first created
    onScreenVisible();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This method is called when the app's lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onScreenVisible();
    }
  }

  void onScreenVisible() {
    print('FullScreenPage is now visible');
    VwoFlutter.setScreenViewed("FullFlutterScreen");
    // Add any additional logic you want to execute when the screen becomes visible
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Full Screen Page'),
        ),
        body: ListView(
          children: items.map((item) {
            return ListTile(
             title: VwoWrapper(child: Text(item)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on $item')),
                );
              },
            );
          }).toList(),
        ));
  }
}

// class FullScreenPage extends StatelessWidget {
//   const FullScreenPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     VwoFlutter.setScreenViewed("FullFlutterScreen");
//     final items =
//         List.generate(20, (index) => 'Item ${index + 1}'); // Example list

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Full Screen Page'),
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back),
//         //   onPressed: () {
//         //     // Close the Flutter screen and return to Swift
//         //     Navigator.pop(context);
//         //   },
//         // ),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(items[index]),
//             onTap: () {
//               // Handle item tap if needed
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Tapped on ${items[index]}')),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
