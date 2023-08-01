part of 'pages.dart';

class HalamanUMKM extends StatelessWidget {
  const HalamanUMKM({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, String>(
      builder: (context, state) {
        return BlocBuilder<TranslateBloc, String>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: warnaorange2,
                title: Text(state == 'id'
                    ? "Halaman UMKM"
                    : state == 'en'
                        ? 'MSME page'
                        : '中小微企业页面'),
              ),
              body: LayoutBuilder(
                builder: (p0, p1) => Padding(
                  padding: EdgeInsets.all(p1.maxHeight * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state == 'id'
                            ? "Temukan UMKM"
                            : state == 'en'
                                ? 'Find MSMEs'
                                : '寻找中小微企业',
                        style: TextStyle(
                            fontSize: p1.maxHeight * 0.024,
                            fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<UmkmBloc, UmkmState>(
                        builder: (context, state) {
                          return state is UmkmLoaded && state.data!.isNotEmpty
                              ? CarouselSlider.builder(
                                  itemCount: state.data!.length,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1,
                                  ),
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                    margin: EdgeInsets.only(
                                        right: p1.maxWidth * 0.02),
                                    width: p1.maxWidth,
                                    height: p1.maxHeight * 0.32,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${state.data![index].gambar![0]}'),
                                            fit: BoxFit.fill)),
                                    child: LayoutBuilder(
                                      builder: (p0, p2) => Container(
                                        margin: EdgeInsets.only(
                                            top: p2.maxHeight * 0.68),
                                        width: p2.maxWidth,
                                        height: p2.maxHeight * 0.2,
                                        decoration: BoxDecoration(
                                            color: warnaorange.withOpacity(0.6),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(19),
                                                    bottomRight:
                                                        Radius.circular(19))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${state.data![index].nama_umkm}',
                                                style: TextStyle(
                                                    color: warnaputih,
                                                    fontSize:
                                                        p1.maxHeight * 0.02),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: warnaputih,
                                                    size: p1.maxHeight * 0.02,
                                                  ),
                                                  Text(
                                                    "Bulukumba,Sulawesi Selatan",
                                                    style: TextStyle(
                                                        color: warnaputih,
                                                        fontSize: p1.maxHeight *
                                                            0.02),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              'whatsapp://send?phone=62${state.data![index].telepon}&text=Hello%20Saya Ingin Memesan !'),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    child: Container(
                                                      width: p1.maxWidth * 0.2,
                                                      height:
                                                          p1.maxHeight * 0.03,
                                                      margin: EdgeInsets.only(
                                                          left: p1.maxWidth *
                                                              0.1),
                                                      decoration: BoxDecoration(
                                                          color: warnaorange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      19)),
                                                      child: Center(
                                                        child: Text(
                                                          "Hubungi",
                                                          style: TextStyle(
                                                              color: warnaputih,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  p1.maxHeight *
                                                                      0.02),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : CircularProgressIndicator();
                        },
                      ),
                      SizedBox(
                        height: p1.maxHeight * 0.03,
                      ),
                      Text(
                        state == 'id'
                            ? "Produk UMKM Lainnya"
                            : state == 'en'
                                ? 'Other MSME Products'
                                : '其他中小微企业产品',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: p1.maxHeight * 0.024,
                        ),
                      ),
                      SizedBox(
                        height: p1.maxHeight * 0.03,
                      ),
                      SizedBox(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.5,
                        child: BlocBuilder<UmkmBloc, UmkmState>(
                          builder: (context, state) {
                            return state is UmkmLoaded && state.data!.isNotEmpty
                                ? GridView.builder(
                                    itemCount: state.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 1.0,
                                            crossAxisSpacing: 2.0,
                                            crossAxisCount: 1,
                                            childAspectRatio: (9 / 3)),
                                    itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailUmkm(
                                                        lat: double.tryParse(
                                                                '${state.data![index].lat}')!
                                                            .toDouble(),
                                                        long: double.tryParse(
                                                                '${state.data![index].long}')!
                                                            .toDouble(),
                                                        namaumkm:
                                                            '${state.data![index].nama_umkm}',
                                                        deskripsi:
                                                            '${state.data![index].deskripsi}',
                                                        gambar: state
                                                            .data![index]
                                                            .gambar,
                                                      )));
                                        },
                                        child: ContainerUMKM(
                                          width: p1.maxWidth,
                                          height: p1.maxHeight,
                                          namaumkm:
                                              '${state.data![index].nama_umkm}',
                                          gambar:
                                              '${state.data![index].gambar![0]}',
                                          deskripsi:
                                              '${state.data![index].deskripsi}',
                                        )))
                                : CircularProgressIndicator();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
