import '../../model/utilities/imports/generalImport.dart';

class EditCVPage extends StatelessWidget {
  const EditCVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Edit CV'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: model.fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: model.slackUsernameController,
                decoration: InputDecoration(labelText: 'Slack Username'),
              ),
              TextField(
                controller: model.githubHandleController,
                decoration: InputDecoration(labelText: 'GitHub Handle'),
              ),
              TextField(
                controller: model.bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
              ElevatedButton(
                onPressed: () => model.onSave(context),
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
