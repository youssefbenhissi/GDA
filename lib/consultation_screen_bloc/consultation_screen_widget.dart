import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchfield/searchfield.dart';
part 'gda_popup.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    var state = context.currentLoginBloc.state;
    const List<String> months = [
      'janvier',
      'février',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'août',
      'septembre',
      'octobre',
      'novembre',
      'décembre',
    ];
    int monthNumber = 1;

    const List<String> years = [
      '2017',
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
      '2023',
      '2024'
    ];
    String gdaValue = "";
    String gouvernoratValue = "";
    TextEditingController gdaController = TextEditingController();
    ValueNotifier<String> _selectedItem = ValueNotifier<String>('janvier');
    String month = "janvier";
    String year = "2017";
    String _selectedOption = "Option 1";
    String code = "4154001";
    int idDelegation;
    List<String> _gouvernorats = [
      'TUNIS',
      'ARIANA',
      'BEN AROUS',
      'MANOUBA',
      'NABEUL',
      'ZAGHOUANE',
      'BIZERTE',
      'BEJA',
      'JENDOUBA',
      'KEF',
      'SILIANA',
      'SOUSSE',
      'MONASTIR',
      'MEHDIA',
      'SFAX',
      'KAIROUAN',
      'KASSERINE',
      'SIDI BOUZID',
      'GABES',
      'MEDENINE',
      'TATAOUINE',
      'GAFSA',
      'TOZEUR',
      'KEBELI',
    ];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.consultationTitre,
        )),
        body: Column(
          children: [
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.moisTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: month,
                        items: months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            month = newValue!;
                            switch (month) {
                              case 'janvier':
                                monthNumber = 1;
                                break;
                              case 'février':
                                monthNumber = 2;
                                break;
                              case 'mars':
                                monthNumber = 3;
                                break;
                              case 'avril':
                                monthNumber = 4;
                                break;
                              case 'mai':
                                monthNumber = 5;
                                break;
                              case 'juin':
                                monthNumber = 6;
                                break;
                              case 'juillet':
                                monthNumber = 7;
                                break;
                              case 'août':
                                monthNumber = 8;
                                break;
                              case 'septembre':
                                monthNumber = 9;
                                break;
                              case 'octobre':
                                monthNumber = 10;
                                break;
                              case 'novembre':
                                monthNumber = 11;
                                break;
                              case 'décembre':
                                monthNumber = 12;
                                break;
                            }
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.anneeTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: year,
                        items:
                            years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            year = newValue!;
                          });
                        },
                      ),
                    ),
                    state is! DecideurCentralLoginState
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.gouvernoratTitre,
                              style: const TextStyle(color: Colors.lightBlue),
                            ),
                          )
                        : const SizedBox.shrink(),
                    state is! DecideurCentralLoginState
                        ? InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(AppLocalizations.of(context)!
                                            .gouvernoratTitre),
                                        const Divider(
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                    content: SizedBox(
                                      height: 200,
                                      child: StatefulBuilder(
                                          builder: (context, setState) {
                                        return ListView.builder(
                                          itemCount: _gouvernorats.length,
                                          itemBuilder: (context, index) {
                                            return RadioListTile(
                                                title:
                                                    Text(_gouvernorats[index]),
                                                value: _gouvernorats[index],
                                                groupValue: _selectedOption,
                                                onChanged: (value) =>
                                                    setState(() {
                                                      _selectedOption = value!;
                                                    }));
                                          },
                                        );
                                      }),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .annulerTitre),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            context, _selectedOption),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .okTitre),
                                      ),
                                    ],
                                  );
                                },
                              ).then((value) => gouvernoratValue = value);
                            },
                            child: DropdownButton<String>(
                              isExpanded: true,
                              items: const [],
                              iconDisabledColor: Colors.black,
                              onChanged: (String? newValue) {},
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.gdaTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: AppColors.primaryblue,
                              ),
                              child: _buildPopupDialog(context)),
                        ).then((value) {
                          gdaValue = value;
                          gdaController.text = value;
                        });
                      },
                      child: TextField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        controller: gdaController,
                        enabled: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (gdaValue.isEmpty || gdaValue == null) {
                              context.currentConsultationBloc
                                  .choseMonthAndYear(month, year);
                              context.gNavigationService
                                  .openIndicateursSpecifiqueScreen(context,
                                      monthNumber, int.tryParse(year) ?? 2023);
                            } else {
                              setState(() {
                                switch (gdaController.text) {
                                  case 'سيدي مسعود':
                                    idDelegation = 4154;
                                    code = "4154001";
                                    break;
                                  case 'هندي الزيتونة':
                                    idDelegation = 4154;
                                    code = "4154002";
                                    break;
                                  case 'عين بومرّة':
                                    idDelegation = 4154;
                                    code = "4154003";
                                    break;
                                  case 'أولاد خلف الله':
                                    idDelegation = 4154;
                                    code = "4154004";
                                    break;
                                  case 'وشتاتية':
                                    idDelegation = 4154;
                                    code = "4154005";
                                    break;
                                  case 'الفريوات':
                                    idDelegation = 4154;
                                    code = "4154006";
                                    break;
                                  case 'الدخيلة':
                                    idDelegation = 4154;
                                    code = "4154007";
                                    break;
                                  case 'القفي':
                                    idDelegation = 4154;
                                    code = "4154008";
                                    break;
                                  case 'همّاد فرنيز':
                                    idDelegation = 4154;
                                    code = "4154009";
                                    break;
                                  case 'همّاد الدخايلية':
                                    idDelegation = 4154;
                                    code = "4154010";
                                    break;
                                  case 'غويرقة':
                                    idDelegation = 4154;
                                    code = "4154011";
                                    break;
                                  case 'الخضر':
                                    idDelegation = 4154;
                                    code = "4154012";
                                    break;
                                  case 'سرديانة 1':
                                    idDelegation = 4154;
                                    code = "4154013";
                                    break;
                                  case 'العفاسة':
                                    idDelegation = 4154;
                                    code = "4154014";
                                    break;
                                  case 'سرديانة 2':
                                    idDelegation = 4154;
                                    code = "4154015";
                                    break;
                                  case 'الزّهّار':
                                    idDelegation = 4154;
                                    code = "4154016";
                                    break;
                                  case 'الوديّات':
                                    idDelegation = 4154;
                                    code = "4154017";
                                    break;
                                  case 'الجواودة':
                                    idDelegation = 4154;
                                    code = "4154018";
                                    break;
                                  case 'أولاد بن حيمد':
                                    idDelegation = 4154;
                                    code = "4154019";
                                    break;
                                  case 'المعراجي':
                                    idDelegation = 4154;
                                    code = "4154020";
                                    break;
                                  case 'بير شهيدة':
                                    idDelegation = 4154;
                                    code = "4154021";
                                    break;
                                  case 'المشنوقة':
                                    idDelegation = 4154;
                                    code = "4154022";
                                    break;
                                  case 'أولاد الحاج':
                                    idDelegation = 4154;
                                    code = "4154023";
                                    break;
                                  case 'سعايدية':
                                    idDelegation = 4154;
                                    code = "4154024";
                                    break;
                                  case 'الدرابلية':
                                    idDelegation = 4154;
                                    code = "4154025";
                                    break;
                                  case 'قليب السّبط':
                                    idDelegation = 4154;
                                    code = "4154026";
                                    break;
                                  case 'العوايد':
                                    idDelegation = 4154;
                                    code = "4154027";
                                    break;
                                  case 'هندي الرقّاص':
                                    idDelegation = 4154;
                                    code = "4154028";
                                    break;
                                  case 'رواونة-طرابلسية':
                                    idDelegation = 4154;
                                    code = "4154029";
                                    break;
                                  case 'العرفات':
                                    idDelegation = 4154;
                                    code = "4154030";
                                    break;
                                  case 'أولاد شهيب':
                                    idDelegation = 4154;
                                    code = "4154031";
                                    break;
                                  case 'بودبوس':
                                    idDelegation = 4154;
                                    code = "4154032";
                                    break;
                                  case 'أولاد أحمد الصغير':
                                    idDelegation = 4154;
                                    code = "4154033";
                                    break;
                                  case 'الهواينية':
                                    idDelegation = 4154;
                                    code = "4154034";
                                    break;
                                  case 'العبابسة':
                                    idDelegation = 4154;
                                    code = "4154035";
                                    break;
                                  case 'الخريوع':
                                    idDelegation = 4154;
                                    code = "4154036";
                                    break;
                                  case 'العرايسية':
                                    idDelegation = 4154;
                                    code = "4154037";
                                    break;
                                  case 'هماد- فريوات':
                                    idDelegation = 4154;
                                    code = "4154038";
                                    break;
                                  case 'فطناسة':
                                    idDelegation = 4154;
                                    code = "4154039";
                                    break;
                                  case 'الدرع':
                                    idDelegation = 4156;
                                    code = "4156040";
                                    break;
                                  case 'الخشم':
                                    idDelegation = 4156;
                                    code = "4156041";
                                    break;
                                  case 'أولاد العيساوي':
                                    idDelegation = 4156;
                                    code = "4156042";
                                    break;
                                  case 'العواديد':
                                    idDelegation = 4156;
                                    code = "4156043";
                                    break;
                                  case 'الفجارنية':
                                    idDelegation = 4156;
                                    code = "4156044";
                                    break;
                                  case 'العجيلات':
                                    idDelegation = 4156;
                                    code = "4156045";
                                    break;
                                  case 'أولاد الحاج عمار':
                                    idDelegation = 4156;
                                    code = "4156046";
                                    break;
                                  case 'عين زانة':
                                    idDelegation = 4156;
                                    code = "4156047";
                                    break;
                                  case 'الزبارة للشراب':
                                    idDelegation = 4156;
                                    code = "4156048";
                                    break;
                                  case 'عين الكدية':
                                    idDelegation = 4156;
                                    code = "4156049";
                                    break;
                                  case 'المسلسل الشريشيرة':
                                    idDelegation = 4156;
                                    code = "4156050";
                                    break;
                                  case 'أولاد خليف':
                                    idDelegation = 4156;
                                    code = "4156051";
                                    break;
                                  case 'إدمان الحاسي':
                                    idDelegation = 4156;
                                    code = "4156052";
                                    break;
                                  case 'جليل عين البيضاء':
                                    idDelegation = 4156;
                                    code = "4156054";
                                    break;
                                  case 'العالية':
                                    idDelegation = 4156;
                                    code = "4156055";
                                    break;
                                  case 'الرميل':
                                    idDelegation = 4156;
                                    code = "4156056";
                                    break;
                                  case 'المرمر ( ميزاي)':
                                    idDelegation = 4156;
                                    code = "4156057";
                                    break;
                                  case 'فم النقاش (العبادلية)':
                                    idDelegation = 4156;
                                    code = "4156058";
                                    break;
                                  case 'المحافيظ':
                                    idDelegation = 4156;
                                    code = "4156059";
                                    break;
                                  case 'الرحمة':
                                    idDelegation = 4156;
                                    code = "4156060";
                                    break;
                                  case 'الزملة':
                                    idDelegation = 4156;
                                    code = "4156061";
                                    break;
                                  case 'العنق':
                                    idDelegation = 4156;
                                    code = "4156062";
                                    break;
                                  case 'أولاد فرحات':
                                    idDelegation = 4156;
                                    code = "4156063";
                                    break;
                                  case 'المرايحية':
                                    idDelegation = 4156;
                                    code = "4156064";
                                    break;
                                  case 'الجباس':
                                    idDelegation = 4156;
                                    code = "4156065";
                                    break;
                                  case 'أولاد ضيف الله':
                                    idDelegation = 4156;
                                    code = "4156066";
                                    break;
                                  case 'المنزل العالية':
                                    idDelegation = 4155;
                                    code = "4155067";
                                    break;
                                  case 'عين مستور':
                                    idDelegation = 4155;
                                    code = "4155068";
                                    break;
                                  case 'أولاد تليل':
                                    idDelegation = 4155;
                                    code = "4155069";
                                    break;
                                  case 'جبل الريحان':
                                    idDelegation = 4155;
                                    code = "4155070";
                                    break;
                                  case 'قصر اللمسة':
                                    idDelegation = 4155;
                                    code = "4155071";
                                    break;
                                  case 'لبيرة - زغدود':
                                    idDelegation = 4155;
                                    code = "4155072";
                                    break;
                                  case 'هندي العمري':
                                    idDelegation = 4155;
                                    code = "4155073";
                                    break;
                                  case 'أولاد بامر':
                                    idDelegation = 4155;
                                    code = "4155074";
                                    break;
                                  case 'السطوح':
                                    idDelegation = 4155;
                                    code = "4155075";
                                    break;
                                  case 'الـحريــة':
                                    idDelegation = 4155;
                                    code = "4155076";
                                    break;
                                  case 'القواعد':
                                    idDelegation = 4155;
                                    code = "4155077";
                                    break;
                                  case 'العباريش':
                                    idDelegation = 4155;
                                    code = "4155078";
                                    break;
                                  case 'جبل السرج':
                                    idDelegation = 4155;
                                    code = "4155079";
                                    break;
                                  case 'عريبة':
                                    idDelegation = 4157;
                                    code = "4157080";
                                    break;
                                  case 'الدبابشة':
                                    idDelegation = 4157;
                                    code = "4157081";
                                    break;
                                  case 'مسيوتة القطار':
                                    idDelegation = 4157;
                                    code = "4157082";
                                    break;
                                  case 'القطار أولاد عمر':
                                    idDelegation = 4157;
                                    code = "4157083";
                                    break;
                                  case 'صيادة':
                                    idDelegation = 4157;
                                    code = "4157084";
                                    break;
                                  case 'أولاد بن جـدو':
                                    idDelegation = 4157;
                                    code = "4157085";
                                    break;
                                  case 'البصيلات':
                                    idDelegation = 4157;
                                    code = "4157086";
                                    break;
                                  case 'الشواشي 2':
                                    idDelegation = 4158;
                                    code = "4158087";
                                    break;
                                  case 'قصرسويسين':
                                    idDelegation = 4158;
                                    code = "4158088";
                                    break;
                                  case 'أولاد عامر':
                                    idDelegation = 4158;
                                    code = "4158089";
                                    break;
                                  case 'السرجة 2':
                                    idDelegation = 4158;
                                    code = "4158090";
                                    break;
                                  case 'السرجة 1':
                                    idDelegation = 4158;
                                    code = "4158091";
                                    break;
                                  case 'للة سالمة 2':
                                    idDelegation = 4158;
                                    code = "4158092";
                                    break;
                                  case 'القنطرة - هنشير الشط':
                                    idDelegation = 4158;
                                    code = "4158093";
                                    break;
                                  case 'واد الفول':
                                    idDelegation = 4158;
                                    code = "4158094";
                                    break;
                                  case 'الشواشي 1':
                                    idDelegation = 4158;
                                    code = "4158095";
                                    break;
                                  case 'المناسة':
                                    idDelegation = 4158;
                                    code = "4158096";
                                    break;
                                  case 'اللواتة':
                                    idDelegation = 4158;
                                    code = "4158097";
                                    break;
                                  case 'الدغيمة':
                                    idDelegation = 4158;
                                    code = "4158098";
                                    break;
                                  case 'الخوالدية':
                                    idDelegation = 4158;
                                    code = "4158099";
                                    break;
                                  case ' الكبارة 2':
                                    idDelegation = 4159;
                                    code = "4159101";
                                    break;
                                  case 'صالح مختارة':
                                    idDelegation = 4159;
                                    code = "4159102";
                                    break;
                                  case 'عين سلطان':
                                    idDelegation = 4159;
                                    code = "4159103";
                                    break;
                                  case 'الكبارة':
                                    idDelegation = 4159;
                                    code = "4159104";
                                    break;
                                  case 'الفساقي':
                                    idDelegation = 4159;
                                    code = "4159105";
                                    break;
                                  case 'القصور':
                                    idDelegation = 4159;
                                    code = "4159106";
                                    break;
                                  case 'خميس العلويني':
                                    idDelegation = 4159;
                                    code = "4159107";
                                    break;
                                  case 'كاف الزاهي':
                                    idDelegation = 4159;
                                    code = "4159108";
                                    break;
                                  case 'قرعة البليدات 2':
                                    idDelegation = 4159;
                                    code = "4159109";
                                    break;
                                  case 'أولاد سويس':
                                    idDelegation = 4159;
                                    code = "4159110";
                                    break;
                                  case 'العجابنة':
                                    idDelegation = 4159;
                                    code = "4159111";
                                    break;
                                  case 'ثامر':
                                    idDelegation = 4159;
                                    code = "4159112";
                                    break;
                                  case 'العيايدة':
                                    idDelegation = 4159;
                                    code = "4159113";
                                    break;
                                  case 'الخبنة':
                                    idDelegation = 4159;
                                    code = "4159114";
                                    break;
                                  case 'المشرطات':
                                    idDelegation = 4161;
                                    code = "4161115";
                                    break;
                                  case 'بئر مسيكين':
                                    idDelegation = 4161;
                                    code = "4161116";
                                    break;
                                  case 'بئر الجديد المدرسة':
                                    idDelegation = 4161;
                                    code = "4161117";
                                    break;
                                  case 'بوساري':
                                    idDelegation = 4161;
                                    code = "4161118";
                                    break;
                                  case 'بئر الدولة الصعادلية':
                                    idDelegation = 4161;
                                    code = "4161119";
                                    break;
                                  case 'بئر المعيصرة':
                                    idDelegation = 4161;
                                    code = "4161120";
                                    break;
                                  case 'الزقب':
                                    idDelegation = 4161;
                                    code = "4161122";
                                    break;
                                  case 'النصرزعفرانة':
                                    idDelegation = 4161;
                                    code = "4161123";
                                    break;
                                  case 'أولاد عباس':
                                    idDelegation = 4161;
                                    code = "4161124";
                                    break;
                                  case 'أولاد جمعة':
                                    idDelegation = 4161;
                                    code = "4161125";
                                    break;
                                  case 'بوجدارية':
                                    idDelegation = 4161;
                                    code = "4161126";
                                    break;
                                  case 'الفتح':
                                    idDelegation = 4161;
                                    code = "4161127";
                                    break;
                                  case 'الفريجات 2':
                                    idDelegation = 4161;
                                    code = "4161128";
                                    break;
                                  case 'القطيطير-اولا عاشور':
                                    idDelegation = 4161;
                                    code = "4161129";
                                    break;
                                  case 'مرزوق الفرخ':
                                    idDelegation = 4160;
                                    code = "4160130";
                                    break;
                                  case 'بئر هويدي':
                                    idDelegation = 4160;
                                    code = "4160131";
                                    break;
                                  case 'الرماضنية':
                                    idDelegation = 4153;
                                    code = "4153132";
                                    break;
                                  case 'الرويسات':
                                    idDelegation = 4153;
                                    code = "4153133";
                                    break;
                                  case 'مطايرية':
                                    idDelegation = 4153;
                                    code = "4153134";
                                    break;
                                  case 'هماد الجلولي':
                                    idDelegation = 4153;
                                    code = "4153135";
                                    break;
                                  case 'البريكات المدينة':
                                    idDelegation = 4153;
                                    code = "4153136";
                                    break;
                                  case 'بئر الضواهر':
                                    idDelegation = 4152;
                                    code = "4152137";
                                    break;
                                  case 'بريكات العرقوب':
                                    idDelegation = 4152;
                                    code = "4152138";
                                    break;
                                  case 'المخصومة':
                                    idDelegation = 4152;
                                    code = "4152139";
                                    break;
                                  case 'العرقوب 2':
                                    idDelegation = 4152;
                                    code = "4152140";
                                    break;
                                  case 'الحمباز':
                                    idDelegation = 4152;
                                    code = "4152141";
                                    break;
                                  case 'الشوامخ':
                                    idDelegation = 4152;
                                    code = "4152142";
                                    break;
                                  case 'الحسيان':
                                    idDelegation = 4152;
                                    code = "4152143";
                                    break;
                                  case 'غنزور':
                                    idDelegation = 4152;
                                    code = "4152144";
                                    break;
                                  case 'شاكر':
                                    idDelegation = 4152;
                                    code = "4152145";
                                    break;
                                  case 'جبل وسلات':
                                    idDelegation = 4152;
                                    code = "4152146";
                                    break;
                                  case 'مقرة':
                                    idDelegation = 4152;
                                    code = "4152147";
                                    break;
                                  case 'ذراع التمار':
                                    idDelegation = 4151;
                                    code = "4151148";
                                    break;
                                  case 'الذويبات':
                                    idDelegation = 4151;
                                    code = "4151149";
                                    break;
                                  case 'العزاعزة':
                                    idDelegation = 4151;
                                    code = "4151150";
                                    break;
                                  case 'الفجيج':
                                    idDelegation = 4151;
                                    code = "4151151";
                                    break;
                                  case 'الحميدات':
                                    idDelegation = 4151;
                                    code = "4151152";
                                    break;
                                  case 'بئر الحاج صادق':
                                    idDelegation = 4151;
                                    code = "4151153";
                                    break;
                                  case 'بوقبرين':
                                    idDelegation = 4151;
                                    code = "4151154";
                                    break;
                                  case 'المريقب':
                                    idDelegation = 4151;
                                    code = "4157087";
                                    break;
                                  case 'اولاد نهار':
                                    idDelegation = 4151;
                                    code = "4152149";
                                    break;
                                  case 'كبارة 3':
                                    idDelegation = 4151;
                                    code = "4159115";
                                    break;
                                }
                              });
                              context.currentConsultationBloc
                                  .choseAllfields(month, year, year);
                              context.gNavigationService
                                  .openSpecificFicheGDAScreen(
                                      context,
                                      monthNumber,
                                      int.tryParse(year) ?? 2019,
                                      code);
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context)!.consulterTitre),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
