import 'package:flutter/material.dart';
import 'package:gala_kita/views/widgets/text/text_list_plan_global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/form_data.dart';
import '../widgets/text/text_header_package.dart';

Widget buildPackageItem(
    BuildContext context, Map<String, dynamic> data, Color borderColor) {
  final price = data['price'];

  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Place your package item content here
          TextHeaderPackage(
              titleText: formatCurrency(price),
              planText: "${data['name']}",
              taglineText: "taglineText"),

          buildToppingsList(data["toppings"]),
        ],
      ),
    ),
  );
}

Widget buildToppingsList(List<dynamic> toppings) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: toppings.length,
      itemBuilder: (context, index) {
        final topping = toppings[index];

        return Column(
          children: [
            TextListPlanGlobal(
                textList: "${topping['topping']['value']}"
                          "${topping['topping']['tag']}"
            ),
          ],
        );
      });
}

String formatCurrency(amount) {
  final currencyFormatter = NumberFormat.currency(
    symbol: 'Rp  ',
    decimalDigits: 0,
    locale: 'id_ID',
  );
  return currencyFormatter.format(amount);
}
