import 'package:flutter/material.dart';

class InifinityScreen extends StatelessWidget {
  const InifinityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inifinty'),
      ),
      body: _InifinityView(),
    );
  }
}

class _InifinityView extends StatefulWidget {
  const _InifinityView({
    super.key,
  });

  @override
  State<_InifinityView> createState() => _InifinityViewState();
}

class _InifinityViewState extends State<_InifinityView> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool loading = false;

  final ScrollController scroll = ScrollController();
  void addImage() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels + 500 >= scroll.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  moveScrollBootom() {
    if (scroll.position.pixels + 150 <= scroll.position.maxScrollExtent) return;
    scroll.animateTo(scroll.position.pixels + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastEaseInToSlowEaseOut);
  }

  Future loadNextPage() async {
    if (loading) return;

    loading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addImage();
    setState(() {});
    moveScrollBootom();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    final lastId = imagesIds.last;
    loading = true;
    imagesIds = [];
    imagesIds.add(lastId + 1);
    addImage();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          controller: scroll,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              height: 300,
              placeholder: const AssetImage('loader.jpg'),
              image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/200/300'),
            );
          },
        ),
      ),
    );
  }
}
