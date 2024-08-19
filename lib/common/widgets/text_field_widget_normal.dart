import 'package:flutter/material.dart';

class TextFieldWidgetNormal extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  const TextFieldWidgetNormal({
    super.key,
    required this.focusNode,
    required this.controller,
    this.onChanged,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    void loseFocus() {
      focusNode.unfocus();
    }

    void _applyBoldFormatting(
        TextEditingController controller, TextSelection selection) {
      final selectedText =
          controller.text.substring(selection.start, selection.end);
      final newText = controller.text.replaceRange(
        selection.start,
        selection.end,
        '<p>**$selectedText**</p>',
      );
      controller.value = TextEditingValue(
        text: newText,
        selection:
            TextSelection.collapsed(offset: selection.start + newText.length),
      );
    }

    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      // contextMenuBuilder: (context, editableTextState) {
      //   final TextEditingValue value = editableTextState.textEditingValue;
      //   final List<ContextMenuButtonItem> buttonItems =
      //       editableTextState.contextMenuButtonItems;
      //   final TextSelection selection = controller.selection;
      //   final bool isTextSelected = selection.start != selection.end;

      //   return AdaptiveTextSelectionToolbar(
      //     children: [
      //       if (isTextSelected)
      //         TextSelectionToolbarTextButton(
      //           padding: const EdgeInsets.symmetric(horizontal: 12),
      //           onPressed: () {
      //             // Apply bold formatting
      //             _applyBoldFormatting(controller, selection);
      //             editableTextState.hideToolbar();
      //           },
      //           child: const Text('Bold'),
      //         ),
      //     ],
      //     anchors: editableTextState.contextMenuAnchors,
      //   );
      // },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      // expands: true,
      maxLines: 6,
      minLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 30,
                ),
                onPressed: onPressed,
              ),
        prefixIcon: prefixIcon == null
            ? null
            : Directionality(
                textDirection: TextDirection.ltr,
                child: prefixIcon!,
              ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
            ),
      ),
    );
  }
}
