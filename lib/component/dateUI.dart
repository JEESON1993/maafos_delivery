import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';

class DateUI extends StatefulWidget {
  final String title;
  final String type;
  final DateTime date;
  final DateTime today;
  final update;
  const DateUI(
      {Key key, this.title, this.date, this.today, this.type, this.update})
      : super(key: key);

  @override
  _DateUIState createState() => _DateUIState();
}

class _DateUIState extends State<DateUI> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        firstDate: DateTime(widget.today.year),
        lastDate:
            DateTime(widget.today.year, widget.today.month, widget.today.day),
        context: context,
        initialDate: widget.date);
    if (pickedDate != null && pickedDate != widget.date)
      widget.update(pickedDate, widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: kHeadSubTitle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: kPrimaryColor),
                color: kPrimaryColorFaded,
              ),
              height: 40,
              padding: EdgeInsets.fromLTRB(4, 10, 10, 10),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/calendar.svg',
                    height: 30,
                    width: 20,
                    color: kPrimaryColor,
                  ),
                  Text(DateFormat('d MMM yyyy').format(widget.date)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
