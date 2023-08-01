part of 'widgets.dart';

class DashboardHome extends StatelessWidget {
  final double width;
  final double height;
  const DashboardHome({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: colorgradientt,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(2, 4))
        ],
      ),
      child: LayoutBuilder(
        builder: (p0, p1) => Padding(
          padding: EdgeInsets.only(
              left: p1.maxWidth * 0.04,
              right: p1.maxWidth * 0.04,
              top: p1.maxHeight * 0.04),
          child: BlocBuilder<TranslateBloc, String>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state == 'id'
                        ? "Jelajahi Tempat Wisata Desa Ara\nDisekitarmu"
                        : state == 'en'
                            ? 'Explore Tourist Attractions in Ara Village\nAround You'
                            : state == 'zh-cn'
                                ? '探索您周围阿拉村的旅游景点'
                                : '',
                    style: TextStyle(
                        color: warnaputih,
                        fontWeight: FontWeight.bold,
                        fontSize: p1.maxWidth * 0.038),
                  ),
                  Text(
                    state == 'id'
                        ? "Destinasi Seru Yang Dekat Denganmu."
                        : state == 'en'
                            ? 'Exciting Destinations Near You.'
                            : state == 'zh-cn'
                                ? '您附近令人兴奋的目的地'
                                : '',
                    style: TextStyle(
                        color: warnaputih,
                        fontWeight: FontWeight.w200,
                        fontSize: p1.maxWidth * 0.027),
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerDashboard(
                        width: p1.maxWidth * 0.45,
                        height: p1.maxHeight * 0.2,
                        nama: state == 'id'
                            ? 'Jelajahi Wisata'
                            : state == 'en'
                                ? 'Explore Travel'
                                : state == 'zh-cn'
                                    ? '探索旅行'
                                    : '',
                        fungsi: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HalamanWisata(),
                              ));
                        },
                      ),
                      ContainerDashboard(
                        width: p1.maxWidth * 0.45,
                        height: p1.maxHeight * 0.2,
                        nama: state == 'id'
                            ? 'Temukan UMKM'
                            : state == 'en'
                                ? 'Find MSMEs'
                                : state == 'zh-cn'
                                    ? '寻找中小微企业'
                                    : '',
                        fungsi: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HalamanUMKM(),
                              ));
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
