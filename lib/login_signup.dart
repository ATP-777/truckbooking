import 'package:flutter/material.dart';
import 'package:tcms_light_app/theme/constants.dart'; // Import the constants file
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tcms_light_app/History/history_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary).withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? " To Rizona," : " Back,",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      isSignupScreen ? "Signup to Continue" : "Signin to Continue",
                      style: TextStyle(
                        color: isDarkMode ? AppColors.darkOnPrimary : AppColors.lightOnPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          // Main Container for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary)
                                      : (isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface),
                                ),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary)
                                      : (isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface),
                                ),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(context),
                    if (!isSignupScreen) buildSigninSection(context),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildSigninSection(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(context, Icons.mail_outline, "info@demouri.com", false, true, isDarkMode),
          buildTextField(context, Icons.lock_outline, "**********", true, false, isDarkMode),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(context, Icons.mail_outline, "info@demouri.com", false, true, isDarkMode),
          buildTextField(context, Icons.lock_outline, "**********", true, false, isDarkMode),
          buildTextField(context, Icons.lock_outline, "Confirm Password", true, false, isDarkMode),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isMale
                              ? (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary)
                              : Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary)
                                : isDarkMode
                                    ? AppColors.darkOnSurface
                                    : AppColors.lightOnSurface,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: isMale
                              ? Colors.white
                              : isDarkMode
                                  ? AppColors.darkOnSurface
                                  : AppColors.lightOnSurface,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: isMale
                              ? (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary)
                              : isDarkMode
                                  ? AppColors.darkOnSurface
                                  : AppColors.lightOnSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isMale
                              ? Colors.transparent
                              : (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary),
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? isDarkMode
                                    ? AppColors.darkOnSurface
                                    : AppColors.lightOnSurface
                                : isDarkMode
                                    ? AppColors.darkPrimary
                                    : AppColors.lightPrimary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: isMale
                              ? isDarkMode
                                  ? AppColors.darkOnSurface
                                  : AppColors.lightOnSurface
                              : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: isMale
                              ? isDarkMode
                                  ? AppColors.darkOnSurface
                                  : AppColors.lightOnSurface
                              : isDarkMode
                                  ? AppColors.darkPrimary
                                  : AppColors.lightPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  Container buildTextField(BuildContext context, IconData icon, String hintText, bool isPassword, bool isEmail, bool isDarkMode) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        obscureText: isPassword ? true : false,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: TextStyle(color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 14, color: isDarkMode ? AppColors.darkOnSurface.withOpacity(0.5) : AppColors.lightOnSurface.withOpacity(0.5)),
          hintText: hintText,
          prefixIcon: Icon(icon, color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary),
        ),
      ),
    );
  }

 
  Widget buildBottomHalfContainer(bool showShadow) {
  final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

  return AnimatedPositioned(
    duration: Duration(milliseconds: 700),
    curve: Curves.bounceInOut,
    top: isSignupScreen ? 535 : 430,
    right: 0,
    left: 0,
    child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryScreen()));
        },
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkPrimary.withOpacity(0.8) : AppColors.lightPrimary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                ),
            ],
          ),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 8, 4, 225), Color.fromARGB(255, 44, 131, 237)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: isDarkMode ? AppColors.darkOnPrimary : AppColors.lightOnPrimary,
                  ),
                ),
        ),
      ),
    ),
  );
}

}

