import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../budget/budget_provider.dart';
import 'model.dart';

class AddListProvider extends ChangeNotifier {
  //Variables

  ValueNotifier<List<ValueOfTextForm>> incomeTextFormValues = ValueNotifier([]);

  bool isIncomeExpenseDataLoading = false;

  //Total spend of the displayed list
  int totalSpendValue = 0;
  void totalSpendAmount({BuildContext? context}) {
    final provider = Provider.of<BudgetProvider>(context!, listen: false);
    if (incomeTextFormValues.value.isNotEmpty &&
        provider.budgetedList.isNotEmpty) {
      totalSpendValue = 0; // Reset the totalSpendValue before calculating
      for (int i = 0; i < incomeTextFormValues.value.length; i++) {
        for (int j = 0; j < provider.budgetedList.length; j++) {
          if (incomeTextFormValues.value[i].categoryName ==
              provider.budgetedList[j].categories) {
            totalSpendValue += incomeTextFormValues.value[i].expenseAmount;
            break; // Break the inner loop once a match is found
          }
        }
      }
    }
    notifyListeners();
  }

  int selectedContainerIndex = 1;

  void changeColor({
    required int containerIndex,
  }) {
    selectedContainerIndex = containerIndex;
    notifyListeners();
  }
}
