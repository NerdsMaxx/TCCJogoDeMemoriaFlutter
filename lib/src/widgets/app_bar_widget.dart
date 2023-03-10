import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectableText(
              'Jogo de memória',
              maxLines: 1,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
            ),
            Visibility(
              visible: getIt<Auth>().isValid(),
              child: _Profile(),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
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
  final bool _showInfo = false;
  final Auth auth = getIt<Auth>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          enabled: false,
          child: SizedBox(
            width: 400,
            child: Card(
              child: Column(
                children: [
                  SelectableText(
                    'Username: ${auth.username}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SelectableText(
                    'Email: ${auth.email}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
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
