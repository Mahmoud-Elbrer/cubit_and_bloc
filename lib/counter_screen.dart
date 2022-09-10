import 'package:cubit_and_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  void _incrementCounter() {
    BlocProvider.of<CounterCubit>(context).increments();
   // todo : or Using this
  // context.read<CounterCubit>().increments()  ;
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocListener(
              listener: ((context, state) {
                if (state is CounterIsIncremented) {
                  Fluttertoast.showToast(msg: 'Counter ${BlocProvider.of<CounterCubit>(context).counter.toString()}') 
                }
              }),
              child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (_, counterState) {
                return Text(
                  BlocProvider.of<CounterCubit>(context).counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
