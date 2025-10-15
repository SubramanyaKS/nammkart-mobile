import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/address/presentation/screen/address_screen.dart';
import 'package:nammkart/src/features/address/presentation/widgets/view_address.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/auth/presentation/screens/edit_profile_screen.dart';
import 'package:nammkart/src/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 3,
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(user.profileUrl ??
                    'https://img.freepik.com/premium-photo/profile-icon-white-background_941097-162179.jpg'),
              ),
            ),
            Text(
              user.username,
              style: TextStyle(color: Colors.deepPurple, fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const EditProfileScreen()
                    )
                );
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFBE185D)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white)),
              iconAlignment: IconAlignment.start,
              icon: Icon(
                Icons.edit,
                color: Colors.deepPurple,
                size: 24.0,
              ),
              label: Text('Edit'),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      user.email,
                      style: TextStyle(fontSize: 22, color: Colors.deepPurple),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      user.phoneNumber != null
                          ? user.phoneNumber!
                          : "9876543210",
                      style: TextStyle(fontSize: 22, color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.remove_red_eye,
                color: Colors.deepPurple,
              ),
              title: Text(
                "View Address",
                style: TextStyle(fontSize: 22, color: Colors.deepPurple),
              ),
              onTap: () async {
                await Provider.of<AddressProvider>(context, listen: false)
                    .getAddress(user.userId);

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ViewAddress()));
              },
              trailing: Icon(Icons.arrow_forward, color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Add Address",
                style: TextStyle(fontSize: 22, color: Colors.deepPurple),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddressScreen()));
              },
              trailing: Icon(Icons.arrow_forward, color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 22, color: Colors.deepPurple),
              ),
              onTap: () {
                userProvider.userLogout();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              trailing: Icon(Icons.arrow_forward, color: Colors.deepPurple),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
