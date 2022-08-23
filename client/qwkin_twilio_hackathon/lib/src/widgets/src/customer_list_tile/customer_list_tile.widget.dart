import 'package:flutter/material.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_information_bottomsheet/customer_information_bottomsheet.widget.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Color(0xFFEEEEEE),
          builder: (BuildContext context) {
            return CustomerInformationBottomSheet();
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'João Carlos (5)',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('104 - São Gabriel'),
                Text('by Alian'),
                Text('at front gate'),
              ],
            ),
            Image.asset('assets/arrow.png')
          ],
        ),
      ),
    );
  }
}
