part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseService auth = FirebaseService();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isemailvalid = false;
  bool obscure = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: warnabackground,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.15,
                left: p1.maxWidth * 0.032,
                right: p1.maxWidth * 0.032),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FloatingActionButton(
                    backgroundColor: warnaorange,
                    elevation: 12,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ));
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxHeight * 0.02,
                          right: p1.maxHeight * 0.02),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: p1.maxHeight * 0.031),
                            Text(
                              "Login",
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: hitam,
                                  fontSize: p1.maxHeight * 0.02),
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: warnaputih,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (text) {},
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
                                          border: InputBorder.none),
                                      controller: username,
                                      style: textpoppin,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: warnaputih,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Stack(children: [
                                    TextField(
                                      obscureText: obscure,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
                                          border: InputBorder.none),
                                      controller: password,
                                      style: textpoppin,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: p1.maxHeight * 0.02,
                                          right: p1.maxWidth * 0.02),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: obscure != true
                                              ? InkWell(
                                                  child: const Icon(
                                                      Icons.visibility),
                                                  onTap: () {
                                                    setState(() {
                                                      obscure = true;
                                                    });
                                                  })
                                              : InkWell(
                                                  child: const Icon(
                                                      Icons.visibility_off),
                                                  onTap: () {
                                                    setState(() {
                                                      obscure = false;
                                                    });
                                                  })),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.03,
                            ),
                            ContainerSplash(
                                width: p1.maxWidth * 0.45,
                                height: p1.maxHeight * 0.07,
                                fungsi: () {
                                  auth.SigninEmail(
                                      username.text, password.text);
                                },
                                nama: 'Masuk')
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.07,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
