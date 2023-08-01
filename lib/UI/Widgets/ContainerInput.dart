part of 'widgets.dart';

class ContainerInput extends StatefulWidget {
  String nama;
  TextEditingController control = TextEditingController();
  Function(String)? fungsi;

  String? hint;
  double lebarinput;

  TextInputType? tipekeyboard;
  Color warnaborder;
  VoidCallback? ontapfield;

  ContainerInput(
      {super.key,
      required this.nama,
      required this.control,
      this.lebarinput = 30,
      this.hint,
      this.ontapfield,
      this.fungsi,
      this.tipekeyboard,
      this.warnaborder = hitam});

  @override
  State<ContainerInput> createState() => _ContainerInputState();
}

class _ContainerInputState extends State<ContainerInput> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.nama,
            style: textpoppin.copyWith(fontSize: 15),
          ),
          Container(
            width: p1.maxWidth,
            margin: EdgeInsets.only(top: p1.maxHeight * 0.03),
            height: widget.lebarinput,
            decoration: BoxDecoration(
                color: warnaputih,
                border: Border.all(width: 1.0, color: hitam),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: widget.control,
              onTap: widget.ontapfield,
              minLines: 2,
              maxLines: 10,
              keyboardType: widget.tipekeyboard,
              style: textpoppin.copyWith(fontSize: 17),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 5, left: 5)),
              onChanged: widget.fungsi,
            ),
          )
        ],
      ),
    );
  }
}
