import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

part 'search_component_logic.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  late final _SearchComponentLogic logic = _SearchComponentLogic();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtil.widthFactor(context, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: CustomTextFieldFormWidget(
              hintText: 'Pesquisa',
              onChanged: logic.onChangedSearch(context),
            ),
          ),
        ],
      ),
    );
  }
}
