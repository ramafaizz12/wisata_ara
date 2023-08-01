part of 'pages.dart';

class DetailUmkm extends StatefulWidget {
  final String namaumkm;
  final String deskripsi;
  final List<String>? gambar;
  final double lat;
  final double long;

  const DetailUmkm({
    this.namaumkm = '',
    this.deskripsi = '',
    required this.lat,
    required this.long,
    this.gambar,
    super.key,
  });

  @override
  State<DetailUmkm> createState() => _DetailUmkmState();
}

class _DetailUmkmState extends State<DetailUmkm> {
  @override
  void initState() {
    var data = context.read<TranslateBloc>().state;
    context
        .read<TranslatorBloc>()
        .add(TranslatorLang(kodebahasa: data, teks: widget.deskripsi));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, String>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: warnabackground,
          appBar: AppBar(
            backgroundColor: warnaorange2,
            title: Text(state == 'id'
                ? 'Detail UMKM'
                : state == 'en'
                    ? 'MSME details'
                    : '中小微企业详情'),
          ),
          body: LayoutBuilder(
            builder: (p0, p1) => Padding(
              padding: EdgeInsets.only(
                  left: p1.maxWidth * 0.04,
                  right: p1.maxWidth * 0.04,
                  top: p1.maxHeight * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.namaumkm,
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
                      height: p1.maxHeight * 0.02,
                    ),
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.2,
                      child: GridView.builder(
                          itemCount: widget.gambar!.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 2.0,
                                  crossAxisCount: 1,
                                  childAspectRatio: (7 / 7)),
                          itemBuilder: (context, index) => CachedNetworkImage(
                                imageUrl: '${widget.gambar![index]}',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    BlocBuilder<TranslatorBloc, String>(
                      builder: (context, state) {
                        return Text(state);
                      },
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.05,
                    ),
                    ContainerHomeLokasi(
                        width: p1.maxWidth,
                        lat: widget.lat,
                        long: widget.long,
                        zoom: 15,
                        height: p1.maxHeight * 0.2)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
