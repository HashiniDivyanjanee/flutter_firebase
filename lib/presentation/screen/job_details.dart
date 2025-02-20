import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class JobDetails extends StatelessWidget {
  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Job Card Details',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppThemes.PrimaryColor,
          bottom: TabBar(
            dividerColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: Tab(
                      icon: Icon(
                    Icons.work,
                    color: Colors.white,
                    size: 30,
                  )),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: Tab(
                      icon: Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 30,
                  )),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: Tab(
                      icon: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 30,
                  )),
                )),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [],
        ),
      ),
    );
  }
}
