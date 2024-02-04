import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Alerts in Flutter"),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        TextButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text("Show Alert Dialog")),
        TextButton(
            onPressed: () {
              showSnackBar(context);
            },
            child: const Text("Show Snackbar")),
        TextButton(
            onPressed: () {
              showCustomBottomSheet(context);
            },
            child: const Text("Show Bottom Sheet")),
        TextButton(
            onPressed: () {
              showCustomDialog(context);
            },
            child: const Text("Show Custom Dialog"))
      ],
    ));
  }

  //Show Custom dialog function
  void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("My Custom Dialog"),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text("My Text"), border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(_);
                      },
                      child: const Text("Submit"))
                ],
              ),
            ));
  }

  //Show Custom bottom sheet function
  void showCustomBottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (_) => Container(
              height: 400,
              color: Colors.amberAccent,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bottom Sheet"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close")),
                ],
              )),
            ));
  }

  //Show Snackbar functions
  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("This is a snackbar"),
      action: SnackBarAction(
          label: "Ok", onPressed: () {}, textColor: Colors.white),
      duration: const Duration(seconds: 13),
      backgroundColor: Colors.green,
    ));
  }

  //Show Alert Dialog function
  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("My Alert"),
              content: const Text("Do you want to exit?"),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.pop(_)},
                    child: const Text("Yes")),
                TextButton(onPressed: () => {}, child: const Text("No"))
              ],
            ));
  }
}
