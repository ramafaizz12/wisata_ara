part of 'pages.dart';

class DeletePageBudaya extends StatefulWidget {
  const DeletePageBudaya({super.key});

  @override
  State<DeletePageBudaya> createState() => _DeletePageBudayaState();
}

class _DeletePageBudayaState extends State<DeletePageBudaya> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<BudayaBloc>().add(ConnectBudaya());
    FirebaseService servis = FirebaseService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Nama Budaya"), SizedBox(width: 95), Text("Hapus")],
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
              ? BlocBuilder<BudayaBloc, BudayaState>(
                  builder: (context, state) => state is BudayaLoaded
                      ? ListView.builder(
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text('${state.data![index].nama_budaya}',
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
                                          documentid: 'BudayaId', index: index);
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
