part of 'widgets.dart';

class ContainerHomeWisata extends StatelessWidget {
  final double width;
  final double height;
  const ContainerHomeWisata(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TranslateBloc, String>(
            builder: (context, state) {
              return Text(
                state == 'id'
                    ? "Wisata Popular"
                    : state == 'en'
                        ? 'Popular Tourism'
                        : '热门旅游',
                style:
                    TextStyle(color: warnaorange, fontWeight: FontWeight.bold),
              );
            },
          ),
          SizedBox(
            width: width,
            height: height,
            child: BlocBuilder<WisataBloc, WisataState>(
              builder: (context, state) {
                return state is WisataLoaded && state.data!.isNotEmpty
                    ? GridView.builder(
                        itemCount: state.data!.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1.0,
                                crossAxisSpacing: 2.0,
                                crossAxisCount: 1,
                                childAspectRatio: (9 / 13)),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailWisata(
                                        namawisata:
                                            '${state.data![index].nama_wisata}',
                                        deskripsi_wisata:
                                            '${state.data![index].deskripsi}',
                                        gambar: state.data![index].gambar!,
                                      ),
                                    ));
                              },
                              child: ContainerWisata(
                                width: p1.maxWidth * 0.1,
                                height: p1.maxHeight * 0.05,
                                namawisata: '${state.data![index].nama_wisata}',
                                deskripsi: '${state.data![index].deskripsi}',
                                gambar: state.data![index].gambar!,
                              ),
                            ))
                    : ContainerLoading(
                        width: p1.maxWidth * 0.02, height: p1.maxHeight * 0.02);
              },
            ),
          )
        ],
      ),
    );
  }
}
