part of 'widgets.dart';

class ImageDialog extends StatelessWidget {
  final String? image;

  const ImageDialog({this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(image!), fit: BoxFit.fill)),
      ),
    );
  }
}
