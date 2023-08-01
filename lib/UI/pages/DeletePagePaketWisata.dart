part of 'pages.dart';

class DeletePaketWisata extends StatefulWidget {
  const DeletePaketWisata({super.key});

  @override
  State<DeletePaketWisata> createState() => _DeletePaketWisataState();
}

class _DeletePaketWisataState extends State<DeletePaketWisata> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<PaketwisataBloc>().add(PaketWisataConnect());
    FirebaseService servis = FirebaseService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Paket Wisata"), SizedBox(width: 95), Text("Hapus")],
        ),
        Container(
          width: 400,
          height: 5,
          color: hitam,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: loading != true
              ? BlocBuilder<PaketwisataBloc, PaketwisataState>(
                  builder: (context, state) => state is PaketWisataLoaded
                      ? ListView.builder(
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                    '${state.data![index].nama_paket_wisata}',
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      await servis.deleteData(
                                          documentid: 'paket_wisata',
                                          index: index);
                                      setState(() {
                                        loading = false;
                                      });
                                    },
                                    child: Text("Hapus")),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                )
              : CircularProgressIndicator(),
        )
      ],
    );
  }
}
