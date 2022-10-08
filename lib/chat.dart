import 'package:bingo_application/modelclass.dart';
import 'package:get_it/get_it.dart';

class Chat {
  ModelClass modelClass = GetIt.instance.get<ModelClass>();
  String name = "";
  final apiKey = "AIzaSyChJLKaNpQ5no0pM_wnQtFv0TjVdRS58mc";

  Chat.setName();

  setName() {
    name = modelClass.value;
  }
}
