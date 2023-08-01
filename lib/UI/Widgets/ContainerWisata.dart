part of 'widgets.dart';

class ContainerWisata extends StatelessWidget {
  final double width;
  final double height;
  final String namawisata;
  final String deskripsi;
  final List<String> gambar;
  const ContainerWisata(
      {super.key,
      required this.width,
      required this.height,
      this.namawisata = '',
      this.deskripsi = '',
      required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7, right: 7, bottom: 7),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: warnapink,
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
              top: p1.maxHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  gambar[0],
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.7,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                namawisata,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: p1.maxWidth * 0.05,
                ),
              ),
              Text(
                deskripsi,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontSize: p1.maxWidth * 0.033),
              )
            ],
          ),
        ),
      ),
    );
  }
}
