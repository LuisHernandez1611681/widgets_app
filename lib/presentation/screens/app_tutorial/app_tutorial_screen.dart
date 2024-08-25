import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title,  this.caption,  this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida', 
    'Deserunt irure nostrud magna incididunt in pariatur esse sint.', 
    'assets/images/1.png'
  ),
  SlideInfo(
    'Entrega rapida', 
    'Consequat ut aliqua exercitation consectetur laborum quis duis.', 
    'assets/images/2.png'
  ),
  SlideInfo(
    'Disfruta la comida', 
    'Fugiat voluptate ex aliqua ut nisi aliquip consequat exercitation.', 
    'assets/images/3.png'
  )
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => 
              _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            ).toList()
          ),

          // Boton de salir
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir')
            )
          ),

          // Boton de ultima pantalla
          endReached ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(), 
                  child: const Text('Comenzar') 
                ),
              )
            )
          : const SizedBox()
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle,)
          ],
        ),
      ), 
    );
  }
}