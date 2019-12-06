import 'package:quiver/core.dart';
import 'package:uuid/uuid.dart';

class TodoItem {
  final String uuid = Uuid().v1();
  final String text;
  bool done;

  TodoItem(this.text, [this.done = false]);

  @override
  int get hashCode => hash2(uuid.hashCode, text.hashCode);

  @override
  bool operator == (other) {
    return uuid == other.uuid;
  }

  @override
  String toString() {
    return text;
  }
}