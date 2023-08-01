part of 'widgets.dart';

class ContainerPaketWisata extends StatelessWidget {
  final String namapaketwisata;
  final String namaspotwisata;
  final String gambar;
  final String villa;
  final String telepon;
  final String harga;
  final String fasilitas;

  const ContainerPaketWisata(
      {super.key,
      this.namapaketwisata = '',
      this.namaspotwisata = '',
      this.gambar = '',
      this.villa = '',
      this.telepon = '',
      this.harga = '',
      this.fasilitas = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: abuabu,
          border: Border.all(
            color: warnaputih,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(19)),
      child: LayoutBuilder(
          builder: (p0, p1) => Container(
                width: p1.maxWidth * 0.05,
                height: p1.maxHeight * 0.05,
                margin: EdgeInsets.all(p1.maxWidth * 0.04),
                decoration: BoxDecoration(
                  color: warnaputih,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: LayoutBuilder(
                    builder: (p0, p2) => Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(19),
                                    topRight: Radius.circular(19)),
                                child: Image.network(
                                  '$gambar',
                                  height: p2.maxHeight * 0.5,
                                  width: p2.maxWidth,
                                  fit: BoxFit.fill,
                                )),
                            Padding(
                              padding: EdgeInsets.all(p2.maxHeight * 0.027),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Paket Lengkap $villa.",
                                    style: TextStyle(
                                        fontSize: p2.maxHeight * 0.06,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: p2.maxHeight * 0.08,
                                      ),
                                      Text(
                                        "$namaspotwisata",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: p2.maxHeight * 0.06),
                                      )
                                    ],
                                  ),
                                  SizedBox(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                                "Fasilitas Yang Didapatkan"),
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("$fasilitas"),
                                                InkWell(
                                                  onTap: () {
                                                    launchUrl(
                                                        Uri.parse(
                                                            'whatsapp://send?phone=62$telepon&text=Hello%20Saya Ingin Memesan Tempat!'),
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: p1.maxHeight *
                                                              0.6),
                                                      width: p1.maxWidth * 0.9,
                                                      height:
                                                          p1.maxHeight * 0.3,
                                                      child: Center(
                                                        child: Text(
                                                          "Lanjutkan Ke WhatsApp",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: warnaputih,
                                                              fontSize:
                                                                  p1.maxHeight *
                                                                      0.06),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(19),
                                                          color: warnawa),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: p2.maxWidth * 0.7,
                                        height: p2.maxHeight * 0.15,
                                        decoration: BoxDecoration(
                                            color: warnaorange,
                                            borderRadius:
                                                BorderRadius.circular(19)),
                                        child: Text(
                                          "Lihat Detail",
                                          style: TextStyle(color: warnaputih),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
              )),
    );
  }
}
