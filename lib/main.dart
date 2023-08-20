import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  create() {}
  read() {}
  update() {}
  delete() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(
            height: 35,
            child: TextFormField(
              controller: title,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 35,
            child: TextFormField(
              controller: description,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 35,
            child: TextFormField(
              controller: price,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (value) {},
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => create(), child: const Text("Create")),
              ElevatedButton(
                  onPressed: () => read(), child: const Text("Read")),
              ElevatedButton(
                  onPressed: () => update(), child: const Text("Update")),
              ElevatedButton(
                  onPressed: () => delete(), child: const Text("Delete")),
            ],
          )
        ]),
      ),
    ));
  }
}
