part of 'widgets.dart';

class ContainerDashboard extends StatelessWidget {
  final String nama;
  final double width;
  final double height;
  final void Function()? fungsi;
  const ContainerDashboard(
      {super.key,
      required this.width,
      required this.height,
      this.fungsi,
      required this.nama});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fungsi,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: warnaputih, borderRadius: BorderRadius.circular(8)),
          child: LayoutBuilder(
            builder: (p0, p1) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "$nama",
                  style: TextStyle(
                      color: warnamerah, fontSize: p1.maxWidth * 0.08),
                ),
                SvgPicture.asset(
                  'assets/iconmaps.svg',
                )
              ],
            ),
          )),
    );
  }
}
