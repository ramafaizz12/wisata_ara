part of 'pages.dart';

class DeletePageWisata extends StatefulWidget {
  const DeletePageWisata({super.key});

  @override
  State<DeletePageWisata> createState() => _DeletePageWisataState();
}

class _DeletePageWisataState extends State<DeletePageWisata> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WisataBloc>().add(WisataConnect());

    context.read<UmkmBloc>().add(UmkmConnect());
    FirebaseService servis = FirebaseService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Nama Wisata"), SizedBox(width: 95), Text("Hapus")],
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
              ? BlocBuilder<WisataBloc, WisataState>(
                  builder: (context, state) => state is WisataLoaded
                      ? ListView.builder(
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text('${state.data![index].nama_wisata}',
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
                                          documentid: 'WisataId', index: index);
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
