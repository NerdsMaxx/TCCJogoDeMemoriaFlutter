import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth_context.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/create_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/grid_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';
import 'package:jogo_de_memoria_flutter/src/settings/widgets/custom_outline_input_border_setting.dart';

class CreationToolPage extends StatefulWidget {
  const CreationToolPage({
    super.key,
    this.cardsWidget,
  });

  final List<CreateOrEditCardFirstStepComponent>? cardsWidget;

  @override
  State<CreationToolPage> createState() => _CreationToolPageState();
}

class _CreationToolPageState extends State<CreationToolPage> {
  String _name = "";
  final _formKey = GlobalKey<FormState>();
  late List<CreateOrEditCardFirstStepComponent> _cardsWidget;
  final Set<Key> _previousKeys = {};
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _cardsWidget = widget.cardsWidget ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComponent(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 850,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: TextFormField(
                  controller: _textEditingController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }

                    return 'Está em branco.';
                  },
                  onFieldSubmitted: (value) => value = '',
                  autocorrect: false,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Nome do jogo da memória',
                    border: CustomOutlineInputBorderSetting(),
                  ),
                  onChanged: (value) => _name = value,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CreateButtonComponent(onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (_cardsWidget.isEmpty) {
                  showSnackBar(context, 'Não foram criadas cartas.');
                  return;
                }

                http.Response response = await http.post(
                  Uri.parse('http://127.0.0.1:8080/memoryGame'),
                  headers: {
                    HttpHeaders.contentTypeHeader: 'application/json',
                    HttpHeaders.acceptLanguageHeader: 'pt-BR',
                  },
                  body: jsonEncode(
                    {
                      'name': _name,
                      'username': AuthContext.of(context).auth.username,
                      'subjects': [],
                      'cards': _cardsWidget.where((cardWidget) {
                        if (cardWidget.card != null) {
                          CardModel card = cardWidget.card!;

                          if (_previousKeys.contains(card.id)) {
                            _previousKeys.remove(card.id);
                            _previousKeys.remove(card.otherCard!.id);
                            return false;
                          }

                          _previousKeys.add(card.id);
                          _previousKeys.add(card.otherCard!.id);
                          return true;
                        }

                        return false;
                      }).map((cardWidget) {
                        String question = '';
                        String answer = '';

                        if (cardWidget.card != null) {
                          CardModel card = cardWidget.card!;

                          if (card.typeCard == TypeCardEnum.question) {
                            question = card.phrase;
                            answer = card.otherCard!.phrase;
                          } else {
                            question = card.otherCard!.phrase;
                            answer = card.phrase;
                          }
                        }

                        return {
                          'question': question,
                          'answer': answer,
                        };
                      }).toList(),
                    },
                  ),
                );

                if (response.statusCode == 409) {
                  http.put(
                    Uri.parse('http://127.0.0.1:8080/memoryGame'),
                    headers: {
                      HttpHeaders.contentTypeHeader: 'application/json',
                      HttpHeaders.acceptLanguageHeader: 'pt-BR',
                    },
                    body: jsonEncode(
                      {
                        'name': _name,
                        // ignore: use_build_context_synchronously
                        'username': AuthContext.of(context).auth.username,
                        //'subjects': [],
                        'cards': _cardsWidget.where((cardWidget) {
                          if (cardWidget.card != null) {
                            CardModel card = cardWidget.card!;

                            if (_previousKeys.contains(card.id)) {
                              _previousKeys.remove(card.id);
                              _previousKeys.remove(card.otherCard!.id);
                              return false;
                            }

                            _previousKeys.add(card.id);
                            _previousKeys.add(card.otherCard!.id);
                            return true;
                          }

                          return false;
                        }).map((cardWidget) {
                          String question = '';
                          String answer = '';

                          if (cardWidget.card != null) {
                            CardModel card = cardWidget.card!;

                            if (card.typeCard == TypeCardEnum.question) {
                              question = card.phrase;
                              answer = card.otherCard!.phrase;
                            } else {
                              question = card.otherCard!.phrase;
                              answer = card.phrase;
                            }
                          }

                          return {
                            'question': question,
                            'answer': answer,
                          };
                        }).toList(),
                      }..addEntries([
                          (_name.isEmpty)
                              ? <String, Object>{}.entries.first
                              : <String, Object>{'name': _name}.entries.first,
                        ]),
                    ),
                  );
                }

                setState(
                  () {
                    _formKey.currentState!.activate();
                    showSnackBar(context, "Enviado com sucesso.");
                    _cardsWidget = [];
                    _name = '';
                    _textEditingController.clear();
                  },
                );
              }
            }),
            const SizedBox(height: 20),
            CreateOrEditCardsGridComponent(
              cardsWidget: _cardsWidget,
            ),
          ],
        ),
      ),
    );
  }
}
