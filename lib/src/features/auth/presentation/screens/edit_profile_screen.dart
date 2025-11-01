import 'package:flutter/material.dart';
import 'package:nammkart/src/features/auth/presentation/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../../../config/common/custom_button.dart';
import '../provider/user_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Map<String, dynamic>? userProfile;
  final nameController = TextEditingController();
  final phoneController= TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.userByEmail(); // Replace with real email
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.users;
    nameController.text=user.username;
    phoneController.text=user.phoneNumber??'9876543210';
    emailController.text=user.email;

    return Scaffold(
      body: SafeArea(child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(user.profileUrl ??
                      'https://img.freepik.com/premium-photo/profile-icon-white-background_941097-162179.jpg'),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height:250,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: TextFormField(
                        controller: nameController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border:InputBorder.none,
                          hintText: "Your Name",
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: TextFormField(
                        controller: phoneController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border:InputBorder.none,
                          hintText: "Your phone number",
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: TextFormField(
                        readOnly: true,
                        controller: emailController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border:InputBorder.none,
                          hintText: "Your Email",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: 'Update',
                onPress: () {
                  final Map<String, dynamic> editData = {
                    'username': nameController.text,
                    'email': emailController.text,
                    'phoneNumber':phoneController.text,
                  };
                  userProvider.updateDetails(editData);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProfileScreen()
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}