import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/form_data.dart';
import '../widgets/text/text_header_package.dart';

Widget buildPackageItem(Map<String, dynamic> data) {
  // final planText = "${data['name']}"; // Extract planText
  // final id = "${data['id']}";
  // final simpanPilihanPaket=Provider.of<FormDataUndanangan>(context, listen:false);
  // simpanPilihanPaket.updatePilihPaket(planText,id);

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
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
            titleText: "Rp ${data['price']}",
            planText: "${data['name']}",
            taglineText: "taglineText"),

        buildToppingsList(data["toppings"]),
      ],
    ),
  );
}

Widget buildToppingsList(List<dynamic> toppings) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: toppings.length,
    itemBuilder: (context, index) {
      final topping = toppings[index];
      return ListTile(
        title: Text("${topping['topping']['name']}"),
        subtitle: Text("Price: ${topping['topping']['price']}"),
      );
    },
  );

}