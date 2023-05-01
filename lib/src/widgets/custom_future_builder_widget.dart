import 'package:flutter/material.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class CustomFutureBuilderWidget<TF, TS> extends StatelessWidget {
  const CustomFutureBuilderWidget({
    super.key,
    this.future,
    required this.onLoading,
    required this.onData,
    this.onError,
    this.onDataNull,
    this.transformData,
    this.onlyCustomException = true,
  });

  final Future<TF>? future;

  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, TS value) onData;
  final Widget Function(BuildContext context, dynamic valueError)? onError;
  final Widget Function(BuildContext context)? onDataNull;
  final TS Function(TF data)? transformData;
  final bool onlyCustomException;

  @override
  Widget build(BuildContext context) {
    if (future == null) {
      return const SizedBox.shrink();
    }

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          dynamic error = snapshot.error;

          if (onError != null) {
            return onError!(context, error);
          }

          if (onlyCustomException) {
            if (error is CustomException) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                SnackBarUtil.showSnackBar(
                  context,
                  CustomSnackBarWidget.forError(
                    error.message,
                  ),
                );
              });
            }
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SnackBarUtil.showSnackBar(
                context,
                CustomSnackBarWidget.forError(
                  error.toString(),
                ),
              );
            });
          }

          return const SizedBox.shrink();
        }

        if (snapshot.hasData) {
          if (snapshot.data == null) {
            if (onDataNull != null) {
              return onDataNull!(context);
            }

            return const SizedBox.shrink();
          }

          final TS data;
          if (transformData != null) {
            data = transformData!(snapshot.data as TF);
          } else {
            data = snapshot.data as TS;
          }

          return onData(context, data);
        }

        return onLoading(context);
      },
    );
  }
}
