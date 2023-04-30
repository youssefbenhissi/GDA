part of 'donnees_techniques_widget.dart';

class WidgetField extends StatelessWidget {
  final String titre;
  final TextEditingController textEditingController;
  const WidgetField(
      {super.key, required this.titre, required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titre,
            style: const TextStyle(color: Colors.lightBlue),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: textEditingController,
          ),
        ),
      ],
    );
  }
}