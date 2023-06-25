class DataStorage {
  String id;
  dynamic data;

  DataStorage({required this.id, required this.data});
}

class LocalDataBase {
  static final List<DataStorage> _states = [];

  static void addState(DataStorage state) {
    _states.add(state);
  }

  static void removeState(String id) {
    _states.removeWhere((element) => element.id == id);
  }

  static void updateState(DataStorage state) {
    _states.removeWhere((element) => element.id == state.id);
    _states.add(state);
  }

  static DataStorage getState(String id) {
    return _states.firstWhere((element) => element.id == id);
  }

  static List<DataStorage> getStates() {
    return _states;
  }

  static void clear() {
    _states.clear();
  }
}
