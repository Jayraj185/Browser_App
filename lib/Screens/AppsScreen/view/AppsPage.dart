import 'package:browser/Screens/BottomScreen/Provider/BottomProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AppsPage extends StatefulWidget {
  const AppsPage({Key? key}) : super(key: key);

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  BottomProvider? ProviderTrue;
  BottomProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<BottomProvider>(context,listen: true);
    ProviderFalse = Provider.of<BottomProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: [
              SizedBox(height: 3.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 7.w),
                  child: Text(
                      "OTT Platform Apps",
                    style: TextStyle(
                        color: Color(0xFF2C2926),
                      fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 11.h,
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProviderTrue!.videoApp.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          ProviderFalse!.ChangeIndex2(index, ProviderTrue!.videoApp);
                          Navigator.pushNamed(context, 'Appshow');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 7.6.h,
                              width: 7.6.h,
                              margin: EdgeInsets.only(left: 6.w,right: 1.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0,0)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset("${ProviderTrue!.videoApp[index].image}"),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 6.w,right: 1.w),
                              child: Text(
                                  "${ProviderTrue!.videoApp[index].name}",
                                style: TextStyle(
                                  color: Color(0xFF2C2926),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                ),
              ),
              SizedBox(height: 6.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 7.w),
                  child: Text(
                    "Education Apps",
                    style: TextStyle(
                        color: Color(0xFF2C2926),
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 11.6.h,
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProviderTrue!.educationApp.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        ProviderFalse!.ChangeIndex2(index, ProviderTrue!.educationApp);
                        Navigator.pushNamed(context, 'Appshow');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 7.6.h,
                            width: 7.6.h,
                            margin: EdgeInsets.only(left: 6.w,right: 1.w,top: 0.6.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0,0)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("${ProviderTrue!.educationApp[index].image}"),
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w,right: 1.w),
                            child: Text(
                              "${ProviderTrue!.educationApp[index].name}",
                              style: TextStyle(
                                color: Color(0xFF2C2926),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 6.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 7.w),
                  child: Text(
                    "Social Media Apps",
                    style: TextStyle(
                        color: Color(0xFF2C2926),
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 11.h,
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProviderTrue!.socialApp.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        ProviderFalse!.ChangeIndex2(index, ProviderTrue!.socialApp);
                        Navigator.pushNamed(context, 'Appshow');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 7.6.h,
                            width: 7.6.h,
                            margin: EdgeInsets.only(left: 6.w,right: 1.w),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0,0)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("${ProviderTrue!.socialApp[index].image}"),
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w,right: 1.w),
                            child: Text(
                              "${ProviderTrue!.socialApp[index].name}",
                              style: TextStyle(
                                color: Color(0xFF2C2926),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 6.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 7.w),
                  child: Text(
                    "Shopping Apps",
                    style: TextStyle(
                        color: Color(0xFF2C2926),
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 11.h,
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProviderTrue!.shoppingApp.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        ProviderFalse!.ChangeIndex2(index, ProviderTrue!.shoppingApp);
                        Navigator.pushNamed(context, 'Appshow');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 7.6.h,
                            width: 7.6.h,
                            margin: EdgeInsets.only(left: 6.w,right: 1.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0,0)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("${ProviderTrue!.shoppingApp[index].image}"),
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w,right: 1.w),
                            child: Text(
                              "${ProviderTrue!.shoppingApp[index].name}",
                              style: TextStyle(
                                color: Color(0xFF2C2926),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 6.h,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 7.w),
                  child: Text(
                    "News Apps",
                    style: TextStyle(
                        color: Color(0xFF2C2926),
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 11.6.h,
                //color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProviderTrue!.newsApp.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        ProviderFalse!.ChangeIndex2(index, ProviderTrue!.newsApp);
                        Navigator.pushNamed(context, 'Appshow');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 7.6.h,
                            width: 7.6.h,
                            margin: EdgeInsets.only(left: 6.w,right: 1.w,top: 0.6.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(0,0)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("${ProviderTrue!.newsApp[index].image}"),
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w,right: 1.w),
                            child: Text(
                              "${ProviderTrue!.newsApp[index].name}",
                              style: TextStyle(
                                color: Color(0xFF2C2926),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
