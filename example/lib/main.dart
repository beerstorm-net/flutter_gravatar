import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:flutter_gravatar/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gravatar Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Gravatar Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  Gravatar? _gravatar;
  Map<String, String> _formInput = Map();

  @override
  void initState() {
    /// default values to use in displaying
    _email = "yg@beerstorm.net";
    _gravatar = Gravatar(_email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: Column(
        children: [
          if (_gravatar != null)
            Container(
              child: Column(
                children: [
                  Text("Email: $_email"),
                  Image.network(_gravatar!.imageUrl()),
                  ListTile(
                    title: Text("profileUrl: ${_gravatar!.profileUrl()}"),
                    subtitle: Text("hash: ${_gravatar!.hash()}"),
                  )
                ],
              ),
            ),

          /// Form to enter email address
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() => _formInput["email"] = value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter an email address',
                  ),

                  /// ensure that it is a valid email address
                  validator: (value) {
                    if (value!.isEmpty || !value.trim().isValidEmail()) {
                      return 'a valid Email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                ElevatedButton(
                  child: const Text('Continue'),
                  onPressed: () {
                    //_formKey.currentState.save();
                    /// update Gravatar usign the enterered email address
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _email = _formInput["email"];
                        _gravatar = Gravatar(_email!);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
