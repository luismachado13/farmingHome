import 'dart:math';

import 'package:farmingHome/app/modules/home/model/data.dart';
import 'package:farmingHome/app/theme/light_color.dart';
import 'package:farmingHome/app/theme/text_styles.dart';
import 'package:farmingHome/app/theme/extention.dart';
import 'package:farmingHome/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';
import 'model/dactor_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        Icons.short_text,
        size: 30,
        color: Colors.black,
      ),
      actions: <Widget>[
        Icon(
          Icons.notifications_none,
          size: 30,
          color: LightColor.grey,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset("assets/user.png", fit: BoxFit.fill),
          ),
        ).p(8),
      ],
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Olá,", style: TextStyles.title.subTitleColor),
        Text("Duda", style: TextStyles.h1Style),
      ],
    ).p16;
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Buscar",
          hintStyle: TextStyles.body.subTitleColor,
          suffixIcon: SizedBox(
              width: 50,
              child: Icon(Icons.search, color: LightColor.purple)
                  .alignCenter
                  .ripple(() {}, borderRadius: BorderRadius.circular(13))),
        ),
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Próximas regas", style: TextStyles.title.bold),
              Text(
                "Veja mais",
                style: TextStyles.titleNormal
                    .copyWith(color: Theme.of(context).primaryColor),
              ).p(8).ripple(() {})
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("Reumatologia", "Costela de Adão",
                  "assets/plants/plant1.jpeg",
                  color: LightColor.green, lightColor: LightColor.lightGreen),
              _categoryCard("Reumatologia pediadrica", "Espada de São Jorge",
                  "assets/plants/plant2.jpeg",
                  color: LightColor.skyBlue, lightColor: LightColor.lightBlue),
              _categoryCard("Neurologia", "Cacto1", "assets/plants/plant3.jpeg",
                  color: LightColor.orange, lightColor: LightColor.lightOrange),
              _categoryCard(
                  "Dermatologia", "Jibóia", "assets/plants/plant4.jpeg",
                  color: LightColor.grey, lightColor: LightColor.lightOrange),
              _categoryCard(
                  "Clinica Medica", "Babosa", "assets/plants/plant1.jpeg",
                  color: LightColor.purple, lightColor: LightColor.lightOrange)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Próximas podas", style: TextStyles.title.bold),
              Text(
                "Veja mais",
                style: TextStyles.titleNormal
                    .copyWith(color: Theme.of(context).primaryColor),
              ).p(8).ripple(() {})
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard(
                  "Costela de Adão", "Pouca agua", "assets/plants/plant1.jpeg",
                  color: LightColor.green, lightColor: LightColor.lightGreen),
              _categoryCard("Reumatologia pediadrica", "899 Doctors",
                  "assets/plants/plant2.jpeg",
                  color: LightColor.skyBlue, lightColor: LightColor.lightBlue),
              _categoryCard(
                  "Neurologia", "500 + Doctors", "assets/plants/plant3.jpeg",
                  color: LightColor.orange, lightColor: LightColor.lightOrange),
              _categoryCard(
                  "Dermatologia", "500 + Doctors", "assets/plants/plant4.jpeg",
                  color: LightColor.grey, lightColor: LightColor.lightOrange),
              _categoryCard("Clinica Medica", "500 + Doctors",
                  "assets/plants/plant1.jpeg",
                  color: LightColor.purple, lightColor: LightColor.lightOrange)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle, String imageName,
      {Color color, Color lightColor}) {
    TextStyle subtitleStyle = TextStyles.titleM.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 9,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .4,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image:
                              DecorationImage(image: AssetImage('$imageName'))),
                    ),
                    Expanded(
                      child: Container(
                        height: 10,
                        child: Text(
                          subtitle,
                          style: subtitleStyle,
                        ),
                      ),
                    ),
                  ],
                ).hP16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Todas as Plantas", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _header(),
                _searchField(),
                _category(),
              ],
            ),
          ),
          _doctorsList()
        ],
      ),
    );
  }
}
