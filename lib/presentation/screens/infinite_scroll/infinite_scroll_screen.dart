import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    
    // Ejecutar funcion cuando lleguemos al final
    scrollController.addListener(() {
      // Si la posicion donde nos encontramos + 500
      if( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ) {
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if(isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    // Verificamos que el componente este montado
    if(!isMounted) return;
    setState(() {});

    // Movemos el scroll cuando aparezcan nuevas imagenes solo si se encuentra cercas
    moveScrollToBottom();
  }

  // Pedir nuevas imagenes y refrescar dando hacia arriba
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    addFiveImages();

    setState(() {});
  }


  // Ejecutarse solo si nos encontramos cercas del final
  void moveScrollToBottom() {
    if( (scrollController.position.pixels + 100) <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }


  // Cargar otras 5 imagenes
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover, // Hacemos que cubra la imagen toda la zona que tiene como espacio
                width: double.infinity, // Definimos el width
                height: 300, // Definimos el height
                placeholder: const AssetImage('assets/images/jar-loading.gif'),  // Imagen de cargando
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300') // Obtenemos la imagen
              );
            }
          ),
        ),
      ),

      // Validamos si esta cargando que cambie el icono
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading 
          ? SpinPerfect(
              infinite: true,
              child: const Icon(Icons.refresh_rounded) 
            )
          : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),

    );
  }
}