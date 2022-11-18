part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3),
        () => this.context.read<PageBloc>().add(GoToGetStartedPage()));
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img-logo.png'),
                ),
              ),
            ),
            Text(
              'Nusacation',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
