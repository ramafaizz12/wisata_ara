part of 'widgets.dart';

class ContainerPencarian extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? fungsi;
  final void Function(String)? onchanged;
  const ContainerPencarian(
      {super.key,
      required this.width,
      required this.height,
      this.fungsi,
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, String>(
      builder: (context, state) {
        return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: warnapink, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onChanged: onchanged,
                onTap: fungsi,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: warnamerah,
                    ),
                    hintText: state == 'id'
                        ? "Cari Tempat Wisata"
                        : state == 'en'
                            ? 'Find Tourist Attractions'
                            : state == 'zh-cn'
                                ? '寻找旅游景点'
                                : '',
                    hintStyle: TextStyle(color: warnamerah),
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 5, left: 5),
                    border: InputBorder.none),
              ),
            ));
      },
    );
  }
}
