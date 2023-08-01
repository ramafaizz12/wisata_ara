part of 'pages.dart';

class HalamanWisata extends StatelessWidget {
  const HalamanWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, String>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: warnaorange2,
            title: Text(state == 'id'
                ? "Halaman Wisata"
                : state == 'en'
                    ? 'Travel Page'
                    : '旅游页面'),
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
                        ? "Wisata Disekitarmu"
                        : state == 'en'
                            ? 'Travel around you'
                            : '旅游页面',
                    style: TextStyle(
                        fontSize: p1.maxHeight * 0.024,
                        fontWeight: FontWeight.bold),
                  ),
                  BlocBuilder<WisataBloc, WisataState>(
                    builder: (context, state) {
                      return state is WisataLoaded
                          ? CarouselSlider.builder(
                              itemCount: state.data!.length,
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                              ),
                              itemBuilder: (context, index, realIndex) =>
                                  Container(
                                margin:
                                    EdgeInsets.only(right: p1.maxWidth * 0.02),
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
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(19),
                                            bottomRight: Radius.circular(19))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.data![index].nama_wisata}",
                                            style: TextStyle(
                                                color: warnaputih,
                                                fontSize: p1.maxHeight * 0.02),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: warnaputih,
                                                size: p1.maxHeight * 0.02,
                                              ),
                                              Text(
                                                "Bulukumba, Indonesia",
                                                style: TextStyle(
                                                    color: warnaputih,
                                                    fontSize:
                                                        p1.maxHeight * 0.02),
                                              ),
                                            ],
                                          )
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
                        ? "Wisata Lainnya"
                        : state == 'en'
                            ? 'Other Tours'
                            : '其他旅游',
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
                    height: p1.maxHeight * 0.44,
                    child: BlocBuilder<WisataBloc, WisataState>(
                      builder: (context, state) {
                        return state is WisataLoaded
                            ? GridView.builder(
                                itemCount: state.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 1.0,
                                        crossAxisSpacing: 2.0,
                                        crossAxisCount: 2,
                                        childAspectRatio: (9 / 9)),
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailWisata(
                                                namawisata:
                                                    '${state.data![index].nama_wisata}',
                                                deskripsi_wisata:
                                                    '${state.data![index].deskripsi}',
                                                gambar:
                                                    state.data![index].gambar!,
                                              ),
                                            ));
                                      },
                                      child: ContainerWisata(
                                        width: p1.maxWidth * 0.1,
                                        height: p1.maxHeight * 0.05,
                                        namawisata:
                                            '${state.data![index].nama_wisata}',
                                        deskripsi:
                                            '${state.data![index].deskripsi}',
                                        gambar: state.data![index].gambar!,
                                      ),
                                    ))
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
  }
}
