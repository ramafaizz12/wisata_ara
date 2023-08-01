part of 'widgets.dart';

class ContainerArHome extends StatelessWidget {
  final double width;
  final double height;
  const ContainerArHome({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await LaunchApp.openApp(
            androidPackageName: 'com.DefaultCompany.ARPARIWISATA');
      },
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: warnaorange, width: 1),
            shape: BoxShape.circle,
            color: warnaputih,
          ),
          child: LayoutBuilder(
            builder: (p0, p1) => Center(
              child: Text(
                "AR",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: warnamerah, fontSize: p1.maxWidth * 0.1),
              ),
            ),
          )),
    );
  }
}
