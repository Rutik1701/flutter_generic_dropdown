import 'package:flutter/material.dart';

class CustomGenericDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final String Function(T) labelBuilder;
  final ValueChanged<T> onChanged;

  const CustomGenericDropdown({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    this.value,
    this.hint = 'Select',
  });

  void _openMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(hint),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return ListTile(
                title: Text(labelBuilder(item)),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(item);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openMenu(context),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value == null ? hint : labelBuilder(value as T),
              style: TextStyle(
                color: value == null ? Colors.grey : Colors.black,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
