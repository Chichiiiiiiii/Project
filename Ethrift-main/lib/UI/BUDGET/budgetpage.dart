import 'package:flutter/material.dart';
import 'package:ethrift/widget/listtilebudgetwidget.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import 'budget_model.dart';
import 'budget_provider.dart';
/* Authored by: Carl Mike Aguila
Company: Thriftyal
Project: E-Thrift
Feature: Budget planner Page
Description: budget planner page ui allows to set budgets based on categories. And see the total budget, remaining, and spent.
 */

// Define a StatefulWidget for the BudgetPage
class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

// Define the State class for the BudgetPage
class _BudgetPageState extends State<BudgetPage> {
  // Method called when the stateful widget is initialized
  @override
  void initState() {
    // Access the BudgetProvider instance using Provider.of and fetch budget elements
    final budgetProvider = Provider.of<BudgetProvider>(context, listen: false);
    budgetProvider.getBudgetElement();
    super.initState(); // Call the initState method of the superclass
  }

  // Build method to construct the UI of the BudgetPage
  @override
  Widget build(BuildContext context) {
    // Get device screen dimensions
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Return the UI components wrapped in a Consumer widget to listen for changes in BudgetProvider
    return Consumer<BudgetProvider>(
      builder: (context, budgetProvider, _) {
        return Scaffold(
          backgroundColor: topGreen,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: greenbod,
            title: Text(
              "BUDGET PLANNER",
              style: TextStyle(fontWeight: FontWeight.bold, color: black),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display message if budget list is empty
              budgetProvider.budgetedList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: width * 0.65,
                            height: height * 0.25,
                            child: Image.asset(
                              "images/notbudgeted.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Budget Not Set For This Month",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )

                  // Display budget information if available
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0), // Adjust the top margin as needed
                      child: Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.95,
                          child: Container(
                            color:
                                primary, // Set your desired background color here
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Display total budget
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Total Budget",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\u{20B1} ${budgetProvider.totalBudget}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Display total spent
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total Spent",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\u{20B1} ${budgetProvider.totalspendAmount}",
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                // Display total remaining
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total Remaining",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\u{20B1} ${budgetProvider.totalRemaining}",
                                      style:
                                          const TextStyle(color: Colors.teal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
              // Display budgeted categories if available
              budgetProvider.budgetedList.isEmpty
                  ? const Text("")
                  : Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "BUDGETED CATEGORIES:",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
              // Display budgeted categories using ListView
              Visibility(
                visible: budgetProvider.budgetedList.isNotEmpty,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: budgetProvider.budgetedList.length,
                  itemBuilder: (context, index) {
                    BudgetModel category = budgetProvider.budgetedList[index];
                    return ListTileWidget(
                      category: category.categories,
                      icon: category.icon,
                      isBudgeted: true,
                      spendAmount:
                          budgetProvider.budgetedList[index].spendAmount,
                      remainingAmount: category.remainingAmount,
                      id: budgetProvider.budgetedList[index].id!,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Display non-budgeted categories using ListView
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "NOT BUDGETED THIS MONTH:",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: budgetProvider.nonBudgetedList.length,
                  itemBuilder: (context, index) {
                    BudgetModel category =
                        budgetProvider.nonBudgetedList[index];
                    return ListTileWidget(
                      category: category.categories,
                      icon: category.icon,
                      isBudgeted: category.isBudgeted,
                      spendAmount:
                          budgetProvider.nonBudgetedList[index].spendAmount,
                      id: budgetProvider.nonBudgetedList[index].id!,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
