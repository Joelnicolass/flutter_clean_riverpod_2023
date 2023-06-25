class LocalDataBase {
  static final List<Map<String, dynamic>> _data = [];

  static Future<void> add(Map<String, dynamic> data) async {
    _data.add(data);
  }

  static Future<List<Map<String, dynamic>>> get() async {
    return _data;
  }

  static Future<void> delete(String id) async {
    _data.removeWhere((element) => element['id'] == id);
  }

  static Future<void> edit(Map<String, dynamic> data) async {
    _data.removeWhere((element) => element['id'] == data['id']);
    _data.add(data);
  }
}
