import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  String? name, description;
  double? price;
  TextEditingController title = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  create() {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Dishes").doc("Food");
    Map<String, dynamic> val = {
      "name": "hello",
      "description": 'hello is good',
      "price": 99.4
    };
    documentReference.set(val).whenComplete(() {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("value added")));
    });
  }

  read() {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Dishes").doc("Food");
    documentReference.get().then((value) {
      var data = value.data();

      if (kDebugMode) {
        print("--->$data");
        print("--->${data!['name']}");
      }
    });
    if (kDebugMode) {
      print(documentReference);
    }
  }

  update() {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Dishes").doc("Food");
    Map<String, dynamic> val = {
      "name": "hello",
      "description": 'hello is good',
      "price": 99.4
    };
    documentReference.set(val).whenComplete(() {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("value added")));
    });
  }

  delete() {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Dishes").doc("Food");

    documentReference.delete().whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$documentReference is deleted.")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  controller: descriptionController,
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
                  controller: priceController,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.amberAccent),
                height: MediaQuery.sizeOf(context).height / 1.5,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Dishes")
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // Return a loading indicator while waiting for data
                      }
                      if (!snapshot.hasData) {
                        return const Text(
                            "No data available."); // Handle the case when there's no data
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            // QueryDocumentSnapshot<Map<String, dynamic>> dc =
                            var dc = snapshot.data?.docs[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("name"),
                                    Text(dc?.data()["name"] ?? "")
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("description"),
                                    Text(dc?.data()["description"] ?? "")
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("price"),
                                    Text("${dc?.data()["description"]}")
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          });
                    }),
              )
            ]),
      ),
    ));
  }
}
