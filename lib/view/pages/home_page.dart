import 'package:flutter/material.dart';
import 'package:loginagain/view/sections/user_section.dart';
import 'package:provider/provider.dart';
import 'package:loginagain/view/utils/all_shared.dart';

//States
import 'package:loginagain/state/home_state.dart';
import 'package:loginagain/state/currentUser_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: Homelayout(),
    );
  }
}

class Homelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: SmallScreen(),
      mediumScreen: MediumScreen(),
      largeScreen: LargeScreen(),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSmall(),
      drawer: DrawerSmall(),
      body: Body(sideBar: false),
    );
  }
}

class MediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LargeScreen();
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DrawerLarge(),
          Column(
            children: [
              AppBarLarge(),
              Body(sideBar: true),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarSmall extends PreferredSize {
  AppBarSmall({Key key, Widget title})
      : super(
          key: key,
          preferredSize: Size.fromHeight(Sizes.appBarHeight),
          child: AppBar(
            backgroundColor: Colours.mainGreen,
            elevation: 0.0,
          ),
        );
}

class DrawerLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerContents();
  }
}

class AppBarLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - Sizes.sideBarWidth,
      height: Sizes.appBarHeight,
      color: Colours.mainGreen,
      child: Column(),
    );
  }
}

logout(BuildContext context) async {
  CurrentUserState _userState = locator<CurrentUserState>();
  await Navigator.pushNamed(context, 'login');
  _userState.logout();
}

class DrawerSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerContents();
  }
}

class DrawerContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.sideBarWidth,
      height: MediaQuery.of(context).size.height,
      color: Colours.sideBarBackGround,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          DrawerButton(sectionName: Strings.Projects),
          DrawerButton(sectionName: Strings.Species),
          DrawerButton(sectionName: Strings.Collections),
          DrawerButton(sectionName: Strings.Dart),
          DrawerButton(sectionName: Strings.Map),
          DrawerButton(
              sectionName: Strings.Users), //only show if the user is admin
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    @required this.sectionName,
  });
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (_, homeState, __) => Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: homeState.section() == sectionName
                    ? Colours.mainGreen
                    : Colors.transparent,
                child: ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    selected: homeState.section() == sectionName ? true : false,
                    title: Text(sectionName),
                    onTap: () {
                      homeState.changeSection(sectionName: sectionName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  final bool sideBar;

  Body({@required this.sideBar});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    height -= Sizes.appBarHeight;

    if (sideBar == true) {
      width -= Sizes.sideBarWidth;
    }

    return Consumer<HomeState>(
      builder: (_, homeState, __) => Container(
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: homeState.sectionState() == ViewState.Busy
              ? spinner()
              : showSection(homeState.section(), context),
        ),
      ),
    );
  }
}

showSection(String section, BuildContext context) {
  switch (section) {
    case Strings.Users:
      {
        print('show the section...');
        return UserSection();
      }

    default:
      {
        return Column(children: <Widget>[
          Text(section),
          FlatButton(
            onPressed: () {
              logout(context);
            },
            child: Text('log out'),
          ),
        ]);
      }
  }
}
