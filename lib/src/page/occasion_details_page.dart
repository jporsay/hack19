import 'package:flutter/material.dart';
import 'package:hack19/src/occasion/occasion.dart';
import 'package:hack19/src/occasion/widgets/occasion_widget.dart';

class OccasionDetailPage extends StatelessWidget {
  final Occasion occasion;
  const OccasionDetailPage({Key key, this.occasion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(occasion.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: new ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.grey, Colors.white],
                            stops: [0, 0.4]
                        ).createShader(bounds);
                      },
                      child: Image(
                        image: NetworkImage(occasion.bannerPhoto),
                        fit: BoxFit.fill,
                        colorBlendMode: BlendMode.dstIn,
                      )
                  ),
              ),
            ),
          ];
        },
        body: OccasionWidget(
          occasion: occasion,
        )
      ),
    );
  }
}
