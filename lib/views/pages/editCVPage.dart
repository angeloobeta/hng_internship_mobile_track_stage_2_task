import '../../model/utilities/imports/generalImport.dart';
import 'curriculumVitaPage.dart';

class EditCVPage extends StatefulWidget {
  late final String fullName;
  late final String slackUsername;
  late final String githubHandle;
  late final String bio;

  EditCVPage({
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
            TextField(
              maxLines: null,
              controller: fullNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: 'Full Name'),
            ),
            const S(h: 15),
            TextField(
              controller: slackUsernameController,
              decoration: const InputDecoration(labelText: 'Slack Username'),
            ),
            const S(h: 15),
            TextField(
              controller: githubHandleController,
              decoration: const InputDecoration(labelText: 'GitHub Handle'),
            ),
            const S(h: 15),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
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
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
