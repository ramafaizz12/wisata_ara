part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (p0, p1) => SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxHeight,
                      child: Image.asset(
                        'assets/background.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ContainerSplash(
                            nama: 'Login',
                            fungsi: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StreamProvider.value(
                                        value:
                                            FirebaseService.firebaseuserstream,
                                        initialData: null,
                                        child: Wrapper()),
                                  ));
                            },
                            width: p1.maxWidth * 0.33,
                            height: p1.maxHeight * 0.07),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Desa Wisata\nAra Lembanna",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: p1.maxWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: warnaorange),
                          ),
                          Text(
                            "Kabupaten Bulukumba\n Sulawesi Selatan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: p1.maxWidth * 0.04,
                                fontWeight: FontWeight.w500,
                                color: warnaputih),
                          ),
                          SizedBox(
                            height: p1.maxHeight * 0.2,
                          ),
                          ContainerSplash(
                            nama: 'Start Guide',
                            fungsi: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            },
                            width: p1.maxWidth * 0.45,
                            height: p1.maxHeight * 0.07,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
