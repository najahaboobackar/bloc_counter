import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcountapp/bloc/count_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountBloc(),
      child: MaterialApp(
        title: 'CounterApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'counter'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your value',
              style: TextStyle(fontSize: 27),
            ),
            BlocBuilder<CountBloc, CountState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      "${state.count}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    if (state.errorMessage.isNotEmpty)
                      Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    context.read<CountBloc>().add(Increment());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    context.read<CountBloc>().add(Decrement());
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Color.fromARGB(255, 163, 154, 216),
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                      height:
                          10), // Adding some space between the field and button
                  ElevatedButton(
                    onPressed: () {
                      final limit = int.tryParse(textController.text) ?? 0;
                      context.read<CountBloc>().add(SetLimit(limit));
                    },
                    child: const Text('Set Limit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
