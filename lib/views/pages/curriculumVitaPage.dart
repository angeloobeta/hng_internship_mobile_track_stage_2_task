import 'package:hng_internship_mobile_track_stage_2_task/model/utilities/imports/generalImport.dart';

import 'editCVPage.dart';

class CVViewPage extends StatelessWidget {
  final String? fullName;
  final String? slackUsername;
  final String? githubHandle;
  final String? bio;

  CVViewPage(
      {Key? key,
      this.fullName,
      this.slackUsername,
      this.githubHandle,
      this.bio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('CV View'),
        ),
        body: ViewModelBuilder<BaseModel>.reactive(
            viewModelBuilder: () => BaseModel(),
            builder: (builder, model, child) => ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    ListTile(
                      title: Text('Full Name'),
                      subtitle: Text(fullName ?? model.fullName),
                    ),
                    ListTile(
                      title: Text('Slack Username'),
                      subtitle: Text(slackUsername ?? model.slackUsername),
                    ),
                    ListTile(
                      title: Text('GitHub Handle'),
                      subtitle: Text(githubHandle ?? model.githubHandle),
                    ),
                    ListTile(
                      title: Text('Bio'),
                      subtitle: Text(bio ?? model.bio),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditCVPage()),
                        );
                      },
                      child: Text('Edit CV'),
                    ),
                  ],
                )),
      ),
    );
  }
}
