import '../../../model/utilities/imports/generalImport.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool? allowBackButton;
  final bool? safeTop;
  final Function? onRefreshFunction;
  final bool refreshedEnabled;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.floatingActionButton,
      this.appBar,
      this.drawer,
      this.safeTop,
      this.refreshedEnabled = true,
      this.onRefreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onDispose: (model) {},
        disposeViewModel: false,
        builder: (context, model, child) {
          return WillPopScope(
              onWillPop: () async {
                return allowBackButton ?? true;
              },
              child: !refreshedEnabled
                  ? Scaffold(
                      appBar: appBar,
                      body: safeTop == true
                          ? AnnotatedRegion<SystemUiOverlayStyle>(
                              value: SystemUiOverlayStyle.light.copyWith(
                                  statusBarColor:
                                      Theme.of(context).primaryColor),
                              child: SafeArea(
                                // bottom: false,
                                top: safeTop ?? false,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: black,
                                  child: Stack(children: children),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: black,
                              child: Stack(children: children),
                            ),
                      floatingActionButton: floatingActionButton,
                    )
                  : RefreshIndicator(
                      displacement: 100,
                      backgroundColor: purple,
                      color: white,
                      strokeWidth: 3,
                      triggerMode: RefreshIndicatorTriggerMode.onEdge,
                      onRefresh: () async {
                        if (onRefreshFunction != null) {
                          return onRefreshFunction!();
                        }
                      },
                      child: Scaffold(
                        appBar: appBar,
                        drawer: drawer,
                        body: AnnotatedRegion<SystemUiOverlayStyle>(
                          value: SystemUiOverlayStyle.light.copyWith(
                              statusBarColor: Theme.of(context).primaryColor),
                          child: safeTop == true
                              ? SafeArea(
                                  bottom: false,
                                  top: safeTop ?? false,
                                  child: Stack(
                                    children: children,
                                  ),
                                )
                              : Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            'lib/assets/images/profileImage.png',
                                          ))),
                                  child: Stack(
                                    children: children,
                                  ),
                                ),
                        ),
                        floatingActionButton: floatingActionButton,
                      ),
                    ));
        });
  }
}
