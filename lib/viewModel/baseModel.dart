import 'package:hng_internship_mobile_track_stage_2_task/model/utilities/imports/generalImport.dart';
import 'package:hng_internship_mobile_track_stage_2_task/views/pages/curriculumVitaPage.dart';

class BaseModel extends ChangeNotifier {
  // Initialize CV data
  String fullName = "Ifeanyichukwu Obeta";
  String slackUsername = "Ifeanyichukwu Obeta";
  String githubHandle = "https://github.com/angeloobeta";
  String bio =
      "I'm a mobile fullstack developer i.e I build both the mobile app using Flutter framework and the backend using Java or JavaScript. You get it";

  // Text editing controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  onSave(context) {
    fullName = fullNameController.text;
    slackUsername = slackUsernameController.text;
    githubHandle = githubHandleController.text;
    bio = bioController.text;
    // call the snackbar to show that it has been editted
    notifyListeners();
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CVViewPage(
                fullName: fullName,
                slackUsername: slackUsername,
                githubHandle: githubHandle,
                bio: bio)));
    print("We have update the values of the page");

    // Navigate back to the previous screen
    // Navigator.of(context).pop();
  }
}
