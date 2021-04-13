import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    this.scaffoldKey,
    this.drawer,
    this.endDrawer,
    this.title,
    this.body,
    this.trailing,
    this.floatingActionButton,
    this.persistentFooterButtons,
    this.menuIcon,
    this.endIcon,
    this.kTabletBreakpoint = 720.0,
    this.kDesktopBreakpoint = 1440.0,
    this.appBarBackgroundColor,
    this.appBarElevation = 0.0,
    this.hideMenuEverytime = false,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget? drawer, endDrawer;

  final Widget? title;

  final Widget? bottomNavigationBar;

  final Widget? body;

  final Widget? appBar;

  final Widget? trailing;

  final Widget? floatingActionButton;

  final List<Widget>? persistentFooterButtons;

  final Color? appBarBackgroundColor;

  final kTabletBreakpoint;
  final kDesktopBreakpoint;
  final _drawerWidth = 304.0;

  final IconData? menuIcon, endIcon;

  final double appBarElevation;

  final bool hideMenuEverytime;

  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= kDesktopBreakpoint && hideMenuEverytime == false) {
          return Material(
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (drawer != null) ...[
                      SizedBox(
                        width: _drawerWidth,
                        child: Drawer(
                          child: SafeArea(
                            child: drawer!,
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      child: Scaffold(
                        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
                        floatingActionButton: floatingActionButton,
                        persistentFooterButtons: persistentFooterButtons,
                        bottomNavigationBar: bottomNavigationBar,
                        key: scaffoldKey,
                        appBar: appBar as PreferredSizeWidget?,
                        body: Row(
                          children: <Widget>[
                            Expanded(
                              child: body ?? Container(),
                            ),
                            if (endDrawer != null) ...[
                              Container(
                                width: _drawerWidth,
                                child: Drawer(
                                  elevation: 3.0,
                                  child: SafeArea(
                                    child: endDrawer!,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (constraints.maxWidth >= kTabletBreakpoint) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton: floatingActionButton,
            persistentFooterButtons: persistentFooterButtons,
            key: scaffoldKey,
            bottomNavigationBar: bottomNavigationBar,
            drawer: drawer == null
                ? null
                : Drawer(
                    child: SafeArea(
                      child: drawer!,
                    ),
                  ),
            appBar: appBar as PreferredSizeWidget?,
            body: SafeArea(
              right: false,
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: body ?? Container(),
                      ),
                      if (endDrawer != null) ...[
                        Container(
                          width: _drawerWidth,
                          child: Drawer(
                            elevation: 3.0,
                            child: SafeArea(
                              child: endDrawer!,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          key: scaffoldKey,
          drawer: drawer == null
              ? null
              : Drawer(
                  child: SafeArea(
                    child: drawer!,
                  ),
                ),
          endDrawer: endDrawer == null
              ? null
              : Drawer(
                  child: SafeArea(
                    child: endDrawer!,
                  ),
                ),
          appBar: appBar as PreferredSizeWidget?,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          persistentFooterButtons: persistentFooterButtons,
        );
      },
    );
  }
}

class _OptionsButton extends StatelessWidget {
  const _OptionsButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData ?? Icons.more_vert,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData ?? Icons.menu,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
