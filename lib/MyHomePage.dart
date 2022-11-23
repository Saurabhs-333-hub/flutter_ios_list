// ignore: file_names
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/animal.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              for (var animal in animal)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoListTile(
                    leading:
                        Image.network("https://source.unsplash.com/random/"),
                    title: Text(animal.name),
                    subtitle: Text(animal.dato1),
                    hoverColor: Colors.black12,
                    // tileColor: const Color.fromARGB(255, 28, 28, 28),
                    // textColor: Colors.blue,
                    // border: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                    pressColor: const Color.fromARGB(163, 26, 26, 26),
                    border: BeveledRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.0)),
                    // border: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                    selected: true,
                    trailing: CupertinoButton(
                      child: Text(
                        "Read More",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AnimalDetails(animal)))
                      },
                    ),
                    // hoverColor: const Color.fromARGB(163, 26, 26, 26),
                    onTap: () => {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => AnimalDetails(animal)))
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalDetails extends StatelessWidget {
  final Animal _animal;
  const AnimalDetails(this._animal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_animal.name),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.network('https://source.unsplash.com/random/',
                      fit: BoxFit.cover),
                  Text(_animal.name,
                      style: const TextStyle(
                          backgroundColor: Color.fromARGB(163, 26, 26, 26),
                          color: Colors.white,
                          fontSize: 20.0)),
                  Text(_animal.dato1,
                      style: const TextStyle(
                          backgroundColor: Color.fromARGB(163, 26, 26, 26),
                          color: Colors.white,
                          fontSize: 20.0))
                ],
              ),
            ),
          ),
        ));
  }
}
