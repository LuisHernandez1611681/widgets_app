import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    // Se elimina los snakcbar para solo mostrar 1
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      // Tener que a fuerzas para cerrar seleccionar una opcion
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Pariatur consectetur sit consequat adipisicing do nulla duis consequat nulla reprehenderit sint id tempor. Exercitation mollit deserunt amet nulla. Reprehenderit aliqua dolore mollit fugiat Lorem. Quis dolor dolore dolore voluptate cupidatat duis duis aliqua.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),

          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Magna velit consectetur nisi aliqua proident veniam labore duis duis. Non ut fugiat minim ullamco. Eu mollit ipsum non mollit enim sunt proident tempor et nostrud. Incididunt adipisicing elit labore labore et Lorem ut. Est laborum sit ullamco consequat cillum. ')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            const SizedBox(height: 10,),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Dialogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context)
      ),
    );
  }
}