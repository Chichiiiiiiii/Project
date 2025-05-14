import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 3)
class ValueOfTextForm {
  @HiveField(0)
  String categoryName;

  @HiveField(1)
  int expenseAmount;

  @HiveField(2)
  String title;

  @HiveField(3)
  String note;

  @HiveField(4)
  int selectedIndexHome;

  @HiveField(5)
  String categoryIcon;

  @HiveField(6)
  String bgColorOfContainer;

  @HiveField(7)
  int? id;

  ValueOfTextForm(
      this.categoryName,
      this.expenseAmount,
      this.title,
      this.note,
      this.selectedIndexHome,
      this.categoryIcon,
      this.bgColorOfContainer,
      this.id);
}
