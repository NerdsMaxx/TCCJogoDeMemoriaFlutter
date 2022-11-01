import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/components/remove_button.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';
import 'package:jogo_de_memoria_flutter/src/notifiers/card.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({
    super.key,
    required this.cardNotifier,
    required this.card,
  });

  final CardNotifier cardNotifier;
  final CardModel card;

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  final ValueNotifier<bool> _write = ValueNotifier(false);
  bool _isAdded = false;

  String get _phrase => widget.card.phrase;
  set _phrase(String otherPhrase) => widget.card.phrase = otherPhrase;

  CardModel get _card => widget.card;

  set _cardFromNotifier(CardModel otherCard) =>
      widget.cardNotifier.card = CardModel.from(otherCard);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 310,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomCard(
              child: ValueListenableBuilder<bool>(
                valueListenable: _write,
                builder: ((context, value, child) {
                  if (value) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: TextFormField(
                            initialValue: _phrase,
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLines: 6,
                            style: GoogleFonts.montserrat(
                              fontSize: 26,
                            ),
                            cursorColor: const Color(0xff342f27),
                            onChanged: ((value) => _phrase = value),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!_isAdded && _phrase.isNotEmpty) {
                              _isAdded = true;
                              _cardFromNotifier = _card;
                            } else if (_isAdded && _phrase.isEmpty) {
                              _cardFromNotifier = CardModel.from(_card..isActive = false);
                            }
                            _write.value = !_write.value;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff342f27),
                          ),
                          child: Text(
                            (_isAdded) ? 'Editar' : 'Adicionar',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _isAdded,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _write.value = !_write.value;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff342f27),
                                ),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return TextButton(
                    onPressed: () => _write.value = !_write.value,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff342f27),
                    ),
                    child: Text(
                      (_phrase.isNotEmpty) ? _phrase : '+',
                      style: TextStyle(
                        fontSize: (_phrase.isNotEmpty) ? 26 : 64,
                        color: const Color(0xff342f27),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: RemoveButton(
              onPressed: () => _cardFromNotifier = CardModel.from(_card..isActive = false),
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
