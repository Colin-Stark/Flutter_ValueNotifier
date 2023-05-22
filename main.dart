import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ValueListenerTutorial(),
    );
  }
}

class ValueListenerTutorial extends StatefulWidget {
  const ValueListenerTutorial({super.key});

  @override
  State<ValueListenerTutorial> createState() => _ValueListenerTutorialState();
}

class _ValueListenerTutorialState extends State<ValueListenerTutorial> {

  ValueNotifier<String?> _name = ValueNotifier<String?>(null);

  @override
    void dispose() {
      _name.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size custom = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: custom.height,
          width: custom.width,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: 
                ValueListenableBuilder(
                  valueListenable: _name,
                  builder: (BuildContext context, String? value, child) {
                    return Text(
                      value ?? 'we dont know',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: custom.height / 15,
                width: custom.width / 4,
                child: TextButton(
                  onPressed: ()=> _name.value = 'John',
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Change name to John'),
                )
              ),
              Expanded(
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
