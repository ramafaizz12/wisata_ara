part of 'widgets.dart';

class ContainerLoading extends StatelessWidget {
  final double width;
  final double height;
  const ContainerLoading({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GridView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 2.0,
            crossAxisCount: 1,
            childAspectRatio: (9 / 13)),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: abuabu,
          highlightColor: warnaputih,
          child: Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: warnaorange,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: const Offset(2, 4)),
              ],
            ),
            child: LayoutBuilder(
              builder: (p0, p1) => Column(
                children: [
                  Container(
                    color: warnaputih,
                    width: p1.maxWidth * 0.3,
                    height: p1.maxHeight * 0.4,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
