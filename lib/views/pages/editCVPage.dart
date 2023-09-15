import 'package:hng_internship_mobile_track_stage_2_task/views/uiElements/textField.dart';

import '../../model/utilities/imports/generalImport.dart';
import 'curriculumVitaPage.dart';

class EditCVPage extends StatefulWidget {
  final String fullName;
  final String slackUsername;
  final String githubHandle;
  final String bio;

  const EditCVPage({
    super.key,
    required this.fullName,
    required this.slackUsername,
    required this.githubHandle,
    required this.bio,
  });

  @override
  State<EditCVPage> createState() => _EditCVPageState();
}

class _EditCVPageState extends State<EditCVPage> {
  // text editing controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.fullName;
    slackUsernameController.text = widget.slackUsername;
    githubHandleController.text = widget.githubHandle;
    bioController.text = widget.bio;
  }

  void disposeState() {
    fullNameController.dispose();
    slackUsernameController.dispose();
    githubHandleController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20.0, top: 30, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GeneralTextDisplay(
                "Full Name", grey, 1, 20, FontWeight.bold, 'full name'),
            const S(h: 10),
            textForm(
                context: context,
                maxLine: false,
                labelText: "Full Name",
                controller: fullNameController),
            const S(h: 25),
            const GeneralTextDisplay(
                "Slack Username", grey, 1, 20, FontWeight.bold, 'full name'),
            const S(h: 10),
            textForm(
                context: context,
                maxLine: false,
                labelText: "Slack Username",
                controller: slackUsernameController),
            const S(h: 25),
            const GeneralTextDisplay(
                "GitHub Handle", grey, 1, 20, FontWeight.bold, 'full name'),
            const S(h: 10),
            textForm(
                context: context,
                maxLine: false,
                labelText: "GitHub Handle",
                controller: githubHandleController),
            const S(h: 25),
            const GeneralTextDisplay(
                "Short Biography", grey, 1, 20, FontWeight.bold, 'full name'),
            const S(h: 10),
            textForm(
                context: context,
                maxLine: true,
                labelText: "Short Biography",
                controller: bioController),
            const S(h: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: white, backgroundColor: purple),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CvPage(
                            fullName: fullNameController.text,
                            slackUsername: slackUsernameController.text,
                            githubHandle: githubHandleController.text,
                            bio: bioController.text)));
              },
              child: SizedBox(
                  height: sS(context).cH(height: 60),
                  child: const Center(child: Text('Save Changes'))),
            ),
          ],
        ),
      ),
    );
  }
}
