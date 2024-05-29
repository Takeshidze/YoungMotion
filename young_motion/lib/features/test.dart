import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Состояние Bloc
class CounterState {
  final int counter;

  CounterState(this.counter);
}

// События Bloc
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.counter + 1);
    }
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    if (event is IncrementEvent) {
      // Действия при получении события IncrementEvent
    }
  }
}

// Главный экран
class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc пример'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Пример главного экрана с Bloc'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Счетчик: ${state.counter}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementEvent());
              },
              child: Text('Увеличить'),
            ),
          ],
        ),
      ),
    );
  }
}
