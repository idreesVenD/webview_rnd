import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  await Permission.microphone.request();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const WizartDemo(),
                ));
              },
              child: const Text("Open Paint Visualizer"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (ctx) => const ColorSnap(),
            //     ));
            //   },
            //   child: const Text("Open ColorSnap Visualizer"),
            // ),
          ],
        ),
      ),
    );
  }
}

class WizartDemo extends StatefulWidget {
  const WizartDemo({super.key});

  @override
  State<WizartDemo> createState() => _WizartDemoState();
}

class _WizartDemoState extends State<WizartDemo> {
  final url = 'https://wizart.ai/paint-demo';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wizart')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}

// class ColorSmartBehr extends StatefulWidget {
//   const ColorSmartBehr({super.key});

//   @override
//   State<ColorSmartBehr> createState() => _ColorSmartBehrState();
// }

// class _ColorSmartBehrState extends State<ColorSmartBehr> {
//   final url =
//       'https://www.behr.com/consumer/colors/paint/visualizer?roomContent=Bedroom&roomName=Bedroom';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ColorSmart Behr')),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(url: Uri.parse(url)),
//       ),
//     );
//   }
// }

// class ColorSnap extends StatefulWidget {
//   const ColorSnap({super.key});

//   @override
//   State<ColorSnap> createState() => _ColorSnapState();
// }

// class _ColorSnapState extends State<ColorSnap> {
//   final url = 'https://www.sherwin-williams.com/visualizer#/active/scenes';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ColorSnap')),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(url: Uri.parse(url)),
//       ),
//     );
//   }
// }
