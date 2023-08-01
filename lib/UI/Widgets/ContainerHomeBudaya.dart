part of 'widgets.dart';

class ContainerHomeBudaya extends StatelessWidget {
  final double width;
  final double height;
  const ContainerHomeBudaya(
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
                    ? "Budaya Disekitar"
                    : state == 'en'
                        ? 'Surrounding Culture'
                        : '周边文化',
                style:
                    TextStyle(color: warnaorange, fontWeight: FontWeight.bold),
              );
            },
          ),
          SizedBox(
            width: width,
            height: height,
            child: BlocBuilder<BudayaBloc, BudayaState>(
              builder: (context, state) {
                return state is BudayaLoaded && state.data!.isNotEmpty
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
                                      builder: (context) => DetailBudaya(
                                        judul:
                                            '${state.data![index].nama_budaya}',
                                        gambar: state.data![index].gambar!,
                                        description:
                                            '${state.data![index].deskripsi}',
                                      ),
                                    ));
                              },
                              child: ContainerBudaya(
                                width: p1.maxWidth * 0.1,
                                height: p1.maxHeight * 0.05,
                                namabudaya: '${state.data![index].nama_budaya}',
                                gambar: state.data![index].gambar!,
                                description: '${state.data![index].deskripsi}',
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
