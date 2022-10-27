import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';
import 'package:jogo_de_memoria_flutter/src/notifiers/card.dart';

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
  String? _phrase;

  @override
  void initState() {
    super.initState();

    _phrase = widget.card.phrase;
  }

  @override
  void dispose() {
    debugPrint('ID É ${widget.card.id}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: const Color(0xff342f27),
          width: 8,
        ),
      ),
      child: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: _write,
          builder: ((context, value, child) {
            if (_write.value) {
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
                      _write.value = !_write.value;
                      widget.cardNotifier.card = widget.card;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff342f27),
                    ),
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        widget.cardNotifier.card = CardModel.from(widget.card..isActive = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff342f27),
                    ),
                    child: const Text(
                      'Remover',
                      style: TextStyle(
                        fontSize: 22,
                      ),
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
                _phrase ?? '+',
                style: TextStyle(
                  fontSize: (_phrase != null) ? 26 : 64,
                  color: const Color(0xff342f27),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
