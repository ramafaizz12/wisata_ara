part of 'widgets.dart';

class ContainerSosialMedia extends StatelessWidget {
  final double width;
  final double height;
  const ContainerSosialMedia(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Social Media"),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(
                        Uri.parse(
                            'https://www.facebook.com/SemuaTentangDesaAraLembanna'),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Image.asset(
                    'assets/facebook.png',
                    width: 45,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(
                        Uri.parse('https://www.instagram.com/ara.bersinar/'),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Image.asset(
                    'assets/ig.png',
                    width: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(
                        Uri.parse(
                            'https://www.youtube.com/watch?v=rxalpRpEwWA'),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Image.asset(
                    'assets/yt.png',
                    width: 40,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
