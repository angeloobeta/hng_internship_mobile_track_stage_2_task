import '../../model/utilities/imports/generalImport.dart';

Widget textForm(
    {required BuildContext context,
    required bool maxLine,
    required String labelText,
    required TextEditingController controller}) {
  return TextField(
    maxLines: maxLine == true ? null : 1,
    controller: controller,
    decoration: const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    ),
  );
}
