import 'package:flutter/material.dart';

class CustomFutureBuilderWidget<TF, TS, TE> extends StatelessWidget {
  const CustomFutureBuilderWidget({
    super.key,
    required this.future,
    required this.onLoading,
    required this.onData,
    required this.onError,
    this.onDataNull,
    this.transformData,
  });

  final Future<TF> future;

  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, TS value) onData;
  final Widget Function(BuildContext context, TE? valueError) onError;
  final Widget Function(BuildContext context)? onDataNull;
  final TS Function(TF data)? transformData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          TE? error = snapshot.error as TE?;
          return onError(context, error);
        }

        if (snapshot.hasData) {
          if (snapshot.data == null) {
            if (onDataNull != null) {
              return onDataNull!(context);
            }

            return const SizedBox.shrink();
          }
          
          final TS data;
          if(transformData != null) {
            data = transformData!(snapshot.data as TF);
          }
          else {
            data = snapshot.data as TS;
          }
          
          return onData(context, data);
        }

        return onLoading(context);
      },
    );
  }
}
