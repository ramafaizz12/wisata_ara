part of 'pages.dart';

class TentangApp extends StatelessWidget {
  const TentangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TranslateBloc, String>(
          builder: (context, state) {
            return Text(state == 'id'
                ? "Tentang Aplikasi"
                : state == 'en'
                    ? 'About Application'
                    : state == 'zh-cn'
                        ? '关于申请'
                        : '');
          },
        ),
        backgroundColor: warnaorange,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("English"),
                onTap: () {
                  context
                      .read<TranslateBloc>()
                      .add(InputArgumen(kodebahasa: 'en'));
                },
              ),
              PopupMenuItem(
                child: Text(
                  "Indonesia",
                ),
                onTap: () {
                  context
                      .read<TranslateBloc>()
                      .add(InputArgumen(kodebahasa: 'id'));
                },
              ),
              PopupMenuItem(
                child: Text("China"),
                onTap: () {
                  context
                      .read<TranslateBloc>()
                      .add(InputArgumen(kodebahasa: 'zh-cn'));
                },
              )
            ],
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (p0, p1) => SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.04,
                left: p1.maxWidth * 0.04,
                right: p1.maxWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<TranslateBloc, String>(
                    builder: (context, state) {
                      return Text(
                        state == 'id'
                            ? "Tentang Aplikasi"
                            : state == 'en'
                                ? 'About Application'
                                : state == 'zh-cn'
                                    ? '关于申请'
                                    : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: warnaorange,
                            fontSize: p1.maxHeight * 0.03),
                      );
                    },
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.02,
                  ),
                  BlocBuilder<TranslateBloc, String>(
                    builder: (context, state) {
                      return state == 'id'
                          ? Text(
                              "Dengan aplikasi wisata inovatif kami, Anda akan menemukan dunia baru yang menakjubkan di ujung jari Anda. Nikmati kemudahan merencanakan perjalanan Anda mulai dari memilih destinasi hingga mengatur jadwal perjalanan, semua dalam satu aplikasi yang intuitif dan mudah digunakan. Temukan tempat-tempat menakjubkan yang belum pernah Anda dengar sebelumnya, jauh dari keramaian wisata konvensional, dan hadirilah pengalaman yang benar-benar otentik. Dapatkan akses langsung ke rekomendasi lokal dari para penduduk setempat yang berpengalaman, dengan tips tentang makanan khas, tempat-tempat tersembunyi yang menarik, dan acara-acara budaya yang tak terlupakan. Aplikasi kami memberikan panduan lengkap untuk menjelajahi destinasi dengan peta interaktif, rute perjalanan, dan informasi praktis tentang transportasi, akomodasi, dan atraksi wisata. Anda dapat mengkustomisasi perjalanan Anda sesuai dengan minat dan preferensi pribadi, sehingga setiap petualangan menjadi unik dan personal. Dengan aplikasi wisata kami, Anda tidak hanya menjadi turis biasa, tetapi seorang penjelajah yang penuh petualangan. Temukan keajaiban dunia ini dengan cara yang baru dan menarik, dan buat kenangan tak terlupakan yang akan membawa Anda selamanya. Siap untuk memulai perjalanan Anda menuju petualangan yang menginspirasi? Unduh aplikasi kami sekarang dan jadilah penjelajah sejati!")
                          : state == 'en'
                              ? Text(
                                  'With our innovative travel app, youll find an amazing new world at your fingertips. Enjoy the convenience of planning your trip from choosing a destination to managing your itinerary, all in one intuitive and easy-to-use application. Discover amazing places youve never heard of before, away from the conventional tourist crowds, and attend a truly authentic experience. Get first-hand access to local recommendations from seasoned locals, with tips on local specialties, hidden gems and unforgettable cultural events. Our app provides a complete guide to exploring destinations with interactive maps, travel routes and practical information on transportation, accommodation and tourist attractions. You can customize your trip according to your personal interests and preferences, so every adventure is unique and personal. With our travel app you will not just become an ordinary tourist, but an adventurous explorer. Discover the wonders of this world in new and exciting ways, and create unforgettable memories that will last you forever. Ready to start your journey to an inspiring adventure? Download our app now and become a true explorer!')
                              : state == 'zh-cn'
                                  ? Text(
                                      '借助我们创新的旅行应用程序，您将发现触手可及的神奇新世界。 享受规划旅行的便利，从选择目的地到管理行程，一切都在一个直观且易于使用的应用程序中完成。 远离传统的旅游人群，探索您以前从未听说过的令人惊叹的地方，并享受真正真实的体验。 获得经验丰富的当地人的第一手建议，了解当地特色菜、隐藏的瑰宝和令人难忘的文化活动。 我们的应用程序通过交互式地图、旅行路线以及交通、住宿和旅游景点的实用信息提供全面的目的地探索指南。 您可以根据您的个人兴趣和喜好定制您的旅行，因此每次冒险都是独特且个性化的。 使用我们的旅行应用程序，您不仅会成为一名普通的游客，而且会成为一名冒险的探险家。 以新的、令人兴奋的方式发现这个世界的奇迹，并创造永远难忘的回忆。 准备好开始您的鼓舞人心的冒险之旅了吗？ 立即下载我们的应用程序，成为真正的探险家！')
                                  : SizedBox();
                    },
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
