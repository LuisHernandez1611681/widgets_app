import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(

          // Wrap es igual que row solo que este cuando no tiene espacio lo pasa hacia abajo
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              // ElevatedButton
              ElevatedButton(
                child: const Text("Elevated Button"),
                onPressed: (){}
              ),
      
              // ElevatedButton disabled
              const ElevatedButton(
                onPressed: null,
                child: Text("Elevated Button Disabled")
              ),
      
              // ElevatedButton con icono
              ElevatedButton.icon(
                onPressed: () {}, 
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text("Elevated Icon"),
              ),

              // FilledButton
              FilledButton(
                onPressed: (){}, 
                child: const Text("Filled")
              ),

              // FilledButton con Icon
              FilledButton.icon(
                onPressed: () {}, 
                icon: const Icon(Icons.accessibility_new),
                label: const Text("Filled Icon")
              ),

              // OutlinedButton
              OutlinedButton(
                onPressed: (){}, 
                child: const Text('Outlined')
              ),

              // OutlinedButton con Icono
              OutlinedButton.icon(
                onPressed: (){}, 
                icon: const Icon(Icons.terminal),
                label: const Text('Outlined')
              ),

              // TextButton
              TextButton(
                onPressed: (){}, 
                child: const Text('Text')
              ),

              // TextButton con icono
              TextButton.icon(
                onPressed: (){}, 
                icon: const Icon(Icons.account_box_outlined),
                label: const Text('Text')
              ),

              // IconButton
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.app_registration_rounded)
              ),
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.app_registration_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white)
                ), 
              ),


              // Boton Personalizado
              const CustomButton()

            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Hola mundo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}