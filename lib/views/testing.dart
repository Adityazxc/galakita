import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE invitation(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        url TEXT,        
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'galakita.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<int> createItem(String? title, String? url) async {
    final db = await DatabaseHelper.db();

    final data = {'title': title, 'url': url};
    final id = await db.insert('invitation', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('invitation', orderBy: "id");
  }

  // Get a single item by id
  //We dont use this method, it is for you if you want it.
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('invitation', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? url) async {
    final db = await DatabaseHelper.db();

    final data = {
      'title': title,
      'url': url,

      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('invitation', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("invitation", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All data
  List<Map<String, dynamic>> myData = [];

  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  void history() async {
    final database = await openDatabase('galakita.db');

    final tableName = "invitation";

    final tableInfo = await database.rawQuery('PRAGMA table_info($tableName)');

    for (var row in tableInfo) {
      print(row);
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
    history();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();


  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showMyForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingData = myData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _urlController.text = existingData['url'];

    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      // Save new data
                      if (id == null) {
                        await addItem();
                      }

                      if (id != null) {
                        await updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _urlController.text = '';


                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

// Insert a new data to the database
  Future<void> addItem() async {
    final title = _titleController.text??'';
    final url = _urlController.text??'';

    if (title != null && url != null) {
      await DatabaseHelper.createItem(title, url);
      _refreshData();
    }
  }

  // Update an existing data
  Future<void> updateItem(int id) async {
    final title = _titleController.text??'';
    final url = _urlController.text??'';

    if (title != null && url != null) {
      await DatabaseHelper.updateItem(id, title, url);
      _refreshData();
    }
  }

  // Delete an item
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted!'), backgroundColor: Colors.green));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite CRUD'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : myData.isEmpty
              ? const Center(child: Text("No Data Available!!!"))
              : ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) => Card(
                    color: index % 2 == 0 ? Colors.green : Colors.green[200],
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                        title: Text(myData[index]['title']),
                        subtitle: Column(
                          children: [
                            Text(myData[index]['url']),

                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    showMyForm(myData[index]['id']),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    deleteItem(myData[index]['id']),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),
    );
  }
}
