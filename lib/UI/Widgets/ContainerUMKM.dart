part of 'widgets.dart';

class ContainerUMKM extends StatelessWidget {
  final double width;
  final double height;
  final String gambar;
  final String namaumkm;
  final String deskripsi;
  const ContainerUMKM(
      {super.key,
      required this.width,
      required this.height,
      this.namaumkm = '',
      this.deskripsi = '',
      this.gambar = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7, right: 7, bottom: 7),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: warnaputih,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(2, 4)),
        ],
      ),
      child: LayoutBuilder(
        builder: (p0, p1) => Padding(
          padding: EdgeInsets.only(
              left: p1.maxWidth * 0.05,
              right: p1.maxWidth * 0.05,
              bottom: p1.maxHeight * 0.05,
              top: p1.maxHeight * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  gambar,
                  width: p1.maxWidth * 0.3,
                  height: p1.maxHeight,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(p1.maxHeight * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaumkm,
                      style: TextStyle(fontSize: p1.maxHeight * 0.13),
                    ),
                    Row(children: [
                      Icon(
                        Icons.star,
                        color: warnaorange,
                        size: p1.maxHeight * 0.2,
                      ),
                      Text(
                        "4.9",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
