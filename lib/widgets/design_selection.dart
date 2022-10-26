import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planor/models/selectable.dart';
import 'package:planor/widgets/design_input.dart';

class DesignSelection<T extends Selectable?> extends StatelessWidget {
  const DesignSelection({
    Key? key,
    this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final T? value;
  final String hint;
  final List<T> items;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DesignInput(
      hint: hint,
      textEditingController: TextEditingController(
        text: value?.text,
      ),
      onTap: () => showSelectionDialog(context),
    );
  }

  Future<void> showSelectionDialog(BuildContext context) async {
    final filtered =
        items.where((i) => i!.text.isNotEmpty && i.enabled).toList();

    final T? result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Selecionar Tipo de Atividade'),
        content: SizedBox(
          width: Get.width - 32,
          child: ListView.builder(
            itemCount: filtered.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).pop(filtered[i]);
                },
                child: Text(
                  filtered[i]?.text ?? 'Nao encontrado',
                ),
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    if (result != null) onChanged(result);
  }
}
