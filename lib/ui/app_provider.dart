import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_minuteur_bloc/model/seconds_ticker.dart';
import 'package:mon_minuteur_bloc/ui/main_scaffold.dart';

import '../bloc/timer_bloc.dart';

class AppProvider extends StatelessWidget {
  final SecondsTicker secondsTicker = const SecondsTicker();
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TimerBloc(secondsTicker: secondsTicker),
      child: const MainScaffold(),
    );
  }

}