part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Services servis = Services();
  int? bottomnavbarindex;
  PageController pagecontrol = PageController();
  final _controller = ScrollController();
  @override
  void initState() {
    var kodebhs = context.read<TranslateBloc>().state;
    context.read<BudayaBloc>().add(ConnectBudaya());
    context.read<WisataBloc>().add(WisataConnect());
    context.read<PaketwisataBloc>().add(PaketWisataConnect());
    context.read<UmkmBloc>().add(UmkmConnect());
    super.initState();
    bottomnavbarindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (p0, p1) => SafeArea(
                child: FadingEdgeScrollView.fromSingleChildScrollView(
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.35,
                          child: Image.asset(
                            'assets/backgroundhome.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: p1.maxHeight * 0.27),
                          child: Container(
                            decoration: BoxDecoration(
                                color: warnaputih,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            width: p1.maxWidth,
                            height: p1.maxHeight * 0.3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: p1.maxWidth * 0.05,
                              right: p1.maxWidth * 0.05,
                              top: p1.maxHeight * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<TranslateBloc, String>(
                                builder: (context, state) {
                                  return Text(
                                    state == 'id'
                                        ? "Halo\nPengunjung"
                                        : state == 'en'
                                            ? 'Hello\nVisitor'
                                            : state == 'zh-cn'
                                                ? '访客您好'
                                                : '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: warnaputih),
                                  );
                                },
                              ),
                              SizedBox(
                                height: p1.maxHeight * 0.16,
                              ),
                              ContainerPencarian(
                                  width: p1.maxWidth,
                                  onchanged: (string) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HalamanPencarian(),
                                        ));
                                  },
                                  fungsi: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HalamanPencarian(),
                                        ));
                                  },
                                  height: p1.maxHeight * 0.05),
                              SizedBox(
                                height: p1.maxHeight * 0.023,
                              ),
                              DashboardHome(
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.2),
                              SizedBox(
                                height: p1.maxHeight * 0.05,
                              ),
                              ContainerHomeWisata(
                                width: p1.maxWidth,
                                height: p1.maxHeight * 0.2,
                              ),
                              SizedBox(
                                height: p1.maxHeight * 0.05,
                              ),
                              ContainerHomeBudaya(
                                width: p1.maxWidth,
                                height: p1.maxHeight * 0.2,
                              ),
                              SizedBox(
                                height: p1.maxHeight * 0.05,
                              ),
                              ContainerHomeLokasi(
                                  width: p1.maxWidth,
                                  lat: -5.535732333707034,
                                  long: 120.42249044519907,
                                  zoom: 12,
                                  height: p1.maxHeight * 0.2),
                              SizedBox(
                                height: p1.maxHeight * 0.04,
                              ),
                              ContainerSosialMedia(
                                  width: p1.maxWidth * 0.4,
                                  height: p1.maxHeight * 0.3),
                              const SizedBox(
                                height: 5,
                              ),
                              ContainerLoading(
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.04)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
