import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/data/data.dart';
import 'package:netflix_ui_clone/widgets/content_header.dart';
import 'package:netflix_ui_clone/widgets/cutom_app_bar.dart';
import 'package:netflix_ui_clone/widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(title: 'Previews', contentList: previews),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => {},
      ),
    );
  }
}
