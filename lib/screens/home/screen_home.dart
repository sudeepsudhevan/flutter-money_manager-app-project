import 'package:flutter/material.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/models/category/category_model.dart';
import 'package:money_manager/screens/category/category_add_popup.dart';
import 'package:money_manager/screens/category/screen_category.dart';
import 'package:money_manager/screens/home/widgets/bottom_navigation.dart';
import 'package:money_manager/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Money Manager'),
          centerTitle: true,
        ),
        bottomNavigationBar: const MoneyManagerBottomNavigation(),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext ctx, int updatedIndex, _) {
              return _pages[updatedIndex];
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedIndexNotifier.value == 0) {
              //Navigator.pushNamed(context, '/add-transaction');
              print('Add Transaction');
            } else {
              //Navigator.pushNamed(context, '/add-category');
              print('Add Category');

              showCategoryAddPopup(context);
              // final _sample = CategoryModel(
              //   id: DateTime.now().millisecondsSinceEpoch.toString(),
              //   name: 'Travel',
              //   type: CategoryType.expense,
              // );
              // CategoryDB().insertCategory(_sample);
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
