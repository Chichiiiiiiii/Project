import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ethrift/UI/addBudget/addbudgetprovider.dart';
import 'package:ethrift/UI/items/model.dart';
import 'package:ethrift/UI/items/provider.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../budget/budget_provider.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key, this.homePageItems});
  final ValueOfTextForm? homePageItems;

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  TextEditingController expenseAmountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isExpanded = true;
  GlobalKey widgetKey = GlobalKey();
  double childHeight = 0.0;
  Icon? iconCategory;
  Color bgColorOfContainer = Colors.transparent;
  bool isEdit = false;
  String categoryName = "";

  @override
  void initState() {
    super.initState();

    if (widget.homePageItems != null &&
        widget.homePageItems!.title.isNotEmpty) {
      isEdit = true;
      final expenseAmount = widget.homePageItems!.expenseAmount;
      final title = widget.homePageItems!.title;
      final note = widget.homePageItems!.note;
      final selectedWidgetContainerIndex =
          widget.homePageItems!.selectedIndexHome;
      expenseAmountController.text = expenseAmount.toString();
      titleController.text = title;
      noteController.text = note;
      log(selectedWidgetContainerIndex.toString(),
          name: "this is the widget container index");
      final homeProvider = Provider.of<AddListProvider>(context, listen: false);
      homeProvider.selectedContainerIndex = selectedWidgetContainerIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer3<AddListProvider, AddBudgetProvider, BudgetProvider>(
      builder: (BuildContext context, snapshot, snapshot2, snapshot3, _) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: white,
            title: Text(
              "Main Account",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: black,
              ),
            ),
            actions: [
              isEdit
                  ? IconButton(
                      onPressed: () {
                        //Deleting the category from the list
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: black,
                      ),
                    )
                  : Container(),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            snapshot.changeColor(containerIndex: 1);
                          },
                          child: Material(
                            color: white,
                            elevation: 8,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            shadowColor: snapshot.selectedContainerIndex == 1
                                ? Colors.white
                                : black,
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: snapshot.selectedContainerIndex == 1
                                      ? teal
                                      : Colors.grey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.arrow_upward_outlined,
                                    color: snapshot.selectedContainerIndex == 1
                                        ? Colors.green
                                        : primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            snapshot.changeColor(containerIndex: 2);
                          },
                          child: Material(
                            color: white,
                            elevation: 8,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            shadowColor: snapshot.selectedContainerIndex == 2
                                ? Colors.white
                                : black,
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                  color: snapshot.selectedContainerIndex == 2
                                      ? teal
                                      : Colors.grey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Expense",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:
                                          snapshot.selectedContainerIndex == 2
                                              ? black
                                              : primary,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    color: snapshot.selectedContainerIndex == 2
                                        ? Colors.red
                                        : primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    snapshot.selectedContainerIndex == 1
                        ? TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: teal,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: teal),
                              ),
                              hintText: "Enter Amount",
                              hintStyle: TextStyle(
                                color: primary,
                              ),
                            ),
                          )
                        : TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: teal,
                            controller: expenseAmountController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: teal),
                              ),
                              hintText: "Enter Amount",
                              hintStyle: TextStyle(
                                color: primary,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: teal,
                      controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: teal),
                        ),
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: teal,
                      controller: noteController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: teal),
                        ),
                        hintText: "Note",
                        hintStyle: TextStyle(
                          color: primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    snapshot.selectedContainerIndex == 1
                        ?
                        //container for the expense
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: teal),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                key: widgetKey,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Categories : ",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        snapshot2.expenseCategoryName.isEmpty
                                            ? Text(
                                                "",
                                                style: TextStyle(
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : Text(
                                                snapshot2.expenseCategoryName,
                                                style: TextStyle(
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: isExpanded ? 130 : childHeight + 20,
                                    child: Wrap(
                                      children: List.generate(
                                        isExpanded
                                            ? 5
                                            : snapshot2
                                                .expenseContainerList.length,
                                        (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              categoryName = snapshot2
                                                  .expenseContainerList[index]
                                                  .text;
                                              snapshot2
                                                  .expenseSelectedContainerColorChange(
                                                      snapshot2
                                                          .expenseContainerList[
                                                              index]
                                                          .containerIndex);
                                              iconCategory = Icon(snapshot2
                                                  .expenseContainerList[index]
                                                  .icon);
                                              bgColorOfContainer = snapshot2
                                                  .expenseContainerList[index]
                                                  .bgcolor;
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              padding: const EdgeInsets.only(
                                                right: 5.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                border: Border.all(
                                                  color: snapshot2
                                                              .expenseContainerList[
                                                                  index]
                                                              .containerIndex ==
                                                          snapshot2
                                                              .expenseSelectedIndex
                                                      ? snapshot2
                                                          .expenseContainerList[
                                                              index]
                                                          .bgcolor
                                                      : primary,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: white,
                                                    radius: 15,
                                                    child: Icon(
                                                      snapshot2
                                                          .expenseContainerList[
                                                              index]
                                                          .icon,
                                                      size: 20,
                                                      color: snapshot2
                                                                  .expenseContainerList[
                                                                      index]
                                                                  .containerIndex ==
                                                              snapshot2
                                                                  .expenseSelectedIndex
                                                          ? snapshot2
                                                              .expenseContainerList[
                                                                  index]
                                                              .bgcolor
                                                          : primary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      snapshot2
                                                          .expenseContainerList[
                                                              index]
                                                          .text,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        isExpanded
                                            ? ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: white,
                                                    elevation: 0),
                                                onPressed: () {
                                                  findHeight();
                                                  setState(() {
                                                    isExpanded = false;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_downward_outlined,
                                                  size: 12,
                                                  color: black,
                                                ),
                                                label: Text(
                                                  "View All",
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 12),
                                                ),
                                              )
                                            : ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: white,
                                                    elevation: 0),
                                                onPressed: () {
                                                  setState(() {
                                                    isExpanded = true;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_upward_outlined,
                                                  size: 12,
                                                  color: black,
                                                ),
                                                label: Text(
                                                  "View Less",
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 12),
                                                )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 50,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  findHeight() {
    final RenderBox renderBox =
        widgetKey.currentContext!.findRenderObject() as RenderBox;
    childHeight = renderBox.size.height;
  }
}
