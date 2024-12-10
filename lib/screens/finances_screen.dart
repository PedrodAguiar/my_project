import 'package:flutter/material.dart';
import 'add_expense_screen.dart';
import 'expense_list_screen.dart';

class FinancesScreen extends StatelessWidget {
  final String username;
  final double userSaldo;
  final double userDespesas;
  final double userReceitas;
  final DateTime dateToday;

  const FinancesScreen({
    Key? key,
    required this.username,
    required this.userSaldo,
    required this.userDespesas,
    required this.userReceitas,
    required this.dateToday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá, $username!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saldo: R\$ ${userSaldo.toStringAsFixed(2)}"),
                    Text("Despesas: R\$ ${userDespesas.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.red)),
                    Text("Receitas: R\$ ${userReceitas.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.green)),
                    Text(
                        "Data de hoje: ${dateToday.day}/${dateToday.month}/${dateToday.year}"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddExpenseScreen()),
                );
              },
              child: const Text("Cadastrar Despesa"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExpenseListScreen()),
                );
              },
              child: const Text("Listar Despesas"),
            ),
          ],
        ),
      ),
    );
  }
}
