import 'package:flutter/material.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Container(
        child: Column(
          children: const [
            SelectableText('Pontuações'),
            SizedBox(
              height: 20,
            ),
            //CustomFutureBuilderWidget(future: , onLoading: onLoading, onData: onData, onError: onError)
          ],
        ),
      ),
    );
  }
}
