import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quran/models/quran_model.dart';
import 'package:simple_quran/widget/quran_surah.dart';

class QuranList extends StatefulWidget {
  @override
  _QuranListState createState() => _QuranListState();
}

class _QuranListState extends State<QuranList> {
  ScrollController controller;

  bool loadMore = false;
  bool firstLoad = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<QuranData>(context, listen: false).getData().then((_) {
        setState(() {
          firstLoad = false;
        });
      });
    });
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        loadMore = true;
      });

      Provider.of<QuranData>(context, listen: false).getData().then((_) {
        setState(() {
          loadMore = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.book),
        title: Text("Aplikasi Qur'an"),
      ),
      floatingActionButton: loadMore ? CircularProgressIndicator() : null,
      body: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: firstLoad
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<QuranData>(
                builder: (ctx, data, _) => ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.items.length,
                  itemBuilder: (ctx, i) => QuranSurah(
                    data.items[i].id,
                    data.items[i].name,
                    data.items[i].arab,
                    data.items[i].translate,
                    data.items[i].countAyat,
                  ),
                ),
              ),
      ),
    );
  }
}
