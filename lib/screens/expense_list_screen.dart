import 'package:flutter/material.dart';
import 'add_expense_screen.dart';

class Expense {
  final String title;
  final double value;
  final DateTime date;
  final String category;
  final String? notes;

  Expense({
    required this.title,
    required this.value,
    required this.date,
    required this.category,
    this.notes,
  });
}

class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  _ExpenseListScreenState createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  final List<Expense> _expenses = [];

  void _navigateToAddExpenseScreen() async {
    final Expense? newExpense = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
    );

    if (newExpense != null) {
      setState(() {
        _expenses.add(newExpense);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Despesas"),
      ),
      body: _expenses.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma despesa cadastrada.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      expense.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Categoria: ${expense.category}\nData: ${expense.date.day}/${expense.date.month}/${expense.date.year}",
                    ),
                    trailing: Text(
                      "R\$ ${expense.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: expense.value < 0 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddExpenseScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
