import 'package:fuel_app/model/User.dart';
import 'package:fuel_app/model/customer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? db;
  Future<Database> get database async => db ??= await initDatabase();
  initDatabase() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'user.db');
    var sqlUser =
        "CREATE TABLE IF NOT EXISTS user (id INTEGER PRIMARY KEY,nic TEXT,password TEXT,userType INTEGER)";
    var sqlCustomer =
        "CREATE TABLE IF NOT EXISTS customer (id INTEGER PRIMARY KEY,userID INTEGER ,firstname TEXT, lastname TEXT,email TEXT)";
    var sqlStation =
        "CREATE TABLE IF NOT EXISTS station (id INTEGER PRIMARY KEY,userID INTEGER , stationID TEXT, name TEXT,ownerName TEXT, location TEXT)";
    db = await openDatabase(
      path,
      version: 2,
      onCreate: (db, int version) async => {
        await db.execute(sqlUser),
        await db.execute(sqlCustomer),
        await db.execute(sqlStation)
      },
    );
    print(db);
  }

  Future<bool> insertCustomer(String firstname, String lastname, String email,
      String nic, String password) async {
    await initDatabase();
    int userID = await db!
        .insert('user', {'nic': nic, 'password': password, 'userType': 1});
    int k = await db!.insert('customer', {
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'email': email
    });
    return k > 0;
  }

  Future<bool> insertStation(String stationID, String name, String ownerName,
      String location, String nic, String password) async {
    await initDatabase();
    int userID = await db!
        .insert('user', {'nic': nic, 'password': password, 'userType': 1});
    int k = await db!.insert('customer', {
      'userID': userID,
      'stationID': stationID,
      'name': name,
      'ownerName': ownerName,
      'location': location,
    });
    return k > 0;
  }

  Future<bool> login(String nic, String password) async {
    await initDatabase();
    var result = await db!.rawQuery(
        """Select * from user WHERE nic = '$nic' AND password = '$password'""");
    return result.map((e) => User.fromMap(e)).toList().isNotEmpty;
  }
}
