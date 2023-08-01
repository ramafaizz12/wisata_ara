part of 'widgets.dart';

class ContainerSplash extends StatelessWidget {
  final double width;
  final double height;
  final String nama;
  final void Function()? fungsi;
  const ContainerSplash(
      {super.key,
      required this.width,
      required this.height,
      required this.fungsi,
      required this.nama});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fungsi,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: warnaorange2,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4))
          ],
        ),
        child: LayoutBuilder(
          builder: (p0, p1) => Center(
            child: Text(
              nama,
              textAlign: TextAlign.center,
              style: TextStyle(color: warnaputih, fontSize: p1.maxWidth * 0.1),
            ),
          ),
        ),
      ),
    );
  }
}
