import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.back = false,
    this.body,
  });

  final bool back;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SelectableText(
              'Jogo de memória',
              maxLines: 1,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Visibility(
              visible: getIt<Auth>().isValid(),
              child: _Profile(),
            ),
          ],
        ),
        automaticallyImplyLeading: back,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body,
        ),
      ),
    );
  }
}

class _Profile extends StatefulWidget {
  @override
  State<_Profile> createState() => _ProfileState();
}

class _ProfileState extends State<_Profile> {
  final Auth auth = getIt<Auth>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          enabled: false,
          child: SizedBox(
            width: 445,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      auth.username!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SelectableText(
                      auth.email!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SelectableText(
                      auth.type!.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            child: Row(
              children: const [
                Expanded(child: Text('Sair')),
              ],
            ),
            onTap: () => context.router.push(
              const InitialRoute(),
            ),
          ),
        ),
      ],
      icon: const Icon(
        Icons.person_outline_rounded,
      ),
      iconSize: 50,
    );
  }
}
