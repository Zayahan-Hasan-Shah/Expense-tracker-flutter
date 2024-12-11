import 'package:expense_repository/expense_repository.dart';

class Expense {
  String expenseId;
  Category category;
  DateTime date;
  int amount;
  String userName;
  int income;
  int totalExpense;
  int balance;

  Expense({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
    required this.userName,
    required this.income,
    required this.totalExpense,
    required this.balance,
  });

  static final empty = Expense(
    expenseId: '',
    category: Category.empty,
    date: DateTime.now(),
    amount: 0,
    userName: '',
    income: 0,
    totalExpense: 0,
    balance: 0,
  );

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      expenseId: expenseId,
      category: category,
      date: date,
      amount: amount,
      userName: userName,
      income: income,
      totalExpense : totalExpense,
      balance: balance,
    );
  }

  static Expense fromEntity(ExpenseEntity entity) {
    return Expense(
      expenseId: entity.expenseId,
      category: entity.category,
      date: entity.date,
      amount: entity.amount,
      userName: entity.userName,
      income: entity.income,
      totalExpense: entity.totalExpense,
      balance: entity.balance,
    );
  }
}
