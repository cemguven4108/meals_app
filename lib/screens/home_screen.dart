import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/enums/navigations.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/providers/category_provider.dart';
import 'package:meals_app/widgets/category_card.dart';
import 'package:meals_app/widgets/custom_gridview.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  List<Widget> buildNavigations(BuildContext context) {
    return Navigations.values.map((navigation) {
      return Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(navigation.key);
          },
          title: Text(navigation.name),
        ),
      );
    }).toList();
  }

  Future buildAddDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Category"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter name here...",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text != "") {
                  ref.watch(categoryProvider.notifier).addCategory(
                        Category(name: nameController.text),
                      );
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Meals App"),
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Navigation",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ...buildNavigations(context),
          ],
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return CustomGridview(
            children: [
              ...categoryList.map((category) {
                return Dismissible(
                  key: ValueKey(category.id),
                  child: CategoryCard(category: category),
                  onDismissed: (_) {
                    final categoryRef = ref.watch(categoryProvider.notifier);
                    categoryRef.delete(category);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.fixed,
                      content: Text("${category.name} Removed"),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          //can't insert at index for now, ToDo for that
                          categoryRef.addCategory(category);
                        },
                      ),
                    ));
                  },
                );
              }),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buildAddDialog(
          context,
          ref,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
