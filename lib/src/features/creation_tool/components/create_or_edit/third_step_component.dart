import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class _ParametersContext extends InheritedWidget {
  const _ParametersContext({
    required this.card,
    required this.isWriting,
    required super.child,
  });

  final CardModel card;
  final ValueNotifier<bool> isWriting;

  static _ParametersContext of(BuildContext context) {
    final _ParametersContext? result =
        context.dependOnInheritedWidgetOfExactType<_ParametersContext>();
    assert(result != null, '_DataInherited não foi encontrado no contexto.');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class CreateOrEditACardThirdStepComp extends StatefulWidget {
  const CreateOrEditACardThirdStepComp({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  State<CreateOrEditACardThirdStepComp> createState() => _CreateOrEditACardThirdStepCompState();
}

class _CreateOrEditACardThirdStepCompState extends State<CreateOrEditACardThirdStepComp> {
  final ValueNotifier<bool> _isWriting = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return _ParametersContext(
      card: widget.card,
      isWriting: _isWriting,
      child: CustomCardComponent(
        child: ValueListenableBuilder(
          valueListenable: _isWriting,
          builder: (_, value, __) {
            if (value) {
              return const _TextAddMode();
            }

            return const _TextAddButton();
          },
        ),
      ),
    );
  }
}

class _TextAddButton extends StatelessWidget {
  const _TextAddButton();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isWaiting = _ParametersContext.of(context).isWriting;
    String phrase = _ParametersContext.of(context).card.phrase;

    return Center(
      child: TextButton(
        onPressed: () => isWaiting.value = !isWaiting.value,
        child: AutoSizeText(
          (phrase.isNotEmpty) ? phrase : '+',
          wrapWords: false,
          style: TextStyle(
            fontSize: (phrase.isNotEmpty) ? 26 : 64,
            color: ColorsPalette.colorDefault,
          ),
        ),
      ),
    );
  }
}

class _TextAddMode extends StatelessWidget {
  const _TextAddMode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TextFormField(),
        const SizedBox(height: 20),
        _AddButton(),
        const SizedBox(height: 10),
        _CancelButton(),
      ],
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField();

  @override
  Widget build(BuildContext context) {
    String phrase = _ParametersContext.of(context).card.phrase;

    return SizedBox(
      width: 180,
      height: 180,
      child: TextFormField(
        initialValue: phrase,
        autofocus: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        maxLines: 6,
        style: GoogleFonts.montserrat(
          fontSize: 26,
        ),
        cursorColor: ColorsPalette.colorDefault,
        onChanged: ((value) => _ParametersContext.of(context).card.phrase = value),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isWriting = _ParametersContext.of(context).isWriting;
    CardModel card = _ParametersContext.of(context).card;
    String phrase = card.phrase;

    return ElevatedButton(
      onPressed: () {
        isWriting.value = !isWriting.value;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsPalette.colorDefault,
      ),
      child: Text(
        (phrase.isNotEmpty) ? 'Editar texto' : 'Adicionar texto',
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isWriting = _ParametersContext.of(context).isWriting;

    return ElevatedButton(
      onPressed: () => isWriting.value = !isWriting.value,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff342f27),
      ),
      child: const Text(
        'Cancelar',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
