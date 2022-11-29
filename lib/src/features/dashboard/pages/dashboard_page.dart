import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth_context.dart';
import 'package:jogo_de_memoria_flutter/src/components/add_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_title_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/dashboard/components/card_dashboard_component.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    required this.auth,
  });

  final Auth auth;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future _future;

  @override
  void initState() {
    super.initState();

    _future = http.get(
      Uri.parse('http://127.0.0.1:8080/memory-game/${widget.auth.username}'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: 'pt-BR',
      },
    );
  }

  @override
  void didUpdateWidget(covariant DashboardPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    _future = http.get(
      Uri.parse('http://127.0.0.1:8080/memory-game/${widget.auth.username}'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: 'pt-BR',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComponent(
      showHomeButton: false,
      body: AuthContext(
        auth: widget.auth,
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }

            final http.Response response = snapshot.data;
            final List memoryGameList = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));

            final List<String> memoryGameNameList =
                memoryGameList.map<String>((memoryGame) => (memoryGame['name']!)).toList();

            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: getWidth(context, 0.9),
                //height: getHeight(context, 0.8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomTitleComponent(
                            title: 'Seus jogos de memória',
                          ),
                          AddButtonComponent(
                            onPressed: () => context.push('/creation_tool'),
                            size: 42,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 45,
                              runSpacing: 50,
                              children: memoryGameNameList
                                  .map<Widget>(
                                    (name) => CardDashboardComponent(
                                      name: name,
                                      memoryGameList: memoryGameList,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
