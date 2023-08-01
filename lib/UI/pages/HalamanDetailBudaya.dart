part of 'pages.dart';

class DetailBudaya extends StatefulWidget {
  final String judul;
  final List<String> gambar;
  final String description;
  const DetailBudaya(
      {super.key,
      this.judul = '',
      this.description = '',
      required this.gambar});

  @override
  State<DetailBudaya> createState() => _DetailBudayaState();
}

class _DetailBudayaState extends State<DetailBudaya> {
  @override
  void initState() {
    var data = context.read<TranslateBloc>().state;
    context
        .read<TranslatorBloc>()
        .add(TranslatorLang(kodebahasa: data, teks: widget.description));
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
                ? 'Detail Budaya'
                : state == 'en'
                    ? 'Cultural Details'
                    : '文化细节');
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.judul,
                  style: TextStyle(
                      color: warnaorange,
                      fontWeight: FontWeight.bold,
                      fontSize: p1.maxWidth * 0.05),
                ),
                SizedBox(height: p1.maxHeight * 0.02),
                CarouselSlider.builder(
                  itemCount: widget.gambar.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  itemBuilder: (context, index, realIndex) => Container(
                    margin: EdgeInsets.only(right: p1.maxWidth * 0.02),
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        image: DecorationImage(
                            image: NetworkImage('${widget.gambar[index]}'),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(height: p1.maxHeight * 0.02),
                BlocBuilder<TranslatorBloc, String>(
                  builder: (context, state) {
                    return Text(
                      state,
                      textAlign: TextAlign.start,
                    );
                  },
                ),
                SizedBox(
                  height: p1.maxHeight * 0.05,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
