import 'package:blocp_rojet_git/bloc/counter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/themes.dart';

class CounterPagev3 extends StatelessWidget {
  const CounterPagev3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Statefull"),
      ),
      body: Center(child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterStateSecces || state is IntialCounterState) {
            return Text("Counter =>${state.counter}");
          } else if (state is CounterStateError) {
            return Column(
              children: [
                Text("Counter =>${state.counter}"),
                Text(state.ErrMessage, style: CutemTheme.errText),
              ],
            );
          } else {
            return Container();
          }
        },
      )),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrementEvent());
              }),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementEvent());
              }),
        ],
      ),
    );
  }
}
