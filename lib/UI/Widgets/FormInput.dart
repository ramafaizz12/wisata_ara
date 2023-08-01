part of 'widgets.dart';

class FormInput extends StatefulWidget {
  bool wisata;
  bool paketwisata;
  bool budaya;
  bool umkm;
  FormInput(
      {super.key,
      this.wisata = false,
      this.paketwisata = false,
      this.budaya = false,
      this.umkm = false});
  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController nama = TextEditingController();
  TextEditingController spotwisata = TextEditingController();
  TextEditingController namavilla = TextEditingController();
  TextEditingController notelp = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  FirebaseService servis = FirebaseService();
  List<XFile>? images;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: loading != true
            ? Column(
                children: [
                  SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.13,
                    child: ContainerInput(
                      nama: widget.wisata != false
                          ? 'Nama Wisata'
                          : widget.paketwisata != false
                              ? 'Paket Wisata'
                              : widget.budaya != false
                                  ? 'Nama Budaya'
                                  : widget.umkm != false
                                      ? 'Nama UMKM'
                                      : '',
                      control: nama,
                    ),
                  ),
                  widget.paketwisata != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            nama: 'Spot Wisata',
                            control: spotwisata,
                          ),
                        )
                      : const SizedBox(),
                  widget.paketwisata != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            nama: 'Nama Villa',
                            control: namavilla,
                          ),
                        )
                      : const SizedBox(),
                  widget.paketwisata != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            nama: 'No Telepon',
                            tipekeyboard: TextInputType.phone,
                            control: notelp,
                          ),
                        )
                      : const SizedBox(),
                  widget.umkm != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            nama: 'No Telepon',
                            tipekeyboard: TextInputType.phone,
                            control: notelp,
                          ),
                        )
                      : const SizedBox(),
                  widget.paketwisata != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            tipekeyboard: TextInputType.number,
                            nama: 'Harga',
                            control: harga,
                          ),
                        )
                      : const SizedBox(),
                  widget.umkm != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            hint: 'Masukkan latitude',
                            tipekeyboard: TextInputType.number,
                            nama: 'Lat',
                            control: lat,
                          ),
                        )
                      : const SizedBox(),
                  widget.umkm != false
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.13,
                          child: ContainerInput(
                            hint: 'Masukkan longitude',
                            tipekeyboard: TextInputType.number,
                            nama: 'Long',
                            control: long,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.42,
                    child: ContainerInput(
                      nama: widget.wisata != false
                          ? 'Deskripsi'
                          : widget.paketwisata != false
                              ? 'Fasilitas'
                              : widget.budaya != false
                                  ? 'Deskripsi'
                                  : widget.umkm != false
                                      ? 'Deskripsi'
                                      : '',
                      tipekeyboard: TextInputType.multiline,
                      control: deskripsi,
                      lebarinput: 130,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Masukkan Gambar"),
                      ContainerSplash(
                          width: p1.maxWidth * 0.2,
                          height: p1.maxHeight * 0.07,
                          fungsi: () {
                            setState(() {
                              widget.wisata != false
                                  ? images!.removeLast()
                                  : images!.clear();
                            });
                          },
                          nama: 'Hapus')
                    ],
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.04,
                  ),
                  images != null && images!.isNotEmpty
                      ? SizedBox(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.3,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                widget.wisata != false ? images!.length : 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 7.0,
                                    crossAxisSpacing: 2.0,
                                    crossAxisCount: 1,
                                    childAspectRatio: (6 / 10)),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                color: warnapink,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                File(widget.paketwisata != false
                                    ? images![0].path
                                    : images![index].path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      : FloatingActionButton(
                          backgroundColor: warnaorange,
                          onPressed: () async {
                            var data = await servis.pickImages();
                            setState(() {
                              images = data;
                            });
                          },
                          child: const Icon(Icons.add_to_photos_outlined),
                        ),
                  SizedBox(
                    height: p1.maxHeight * 0.05,
                  ),
                  ContainerSplash(
                      width: p1.maxWidth * 0.35,
                      height: p1.maxHeight * 0.08,
                      fungsi: () async {
                        setState(() {
                          loading = true;
                        });
                        widget.wisata != false
                            ? await servis.createDataWisata(
                                wisata: nama.text,
                                deskripsi: deskripsi.text,
                                gambar: images!)
                            : widget.paketwisata != false
                                ? await servis.createDataPaketWisata(
                                    paket_wisata: nama.text,
                                    spot_wisata: spotwisata.text,
                                    villa: namavilla.text,
                                    telepon: notelp.text,
                                    harga: harga.text,
                                    fasilitas: deskripsi.text,
                                    gambar: images!)
                                : widget.budaya != false
                                    ? await servis.createDataBudaya(
                                        budaya: nama.text,
                                        deskripsi: deskripsi.text,
                                        gambar: images!)
                                    : widget.umkm != false
                                        ? await servis.createDataUmkm(
                                            umkm: nama.text,
                                            deskripsi: deskripsi.text,
                                            telepon: notelp.text,
                                            lat: lat.text,
                                            long: long.text,
                                            gambar: images!)
                                        : () {};
                        nama.clear();
                        deskripsi.clear();
                        notelp.clear();
                        spotwisata.clear();
                        namavilla.clear();
                        harga.clear();
                        lat.clear();
                        long.clear();
                        setState(() {
                          images!.clear();
                          loading = false;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Berhasil Simpan Data'),
                          ),
                        );
                      },
                      nama: "Upload")
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
