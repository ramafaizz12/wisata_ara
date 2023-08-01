part of 'pages.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool kondisiwisata = false;
  bool kondisipaketwisata = false;
  bool budaya = false;
  bool tambahdata = false;
  bool hapusdata = false;
  bool umkm = false;
  FirebaseService servis = FirebaseService();
  final List<String> namainput = ['Wisata', 'Paket Wisata', 'Budaya', 'UMKM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Tambah Data",
        ),
        backgroundColor: warnaorange,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Logout"),
                onTap: () {
                  servis.Logoutanonymus();
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: warnabackground,
      body: Padding(
        padding: EdgeInsets.all(17),
        child: LayoutBuilder(
          builder: (p0, p1) => SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          tambahdata = true;
                          hapusdata = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                tambahdata != false ? warnaorange : warnapink,
                            borderRadius: BorderRadius.circular(15)),
                        width: p1.maxWidth * 0.3,
                        height: p1.maxHeight * 0.05,
                        child: Text(
                          "Tambah Data",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: tambahdata != false ? warnaputih : hitam,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: p1.maxWidth * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          hapusdata = true;
                          tambahdata = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: hapusdata != false ? warnaorange : warnapink,
                            borderRadius: BorderRadius.circular(15)),
                        width: p1.maxWidth * 0.3,
                        height: p1.maxHeight * 0.05,
                        child: Text(
                          "Hapus Data",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: hapusdata != false ? warnaputih : hitam,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.02,
                ),
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.1,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: namainput.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          index == 0
                              ? kondisiwisata = true
                              : kondisiwisata = false;
                          index == 1
                              ? kondisipaketwisata = true
                              : kondisipaketwisata = false;
                          index == 2 ? budaya = true : budaya = false;
                          index == 3 ? umkm = true : umkm = false;
                        });
                      },
                      child: Container(
                        width: p1.maxWidth * 0.4,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                          color: warnapink,
                          border: Border.all(color: warnaputih, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            namainput[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 7.0,
                            crossAxisSpacing: 2.0,
                            crossAxisCount: 1,
                            childAspectRatio: (6 / 13)),
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.04,
                ),
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.78,
                  child: tambahdata != false
                      ? FormInput(
                          wisata: kondisiwisata,
                          paketwisata: kondisipaketwisata,
                          budaya: budaya,
                          umkm: umkm)
                      : kondisiwisata != false
                          ? const DeletePageWisata()
                          : kondisipaketwisata != false
                              ? const DeletePaketWisata()
                              : budaya != false
                                  ? const DeletePageBudaya()
                                  : umkm != false
                                      ? const DeletePageUmkm()
                                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
