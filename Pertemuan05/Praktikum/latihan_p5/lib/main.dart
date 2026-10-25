import 'package:flutter/material.dart';

void main() {
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
        useMaterial3: false,
      ),
      home: const FirstScreen(), // Diarahkan ke MyImages
    );
  }
}

class MyImages extends StatelessWidget {
  const MyImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.network(
          'https://www.radarbandung.id/wp-content/uploads/2022/09/ranca-upas.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyImageAsset extends StatelessWidget {
  const MyImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.asset(
          'images/ulbi.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyCustomFont extends StatelessWidget {
  const MyCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const Center(
        child: Text(
          'Custom Font',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - ListView'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text('1', style: TextStyle(fontSize: 50)),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text('2', style: TextStyle(fontSize: 50)),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text('3', style: TextStyle(fontSize: 50)),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text('4', style: TextStyle(fontSize: 50)),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollingScreenList extends StatelessWidget {
  const ScrollingScreenList({super.key});

  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - ListView Dinamis'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ScrollingScreenListBuilder extends StatelessWidget {
  const ScrollingScreenListBuilder({super.key});

  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - ListView Builder'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollingScreenListSeparated extends StatelessWidget {
  const ScrollingScreenListSeparated({super.key});

  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - Separated'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 4,
            color: Colors.white,
          );
        },
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  final String massage = 'Hello from First Screen!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - First Screen'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('pindah Screen'),
          onPressed: () {
            Navigator.push(
              context,
              // Hapus 'const' di depan SecondScreen
              MaterialPageRoute(builder: (context) => SecondScreen(massage)),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String massage;

  // Terima parameter massage pada konstruktor
  const SecondScreen(this.massage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5 - Second Screen'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan data yang diterima dari FirstScreen
            Text(massage),
            const SizedBox(height: 16),
            OutlinedButton(
              child: const Text('Kembali ke First Screen'),
              onPressed: () {
                // Kembali ke FirstScreen
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

