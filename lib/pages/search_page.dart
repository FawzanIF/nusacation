part of 'pages.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";
  String nameFor = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));
        return false;
      },
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'Pencarian Destinasi',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                        
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kWhiteColor,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: kGreyColor,
                              size: 36.0,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    name = val;
                                  });
                                },
                                style: greyTextStyle,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Temukan Tempat Impian Kamu',
                                  hintStyle: greyTextStyle.copyWith(fontSize: 14),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            minHeight: 100,
                            minWidth: double.infinity,
                            maxHeight: MediaQuery.of(context).size.height),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('destinations')
                              .snapshots(),
                          builder: (context, snapshots) {
                            return (snapshots.connectionState ==
                                    ConnectionState.waiting)
                                ? Center(
                                    child: LoadingShimmerSearch(true),
                                  )
                                : ListView.builder(
                                    itemCount: snapshots.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var result = snapshots.data!;
                                      // var dataaa = snapshots.data!.docs[index].data()
                                      //     as Map<String, dynamic>;
                                      List<DestinationModel> data = result.docs.map(
                                        (e) {
                                          return DestinationModel.fromJson(
                                              e.data() as Map<String, dynamic>);
                                        },
                                      ).toList();
                                      // var data = snapshots.data!.docs[index].data()
                                      //     as Map<String, dynamic>;

                                      if (name.isEmpty) {
                                        return GestureDetector(
                                          onTap: () {
                                            context.read<PageBloc>().add(
                                                GoToDetailDestinationPage(
                                                    data[index]));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                top: 14,
                                                left: defaultMargin,
                                                right: defaultMargin),
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  margin:
                                                      EdgeInsets.only(right: 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(18),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        data[index].imageUrl!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        data[index].name!,
                                                        style:
                                                            blackTextStyle.copyWith(
                                                          fontSize: 18,
                                                          fontWeight: medium,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        data[index].city!,
                                                        style:
                                                            greyTextStyle.copyWith(
                                                          fontWeight: light,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      margin: EdgeInsets.only(
                                                        right: 2,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/ic-star.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .rating!
                                                          .toString(),
                                                      style:
                                                          blackTextStyle.copyWith(
                                                        fontWeight: medium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      if (data[index]
                                          .name!
                                          .toString()
                                          .toLowerCase()
                                          .startsWith(name.toLowerCase())) {
                                        return GestureDetector(
                                          onTap: () {
                                            context.read<PageBloc>().add(
                                                GoToDetailDestinationPage(
                                                    data[index]));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                top: 14,
                                                left: defaultMargin,
                                                right: defaultMargin),
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  margin:
                                                      EdgeInsets.only(right: 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(18),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        data[index].imageUrl!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        data[index].name!,
                                                        style:
                                                            blackTextStyle.copyWith(
                                                          fontSize: 18,
                                                          fontWeight: medium,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        data[index].city!,
                                                        style:
                                                            greyTextStyle.copyWith(
                                                          fontWeight: light,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      margin: EdgeInsets.only(
                                                        right: 2,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/ic-star.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .rating!
                                                          .toString(),
                                                      style:
                                                          blackTextStyle.copyWith(
                                                        fontWeight: medium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      return Container();
                                    });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                                  SafeArea(
                                    child: Container(
                        margin: EdgeInsets.only(left: 14,top: 12),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: kBlackColor),
                          onPressed: () {
                            context.read<PageBloc>().add(GoToMainPage());
                          },
                        ),
                      ),
                                  ),
            ],
          )),
    );
  }
}
