part of 'widgets.dart';

class ContainerBudaya extends StatelessWidget {
  final double width;
  final String namabudaya;
  final String description;
  final List<String> gambar;
  final double height;
  const ContainerBudaya(
      {super.key,
      required this.width,
      required this.height,
      required this.gambar,
      this.namabudaya = '',
      this.description = ''});

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
                namabudaya,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: p1.maxWidth * 0.05,
                ),
              ),
              SizedBox(
                width: p1.maxWidth * 0.02,
              ),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontSize: p1.maxWidth * 0.05),
              )
            ],
          ),
        ),
      ),
    );
  }
}
