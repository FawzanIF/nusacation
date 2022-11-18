part of 'pages.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _enabled = true;

    Widget infoWidget() {
      return Container(
        constraints: BoxConstraints(
            minHeight: 100,
            minWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height),
        child: BlocBuilder<InfoBloc, InfoState>(
          builder: (_, infoState) {
            if (infoState is InfoLoaded) {
              List<InfoModel>? infos = infoState.info;

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 120),
                shrinkWrap: true,
                itemCount: infos!.length,
                itemBuilder: (_, index) => InformationCard(
                  infos[index],
                  onTap: () {
                    context
                        .read<PageBloc>()
                        .add(GoToDetailInfoPage(infos[index]));
                  },
                ),
              );
            } else {
              return LoadingShimmer(_enabled);
            }
          },
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return false;
      },
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    child: Column(children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Newsacation',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      infoWidget()
                      // DestinationCard()
                    ]),
                  ),
                  SafeArea(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 8, top: 12, bottom: 12, right: 12),
                      margin: EdgeInsets.only(left: defaultMargin, top: 14),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                      child: InkWell(
                        onTap: () {
                          context.read<PageBloc>().add(GoToMainPage());
                        },
                        child: Image.asset(
                          'assets/btn-back.png',
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
