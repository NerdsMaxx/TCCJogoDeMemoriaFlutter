import 'dart:convert';
import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/grid_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';
import 'package:jogo_de_memoria_flutter/src/settings/widgets/custom_outline_input_border_setting.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/text_button_widget.dart';

class CreationToolPage extends StatefulWidget {
  const CreationToolPage({
    super.key,
    this.memoryGameName,
    this.cardsWidget,
  });

  final String? memoryGameName;
  final List<CreateOrEditCardFirstStepComponent>? cardsWidget;

  @override
  State<CreationToolPage> createState() => _CreationToolPageState();
}

class _CreationToolPageState extends State<CreationToolPage> {
  String _name = '';
  final _formKey = GlobalKey<FormState>();
  late List<CreateOrEditCardFirstStepComponent> _cardsWidget;
  final Set<Key> _previousKeys = {};
  late TextEditingController _textEditingController;
  bool _updateCards = true;

  @override
  void initState() {
    super.initState();

    _updateCards = widget.cardsWidget != null;

    _name = widget.memoryGameName ?? _name;
    _textEditingController = TextEditingController.fromValue(TextEditingValue(text: _name));
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
                  enabled: !_updateCards,
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
            TextButtonWidget(
              text: (_updateCards) ? 'Editar' : 'Criar',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (_cardsWidget.isEmpty) {
                    showSnackBar(context, 'Não foram criadas cartas.');
                    return;
                  }

                  if (_updateCards) {
                    http.put(
                      Uri.parse(
                          'http://127.0.0.1:8080/memory-game/${await Auth.instance().username}/${widget.memoryGameName!}'),
                      headers: {
                        HttpHeaders.contentTypeHeader: 'application/json',
                        HttpHeaders.acceptLanguageHeader: 'pt-BR',
                      },
                      body: jsonEncode(
                        {
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
                  } else {
                    await http.post(
                      Uri.parse('http://127.0.0.1:8080/memory-game'),
                      headers: {
                        HttpHeaders.contentTypeHeader: 'application/json',
                        HttpHeaders.acceptLanguageHeader: 'pt-BR',
                      },
                      body: jsonEncode(
                        {
                          'name': _name,
                          'username': await Auth.instance().username,
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
                  }

                  // ignore: use_build_context_synchronously
                  showSnackBar(context, "Enviado com sucesso.");
                  // ignore: use_build_context_synchronously
                  context.go('/dashboard');
                }
              },
            ),
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
