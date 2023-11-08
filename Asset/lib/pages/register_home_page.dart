import 'package:asset/pages/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _lifeStoryController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  final List<String> _countries = <String>[
    'Russia',
    'Ukraine',
    'Germany',
    'France'
  ];
  String? _selectedCountry;

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    _emailController.dispose();
    _lifeStoryController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();

    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();

    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Register Form',
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                hintText: 'What do people call you?',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              ),
              validator: _validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Where can we reach you?',
                helperText: 'Phone format: +7(xxx)xxx-xxxxx',
                prefixIcon: const Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                //FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(
                  RegExp(r'^[()\d -]{1,15}$'),
                  allow: true,
                ),
              ],
              validator: (value) => _validatePhoneNumber(value)
                  ? null
                  : 'Phone number must be entered es (###)###-####',
              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address *',
                hintText: 'Enter a email address',
                icon: Icon(Icons.email),
              ),
   //           validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Country?',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                setState(() {
                  if (country != null) {
                    _selectedCountry = country;
                    newUser.country = country;
                  }
                });
              },
              value: _selectedCountry,
              // validator: (val) {
              //   if (val == null) {
              //     return 'Selected Country';
              //   } else {
              //     return null;
              //   }
              // },
              onSaved: (value) => value == null ? newUser.country = '' : newUser.country = value,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _lifeStoryController,
              decoration: const InputDecoration(
                labelText: 'Life Story',
                hintText: 'Tell us about you self',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              onSaved: (value) => newUser.story = value!,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter the password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: const Icon(Icons.security),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              validator: _validatePassword,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _confirmPassController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm the password',
                icon: Icon(Icons.border_color),
              ),
              obscureText: _hidePass,
              validator: _validatePassword,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              child: const Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(name: _nameController.text);
      // print('Form is valid');
      // print('Name ${_nameController.text}');
      // print('Phone ${_phoneController.text}');
      // print('Email ${_emailController.text}');
      // print('Life Story ${_lifeStoryController.text}');
      // print('Password ${_passController.text}');
      // print('Confirm Password ${_confirmPassController.text}');
      // print('Country $_selectedCountry');
    } else {
      _showMassage(message: 'Form is not valid! Please review and correct');
    }
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z]+$');
    if (value == null) {
      return null;
    } else if (value.isEmpty ?? false) {
      return 'Name is required';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value == null) {
      return null;
    } else if (_passController.text.length != 8) {
      return '8 character required for password';
    } else if (_passController.text != _confirmPassController.text) {
      return 'Password does no match';
    } else {
      return null;
    }
  }

  void _showMassage({required String message}) {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 5),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.red,
    ));
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registration successful',
            style: TextStyle(color: Colors.green),
          ),
          content: Text(
            '$name is now a verified register form',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInfoPage(userInfo: newUser),
                    ),
                  );
                },
                child: const Text(
                  'Verified',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ))
          ],
        );
      },
    );
  }
}

bool _validatePhoneNumber(String? value) {
  if (value == null) {
    return false;
  } else {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return phoneExp.hasMatch(value);
  }
}
