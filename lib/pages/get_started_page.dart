part of 'pages.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img-get-started.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 122,
                      width: 217,
                      margin: EdgeInsets.only(right: defaultMargin),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/ic_started2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 132,
                ),
                Container(
                  height: 118,
                  width: 172,
                  margin: EdgeInsets.only(left: defaultMargin),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ic_started1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToSignInPage());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 46,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kWhiteColor,
                      ),
                      child: Text(
                        'Mulai Berlibur',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
