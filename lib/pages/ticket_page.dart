part of 'pages.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: kBackgroundColor,
      )),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            // backgroundColor:kBackgroundColor,
            bottom: TabBar(
              indicatorColor: kBlueColor,
              labelColor: kBlackColor,
              unselectedLabelColor: kGrey3Color,
              unselectedLabelStyle:
                  grey3TextStyle.copyWith(fontSize: 16, fontWeight: medium),
              labelStyle:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              indicatorWeight: 4,
              tabs: [
                Tab(
                  child: Text(
                    'Destinasi', style: TextStyle(fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text('Paket', style: TextStyle(fontSize: 14),),
                ),
                Tab(child: Text('Akomodasi', style: TextStyle(fontSize: 14),)),
              ],
            ),
            title: Text(
              'Tiket Saya',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [DestinationTicket(), TiketPaket(), AkomodasiTicket()],
          ),
        ),
      ),
    );
  }
}
