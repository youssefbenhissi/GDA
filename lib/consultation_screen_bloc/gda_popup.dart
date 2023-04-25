part of 'consultation_screen_widget.dart';

Widget _buildPopupDialog(BuildContext context) {
  final TextEditingController gdaController = TextEditingController();

  List<String> countries = [
    'Carthage',
    'La Medina',
    'Bab El Bhar',
    'Bab Souika',
    'El Omrane'
  ];
  return AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.gdaTitre),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(
          color: Colors.white12,
        ),
        SearchField<String>(
          controller: gdaController,
          hint: AppLocalizations.of(context)!.rechercheTitre,
          searchInputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), focusColor: Colors.white),
          // suggestionItemDecoration: const BoxDecoration(color: Colors.white),
          suggestions: countries
              .map(
                (e) => SearchFieldListItem<String>(
                  e,
                  item: e,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                          ),
                          height: 20.0,
                          width: 20.0,
                          child: const Center(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(e)
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(gdaController.text);
        },
        child: Text(AppLocalizations.of(context)!.validerTitre),
      ),
    ],
  );
}
