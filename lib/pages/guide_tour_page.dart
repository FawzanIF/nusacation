part of "pages.dart";

class GuideTourPage extends StatelessWidget {
  const GuideTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _enabled = true;

    Widget vacationSpot() {
      return Container(
        constraints: BoxConstraints(
            minHeight: 100,
            minWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height),
        child: BlocBuilder<GuideTourBloc, GuideTourState>(
          builder: (_, guideTourState) {
            if (guideTourState is GuideTourLoaded) {
              List<GuideTourModel>? guideTour = guideTourState.guideTour;

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 120),

                shrinkWrap: true,
                itemCount: guideTour!.length,
                itemBuilder: (_, index) => GuideTourCard(
                  guideTour[index],
                  // onTap: () {

                  // },
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    child: Column(children: [
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Text(
                          'Pemandu Wisata',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      vacationSpot(),
                      // DestinationCard()
                    ]),
                  ),
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
          )),
    );
  }
}
