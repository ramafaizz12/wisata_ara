part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? bottomnavbarindex;
  PageController pagecontrol = PageController();

  @override
  void initState() {
    super.initState();

    bottomnavbarindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (p0, p1) => SafeArea(
                child: BlocBuilder<TranslateBloc, String>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        PageView(
                          controller: pagecontrol,
                          onPageChanged: (value) {
                            setState(() {
                              bottomnavbarindex = value;
                            });
                          },
                          children: [HomeScreen(), TentangApp()],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            child: ClipPath(
                              child: Container(
                                  color: warnaorange,
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.1,
                                  child: LayoutBuilder(
                                    builder: (p0, btm) => BottomNavigationBar(
                                        backgroundColor: Colors.white,
                                        onTap: (value) {
                                          setState(() {
                                            bottomnavbarindex = value;
                                            pagecontrol.jumpToPage(value);
                                          });
                                        },
                                        currentIndex: bottomnavbarindex!,
                                        selectedLabelStyle: textpoppin.copyWith(
                                            fontSize: btm.maxHeight * 0.2),
                                        unselectedLabelStyle:
                                            textpoppin.copyWith(
                                                fontSize: btm.maxHeight * 0.2),
                                        selectedItemColor: warnapink,
                                        items: [
                                          BottomNavigationBarItem(
                                              label: state == 'id'
                                                  ? 'HOME'
                                                  : state == 'en'
                                                      ? 'HOME'
                                                      : state == 'zh-cn'
                                                          ? '家'
                                                          : '',
                                              icon: Container(
                                                  height: btm.maxHeight * 0.34,
                                                  child: Icon(Icons.home))),
                                          BottomNavigationBarItem(
                                              label: state == 'id'
                                                  ? 'TENTANG'
                                                  : state == 'en'
                                                      ? 'About'
                                                      : state == 'zh-cn'
                                                          ? '关于'
                                                          : '',
                                              icon: Container(
                                                  height: btm.maxHeight * 0.34,
                                                  child: Icon(Icons.info))),
                                        ]),
                                  )),
                            ),
                          ),
                        ),
                        WillPopScope(
                            child: Text(""),
                            onWillPop: () async {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: Text(
                                      "Apakah anda yakin ingin keluar ?",
                                      style: textpoppin.copyWith(
                                          fontSize: p1.maxHeight * 0.02),
                                    ),
                                    content: Row(
                                      children: [
                                        Container(
                                          width: p1.maxWidth * 0.3,
                                          height: p1.maxHeight * 0.07,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: warnaputih,
                                              border: Border.all(
                                                  color: abuabu, width: 1.0)),
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                              },
                                              child: Text(
                                                "Tidak",
                                                style: textpoppin.copyWith(
                                                    color: warnaorange,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        SizedBox(
                                          width: p1.maxWidth * 0.01,
                                        ),
                                        Container(
                                          width: p1.maxWidth * 0.3,
                                          height: p1.maxHeight * 0.07,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        hitam.withOpacity(0.2),
                                                    offset: const Offset(3, 3))
                                              ],
                                              color: warnaorange,
                                              border: Border.all(
                                                  color: abuabu, width: 1.0)),
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                exit(0);
                                              },
                                              child: Text(
                                                "Ya",
                                                style: textpoppin.copyWith(
                                                    color: warnaputih,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                      ],
                                    )),
                              );
                              return false;
                            }),
                        Padding(
                          padding: EdgeInsets.only(bottom: p1.maxHeight * 0.02),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ContainerArHome(
                                width: p1.maxWidth * 0.4,
                                height: p1.maxHeight * 0.1),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
    );
  }
}
