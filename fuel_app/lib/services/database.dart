/*
* Fuel App
*
* EAD ASSIGNMENT - 2022
* IT19040172 Perera T.W.I.V <it19040172@my.sliit.lk>
* IT19035086 Amarathunga A.A.H.S.B. <it19035086@my.sliit.lk>
*/
import 'package:fuel_app/model/User.dart';
import 'package:fuel_app/model/customer.dart';
import 'package:fuel_app/model/station.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? db;
  Future<Database> get database async => db ??= await initDatabase();


  //Initial the database in user's device
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

  //Registration function for Customer
  Future<bool> insertCustomer(String firstname, String lastname, String email,
      String nic, String password) async {
    await initDatabase();
    int userID = await db!
        .insert('user', {'nic': nic, 'password': password, 'userType': 2});
    int k = await db!.insert('customer', {
      'userID': userID,
      'firstname': firstname,
      'lastname': lastname,
      'email': email
    });
    return k > 0;
  }

  //Registration fucntion for Station
  Future<bool> insertStation(String stationID, String name, String ownerName,
      String location, String nic, String password) async {
    print({'nic': nic, 'password': password, 'userType': 1});
    await initDatabase();
    int userID = await db!
        .insert('user', {'nic': nic, 'password': password, 'userType': 1});
    int k = await db!.insert('station', {
      'userID': userID,
      'stationID': stationID,
      'name': name,
      'ownerName': ownerName,
      'location': location,
    });
    print({
      'userID': userID,
      'stationID': stationID,
      'name': name,
      'ownerName': ownerName,
      'location': location,
    });
    print(k);
    return k > 0;
  }

  //Login function for both customer and station owner
  Future<int> login(String nic, String password) async {
    await initDatabase();
    final prefs = await SharedPreferences.getInstance();
    var result = await db!.rawQuery(
        """Select * from user WHERE nic = '$nic' AND password = '$password'""");
        print(result);
    if (result.isNotEmpty) {
      var user = result.map((e) => User.fromMap(e)).toList()[0];
      var userID = user.id;
      if (user.userType == 1) {
        var stations = await db!
            .rawQuery("""Select * from station WHERE userID='$userID'""");
        var stationUser = stations.map((e) => Station.fromMap(e)).toList()[0];

        await prefs.setString('stationID', stationUser.stationID ?? "");
        await prefs.setString('name', stationUser.name ?? "");
        await prefs.setString('location', stationUser.location ?? "");
        await prefs.setString('ownerName', stationUser.ownerName ?? "");
      } else if (user.userType == 2) {
        var customers = await db!
            .rawQuery("""Select * from customer WHERE userID='$userID'""");
        var customer = customers.map((e) => Customer.fromMap(e)).toList()[0];

        await prefs.setString('nic', user.nic ?? "");
        await prefs.setString('name', customer.firstname ?? "");
        await prefs.setString('email', customer.email ?? "");
      }
      return user.userType??0;
    }
    return 0;
  }
}
