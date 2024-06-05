import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

TextEditingController billController = TextEditingController();
List<bool> _selected = [true, false, false, false];

double billAmount = 0.0;
double totalBillAmount = 0.0;
int tipIndex = 0;
double tipPercent = 0.0;
double tipAmount = 0.0;



class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var  lang = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FFFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF298F5E),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          lang.tippy,
          style: GoogleFonts.lobster(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: Column(
            children: [
              Text(
                'Enter Bill Amount',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF9EA1A1),
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                child: TextFormField(
                  controller: billController,
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '\$100.0',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Choose tip',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF9EA1A1),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: ToggleButtons(
                  isSelected: _selected,
                  fillColor: const Color(0xFF298F5E),
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('10%'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('15%'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('20%'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('25%'),
                    ),
                  ],
                  onPressed: (int selectedIndex) {
                    for (int index = 0; index < _selected.length; index++) {
                      setState(() {
                        _selected[index] = selectedIndex == index;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF298F5E,
                    ),
                  ),
                  child: Text(
                    'CALCULATE',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    billAmount = double.parse(billController.text.trim());
                    tipIndex = _selected.indexWhere((element) => element);
                    tipPercent = [0.1, 0.15, 0.2, 0.25][tipIndex];
                    setState(() {
                      tipAmount = double.parse(
                          (billAmount * tipPercent).toStringAsFixed(2));
                      totalBillAmount = double.parse(
                          (billAmount * tipAmount).toStringAsFixed(2));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Total Bill Amount',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF9EA1A1),
                  fontSize: 25,
                ),
              ),
              Text(
                '\$$totalBillAmount',
                style: GoogleFonts.roboto(
                    color: const Color(0xFF08502D),
                    fontSize: 50,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Tip Amount',
                style: GoogleFonts.roboto(
                  color: const Color(0xFF9EA1A1),
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                ),
              ),
              Text(
                "\$$tipAmount",
                style: GoogleFonts.roboto(
                  color: const Color(0xFF08502D),
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
