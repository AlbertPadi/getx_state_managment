import 'package:get/state_manager.dart';

class AnimalsController extends GetxController {
  // obs Agrega la posibilidad de que sea una variable observable en nuestros widgets
  var list = [].obs;

  //Metodos para agregar y eliminar items de la lista

  //Agregar
  add(item) => list.add(item);
  //Remover
  remove(index) => list.remove(index);
}
