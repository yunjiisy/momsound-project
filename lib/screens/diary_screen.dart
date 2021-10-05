import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:momsori/screens/diary_edit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiaryScreen extends StatefulWidget {
  @override
  DiaryScreenState createState() => DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  //event
  // Map<DateTime, List<Event>> selectedEvents;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  var today = DateTime.now().toString().split(' ')[0].split('-');

  TextEditingController _eventController = TextEditingController();
  CalendarBuilders calendarBuilders = CalendarBuilders();
  Map<DateTime, List> events;
  Map<DateTime, List> health;
  Map<DateTime, List> diarytext;
  Map<DateTime, List> feeling;

  List<dynamic> _selectedEvents;

 

  List<dynamic> getEventsForDays(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void initState() {
    //event
    super.initState();
    calendarBuilders = CalendarBuilders();
    events = {
      DateTime.utc(2021, 10, 3): [0xFFD3E7E4],
      DateTime.utc(2021, 10, 1): [0xFFD6E2F3],
    };
    health = {
      DateTime.utc(2021, 10, 3): ['assets/icons/Frame 40.svg','?????'],
      DateTime.utc(2021, 10, 1): ['assets/icons/Frame 40.svg','?????']
    };
    feeling = {
      DateTime.utc(2021, 10, 3): ['우울'],
      DateTime.utc(2021, 10, 1): ['무기력'],
    };
    diarytext = {
      DateTime.utc(2021, 10, 3): ['하루종일 비가온다 '],
      DateTime.utc(2021, 10, 1): ['하루종일 비가온다 비가온다아ㅏㅇ'],
    };
    _selectedEvents = [];
    // edit();
  }

  @override
  void dispose() {

    //  _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: ListView(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Text(
                  '다이어리',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(1),
            child: Row(
              children: [
                Text(
                  today[0] +
                      '.' +
                      today[1] +
                      '.' +
                      today[2] +
                      ' 출산예정 / ' +
                      'd_120 / ' +
                      '32주차',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            child: TableCalendar(
              daysOfWeekHeight: 25.0,
              rowHeight: 60,
              //locale: 'ko-KR',
              focusedDay: DateTime.now(),
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              headerStyle: HeaderStyle(
                headerMargin:
                    EdgeInsets.only(left: 40, top: 2, right: 40, bottom: 10),
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.arrow_left),
                rightChevronIcon: Icon(Icons.arrow_right),
                titleTextStyle: const TextStyle(fontSize: 17.0),
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                todayDecoration: BoxDecoration(
                    color: Colors.pink[100], shape: BoxShape.circle),
                outsideDaysVisible: true,
                isTodayHighlighted: true,
                weekendTextStyle: TextStyle().copyWith(color: Colors.red),
                holidayTextStyle: TextStyle().copyWith(color: Colors.blue[800]),
                selectedTextStyle: TextStyle(color: Colors.white),
                selectedDecoration: BoxDecoration(
                  color: Colors.grey[500],
                  shape: BoxShape.circle,
                ),
                markersAutoAligned: false,
                // markersOffset: PositionedOffset(start:23 , top: 29.0)
                markersAlignment: AlignmentGeometry.lerp(
                    Alignment.center, Alignment.center, 0),
                markerMargin: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
              ),

              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

<<<<<<< HEAD
           

              calendarBuilders: makemarkerbuilder(events),

           
              eventLoader: getEventsForDays,

=======
>>>>>>> 11ab17bc84d314a10f8774f7e2b14e75e20fdf82
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  var year = focusDay.year;
                  var month = selectDay.month;
                  var day = selectDay.day;
                  var week = selectDay.weekday;
                  selectedDay = selectDay;
                  focusedDay = focusDay;
<<<<<<< HEAD
                  _selectedEvents = getEventsForDays(selectedDay);
                  int colors;
                  if (events[selectDay] == null) {
                    colors = 0xffffffff;
                    // colors = 0xFFF2CDCA;
                  } else {
                    colors = events[selectDay][0];
                  }
                  String healthIcon;
                  String healthText;
                  if (health[selectDay] == null) {
                    healthIcon = ' ';
                    healthText = ' ';
                  } else {
                    healthIcon = health[selectedDay][0];
                    healthText = health[selectedDay][1];
                  }

                  // String healthText;
                  // if (health[selectedDay][1] == null) {
                  //  // healthText = ' ';
                  //   health[selectDay][1] = ' ';
                  // } else {
                  //   healthText = health[selectedDay][1];
                  // }

                  String diaryText;
                  if (diarytext[selectDay] == null) {
                    diaryText = ' ';
                  } else {
                    diaryText = diarytext[selectedDay][0];
                  }
                  String Feeling;
                  if (feeling[selectDay] == null) {
                    Feeling = ' ';
                  } else {
                    Feeling = feeling[selectedDay][0];
                  }
=======
>>>>>>> 11ab17bc84d314a10f8774f7e2b14e75e20fdf82

                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return Container(
                        height: 350,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    // child: Text(
                                    //   today[1] + '/' + today[2],
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    child: Text(
                                      '$year.$month.$day (32주차)',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      // padding: EdgeInsets.only(right: 0),
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '감정상태/건강상태',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
<<<<<<< HEAD
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Color(colors),
                                              size: 36,
                                            ),
                                            Text(
                                              Feeling,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
=======
                                        Icon(
                                          Icons.circle,
                                          color: Color(0xFFD3E7E4),
                                          size: 36,
>>>>>>> 11ab17bc84d314a10f8774f7e2b14e75e20fdf82
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
<<<<<<< HEAD
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              healthIcon,
                                              width: 36,
                                              height: 36,
                                            ),
                                            Text(
                                              healthText,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
=======
                                        SvgPicture.asset(
                                          'assets/icons/Frame 40.svg',
                                          width: 36,
                                          height: 36,
>>>>>>> 11ab17bc84d314a10f8774f7e2b14e75e20fdf82
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 10, right: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '녹음파일',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '메모',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          //TextField()
                                          Row(
                                            children: [
                                              Text(diaryText),
                                              //Text(feeling[selectedDay][0])
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // ..._getEventsfromDay(selectedDay).map(
                              //   (Event event) => ListTile(
                              //     title: Text(event.title),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ); //bottom sheet
                });
                print(focusedDay);
                print(selectedDay);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    // Navigator.of(context).push(
                    //   //Default page transition of IOS
                    //   CupertinoPageRoute(
                    //     builder: (context) => DiaryEdit(),
                    //   ),
                    // );

                    final eventsdata = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiaryEdit(
                                  events = events,
                                  health = health,
                                  selectedDay = selectedDay,
                                  feeling = feeling,
                                  diarytext = diarytext,
                                )));
                    setState(() {
                      events = eventsdata[0];
                      health = eventsdata[1];
                      diarytext = eventsdata[2];
                      feeling = eventsdata[3];
                      print('다이어리스키이이이이인');
                      print(events);
                      print(health);
                      print(selectedDay);
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/edit button.svg',
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildEventsMarker(DateTime date) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        border: Border.all(width: 2, color: Colors.blue[300]!)),
  );
}

Widget buildBottomSheet(BuildContext context) {
  return Container();
}
