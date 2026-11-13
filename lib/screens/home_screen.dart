import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter_app/contants/colors.dart';
import 'package:todo_list_flutter_app/providers/auth_provider.dart';
import 'package:todo_list_flutter_app/services/database_service.dart';
import 'package:todo_list_flutter_app/models/todo_model.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<List<TodoModel>>(context);
    final DatabaseService = Provider.of<DatabaseService>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(title: Text("My todos",style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
        }, icon: Icon(Icons.exit_to_app))
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(icons.add, color: Colors.white),
        backgroundColor: AppColors.primary,
        ),
    );
  }
}