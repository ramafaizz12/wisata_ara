part of 'pages.dart';

class HalamanPencarian extends StatelessWidget {
  const HalamanPencarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (p0, p1) => Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.07,
                left: p1.maxWidth * 0.04,
                right: p1.maxWidth * 0.04),
            child: Column(
              children: [
                ContainerPencarian(
                    onchanged: (string) => context
                        .read<WisataBloc>()
                        .add(WisataSearch(value: string)),
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.07),
                BlocBuilder<TranslateBloc, String>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state == 'id'
                            ? "Riwayat Pencarian"
                            : state == 'en'
                                ? 'Search History'
                                : '搜索历史记录'),
                        TextButton(
                            onPressed: () {},
                            child: Text(state == 'id'
                                ? "Hapus"
                                : state == 'en'
                                    ? 'Delete'
                                    : '删除'))
                      ],
                    );
                  },
                ),
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.7,
                  child: BlocBuilder<WisataBloc, WisataState>(
                    builder: (context, state) {
                      return state is WisataLoaded
                          ? state.data!.isNotEmpty
                              ? GridView.builder(
                                  itemCount: state.data!.length,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 2.0,
                                          crossAxisCount: 2,
                                          childAspectRatio: (6 / 5)),
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
                                                  gambar: state
                                                      .data![index].gambar!,
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
                              : Center(child: Text("Data Tidak Ditemukan"))
                          : CircularProgressIndicator();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
