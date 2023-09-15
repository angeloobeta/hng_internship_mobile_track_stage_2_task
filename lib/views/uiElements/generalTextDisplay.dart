import '../../model/utilities/imports/generalImport.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  const GeneralTextDisplay(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {super.key,
      this.textDecoration,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.sizeOf(context);
    Orientation orientation = MediaQuery.orientationOf(context);
    return Text(
      inputText,
      style: TextStyle(
          // add line height to the text widget if the design look different
          color: textColor,
          letterSpacing: letterSpacing ?? 0.02,
          fontSize: orientation == Orientation.portrait
              ? dynamicSize.height * (textFontSize! / 916)
              : dynamicSize.width * (textFontSize! / 916),
          fontWeight: textFontWeight,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? black,
          decorationStyle: TextDecorationStyle.solid),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}

TextStyle animatedTextStyle(
  double? textFontSize,
  FontWeight? textFontWeight,
  bool? isSelected, {
  required BuildContext context,
  double? letterSpacing,
  TextDecoration? textDecoration,
  Color? decorationColor,
}) {
  Size dynamicSize = MediaQuery.sizeOf(context);
  Orientation orientation = MediaQuery.orientationOf(context);
  return TextStyle(
      color: (isSelected == true) ? white : transparent,
      letterSpacing: letterSpacing ?? 0.02,
      fontSize: orientation == Orientation.portrait
          ? dynamicSize.height * (textFontSize! / 916)
          : dynamicSize.width * (textFontSize! / 916),
      fontWeight: textFontWeight,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? black,
      decorationStyle: TextDecorationStyle.solid);
}
