part of 'pages.dart';

class DetailWisata extends StatefulWidget {
  final String namawisata;
  final String deskripsi_wisata;
  final List<String> gambar;
  const DetailWisata(
      {super.key,
      this.namawisata = '',
      this.deskripsi_wisata = '',
      required this.gambar});

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  @override
  void initState() {
    var data = context.read<TranslateBloc>().state;
    context
        .read<TranslatorBloc>()
        .add(TranslatorLang(kodebahasa: data, teks: widget.deskripsi_wisata));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnabackground,
      appBar: AppBar(
        backgroundColor: warnaorange2,
        title: BlocBuilder<TranslateBloc, String>(
          builder: (context, state) {
            return Text(state == 'id'
                ? 'Detail Wisata'
                : state == 'en'
                    ? 'Tour Details'
                    : '旅游详情');
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (p0, p1) => Padding(
          padding: EdgeInsets.only(
              left: p1.maxWidth * 0.04,
              right: p1.maxWidth * 0.04,
              top: p1.maxHeight * 0.04),
          child: SingleChildScrollView(
            child: BlocBuilder<TranslateBloc, String>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.namawisata,
                      style: TextStyle(
                          color: warnaorange,
                          fontWeight: FontWeight.bold,
                          fontSize: p1.maxWidth * 0.05),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/lokasi.svg',
                          width: p1.maxWidth * 0.03,
                          height: p1.maxHeight * 0.03,
                        ),
                        SizedBox(
                          width: p1.maxWidth * 0.02,
                        ),
                        Text(
                          "Bulukumba, Sulawesi Selatan",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: p1.maxWidth * 0.03),
                        )
                      ],
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.05,
                    ),
                    BlocBuilder<TranslatorBloc, String>(
                      builder: (context, state) {
                        return Text(state);
                      },
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.05,
                    ),
                    Text(
                      state == 'id'
                          ? "Harga Tiket"
                          : state == 'en'
                              ? 'Ticket price'
                              : state == 'zh-cn'
                                  ? '票价'
                                  : '',
                      style: TextStyle(
                          color: warnaorange,
                          fontWeight: FontWeight.w300,
                          fontSize: p1.maxWidth * 0.05),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: p1.maxWidth * 0.4,
                          height: p1.maxHeight * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: warnaorange),
                          child: Column(
                            children: [
                              Text(
                                state == 'id'
                                    ? "Mancanegara"
                                    : state == 'en'
                                        ? 'Overseas'
                                        : state == 'zh-cn'
                                            ? '海外'
                                            : '',
                                style: TextStyle(color: warnaputih),
                              ),
                              Text(state == 'id'
                                  ? 'Dewasa    10.000'
                                  : state == 'en'
                                      ? 'Mature  10.000'
                                      : state == 'zh-cn'
                                          ? '成熟'
                                          : ''),
                              Text(state == 'id'
                                  ? 'Anak - Anak   10.000'
                                  : state == 'en'
                                      ? 'children   10.000'
                                      : '孩子们')
                            ],
                          ),
                        ),
                        Container(
                          width: p1.maxWidth * 0.4,
                          height: p1.maxHeight * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: warnaorange),
                          child: Column(
                            children: [
                              Text(
                                state == 'id'
                                    ? "Dosmetik"
                                    : state == 'en'
                                        ? 'Domestic'
                                        : state == 'zh-cn'
                                            ? '国内的'
                                            : '',
                                style: TextStyle(color: warnaputih),
                              ),
                              Text(state == 'id'
                                  ? 'Dewasa    10.000'
                                  : state == 'en'
                                      ? 'Mature  10.000'
                                      : state == 'zh-cn'
                                          ? '成熟'
                                          : ''),
                              Text(state == 'id'
                                  ? 'Anak - Anak   10.000'
                                  : state == 'en'
                                      ? 'children   10.000'
                                      : '孩子们')
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    Text(
                      state == 'id'
                          ? "Paket Wisata"
                          : state == 'en'
                              ? 'Tour packages'
                              : state == 'zh-cn'
                                  ? '旅游套餐'
                                  : '',
                      style: TextStyle(
                          color: warnaorange,
                          fontWeight: FontWeight.w300,
                          fontSize: p1.maxWidth * 0.05),
                    ),
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.3,
                      child: BlocBuilder<PaketwisataBloc, PaketwisataState>(
                        builder: (context, state) {
                          return state is PaketWisataLoaded &&
                                  state.data!.isNotEmpty
                              ? GridView.builder(
                                  itemCount: state.data!.length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 2.0,
                                          crossAxisCount: 1,
                                          childAspectRatio: (9 / 9)),
                                  itemBuilder: (context, index) =>
                                      ContainerPaketWisata(
                                    gambar: '${state.data![index].gambar![0]}',
                                    namapaketwisata:
                                        '${state.data![index].nama_paket_wisata}',
                                    namaspotwisata:
                                        '${state.data![index].spot_wisata}',
                                    villa: '${state.data![index].villa}',
                                    telepon: '${state.data![index].telepon}',
                                    harga: '${state.data![index].harga}',
                                    fasilitas:
                                        '${state.data![index].fasilitas}',
                                  ),
                                )
                              : ContainerLoading(
                                  width: p1.maxWidth * 0.02,
                                  height: p1.maxHeight * 0.02);
                        },
                      ),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    Text(
                      state == 'id'
                          ? "Gallery Foto"
                          : state == 'en'
                              ? 'Gallery Foto'
                              : '画廊照片',
                      style: TextStyle(
                          color: warnaorange,
                          fontWeight: FontWeight.w300,
                          fontSize: p1.maxWidth * 0.05),
                    ),
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.3,
                      child: GridView.builder(
                          itemCount: widget.gambar.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 2.0,
                                  crossAxisCount: 1,
                                  childAspectRatio: (7 / 7)),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) => ImageDialog(
                                            image: '${widget.gambar[index]}',
                                          ));
                                },
                                child: CachedNetworkImage(
                                  imageUrl: '${widget.gambar[index]}',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              )),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
