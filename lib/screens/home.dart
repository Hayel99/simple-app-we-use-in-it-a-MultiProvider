import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Model()),
         ChangeNotifierProvider(create: (context) => ProvOne()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        endDrawer: Drawer(backgroundColor: Colors.white),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer<Model>(
                builder: (context, model, child) {
                  return Text(
                    "${model.showSomthing}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer<ProvOne>(
                builder: (context, model, child) {
                  return Text(
                    "${model.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer<Model>(
                builder: (context, model, child) {
                  return FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      model.doSomethingOne();
                      print("Hi provider one");
                    },
                    child: Icon(Icons.front_hand_outlined),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Consumer<ProvOne>(
                builder: (context, model, child) {
                  return FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      model.doSomethingProvOne();
                      print("Hi provider two");
                    },
                    child: Icon(Icons.back_hand_sharp),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  var showSomthing = "Welcome";
  doSomethingOne() {
    showSomthing = "Hello Provider One";
    notifyListeners();
  }

  doSomethingTwo() {
    showSomthing = "Hello Provider Two";
    notifyListeners();
  }
}

class ProvOne extends ChangeNotifier {
  var name = "Hayel";
  doSomethingProvOne() {
    name = "Yassin";
    notifyListeners();
  }


}
