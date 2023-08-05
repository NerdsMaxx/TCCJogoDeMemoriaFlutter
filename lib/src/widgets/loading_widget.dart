import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          width: 40,
        ),
        SelectableText(
          'Carregando',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}