part of 'pages.dart';

class DeletePageUmkm extends StatefulWidget {
  const DeletePageUmkm({super.key});

  @override
  State<DeletePageUmkm> createState() => _DeletePageUmkmState();
}

class _DeletePageUmkmState extends State<DeletePageUmkm> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UmkmBloc>().add(UmkmConnect());
    FirebaseService servis = FirebaseService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Nama Umkm"), SizedBox(width: 95), Text("Hapus")],
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
              ? BlocBuilder<UmkmBloc, UmkmState>(
                  builder: (context, state) => state is UmkmLoaded
                      ? ListView.builder(
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text('${state.data![index].nama_umkm}',
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
                                          documentid: 'UmkmId', index: index);
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
