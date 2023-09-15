import 'package:hng_internship_mobile_track_stage_2_task/model/utilities/imports/generalImport.dart';

import 'editCVPage.dart';

class CvPage extends StatelessWidget {
  String? fullName;
  String? slackUsername;
  String? githubHandle;
  String? bio;
  List<String> detail = [
    "Ifeanyichukwu Obeta",
    "Ifeanyichukwu Obeta",
    "https://github.com/angeloobeta",
    "I'm a mobile fullstack developer i.e I build both the mobile app using Flutter framework and the backend using Java or JavaScript. You get it",
  ];
  CvPage(
      {super.key,
      this.fullName,
      this.slackUsername,
      this.githubHandle,
      this.bio});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const GeneralTextDisplay(
                'CV Preview', grey, 1, 25, FontWeight.normal, 'full_name'),
          ),
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline, color: green),
                  title: const GeneralTextDisplay('Full Name', black, 1, 20,
                      FontWeight.normal, 'full_name'),
                  subtitle: Text(fullName ?? detail[0]),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: pink),
                  title: const GeneralTextDisplay('Slack Username', black, 1,
                      20, FontWeight.normal, 'full_name'),
                  subtitle: Text(slackUsername ?? detail[1]),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: blue),
                  title: const GeneralTextDisplay('GitHub Handle', black, 1, 20,
                      FontWeight.normal, 'full_name'),
                  subtitle: Text(githubHandle ?? detail[2]),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: brown),
                  title: const Row(
                    children: [
                      Text('Bio'),
                    ],
                  ),
                  subtitle: Text(bio ?? detail[3]),
                ),
                const S(h: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: white, backgroundColor: purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCVPage(
                                  fullName: detail[0],
                                  slackUsername: detail[1],
                                  githubHandle: detail[2],
                                  bio: detail[3],
                                )),
                      );
                    },
                    child: const Text('Edit CV'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
