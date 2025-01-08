// ignore_for_file: unused_field

import 'package:aali_portfolio/components/text_form_field.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_state_button/multi_state_button.dart';

class ContactForm extends StatefulWidget {
  // final Function({String name, String email, String subject, String message}) onSubmit;
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String? _selectedSubject;
  String? _name;
  String? _email;
  String? _message;
  List<String> items = ["Project Inquiry", "Collaboration", "General Question", "Other"];
  RegExp regExp = RegExp(r"^.+@\w+(\.\w+)+$");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Form title
          const Opacity(
            opacity: .9,
            child: MyText("Inquiry Form", weight: FontWeight.w200, size: 22, fontFamily: "Poppins"),
          ),
          const SizedBox(height: 20),

          //* Name field
          MyTextFormField(
            maxLength: 20,
            keyboardType: TextInputType.name,
            capitalization: TextCapitalization.words,
            validatorCondition: (val) => val == null || val.isEmpty,
            validatorMsg: "Please Enter your name",
            hintText: "Enter your name",
            labelText: "Name",
            onChange: (val) => _name = val,
            inputAction: TextInputAction.next,
          ),

          const SizedBox(height: 30),

          //* Email Field
          MyTextFormField(
            keyboardType: TextInputType.emailAddress,
            capitalization: TextCapitalization.none,
            validatorMsg: "Please enter a valid email",
            validatorCondition: (val) => val == null || val.isEmpty || !regExp.hasMatch(val),
            hintText: "Enter email address",
            labelText: "Email",
            onChange: (val) => _email = val,
            inputAction: TextInputAction.next,
          ),

          const SizedBox(height: 30),

          //* Select subject field
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<String>(
              value: _selectedSubject,
              isDense: true,
              dropdownColor: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(0),
              elevation: 0,
              focusColor: Colors.transparent,
              decoration: InputDecoration(
                filled: true,
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.all(0),
                errorStyle: const TextStyle(height: 0.3),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                fillColor: Theme.of(context).dividerColor.withOpacity(.1),
              ),
              hint: const MyText('Select subject'),
              onChanged: (subject) => setState(() => _selectedSubject = subject),
              validator: (subj) => subj == null ? '   Please select subject' : null,
              items: items.map((val) => DropdownMenuItem(value: val, child: MyText(val))).toList(),
            ),
          ),

          const SizedBox(height: 30),

          //* Message field
          MyTextFormField(
            minLines: 4,
            maxLines: 10,
            maxLength: 1000,
            showCounter: true,
            keyboardType: TextInputType.multiline,
            capitalization: TextCapitalization.sentences,
            validatorCondition: (val) => val == null || val.isEmpty,
            validatorMsg: "Please enter your message",
            hintText: "Type your message",
            labelText: "Message",
            onChange: (val) => _message = val,
            inputAction: TextInputAction.newline,
          ),

          const SizedBox(height: 30),

          //* Submit button
          Obx(
            () => MultiStateButton(
              multiStateButtonController: ctrl.multiStateButtonController.value,
              buttonStates: [
                // Submit  button
                ButtonState(
                  stateName: submitState,
                  //onPressed: ctrl.submitForm,
                  onPressed: () => ctrl.submitForm(
                    name: _name,
                    subject: _selectedSubject,
                    email: _email,
                    message: _message,
                  ),
                  child: const MyText('Submit', color: Colors.white, fontFamily: "Poppins"),
                  size: Size(double.maxFinite, isDesktop(context) ? 55 : 45),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7253C8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Submitting form button
                ButtonState(
                  stateName: loadingState,
                  size: Size(isDesktop(context) ? 55 : 45, isDesktop(context) ? 55 : 45),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator.adaptive(),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                // Successfully submitted button
                ButtonState(
                  stateName: successState,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          "Your message has been received.",
                          weight: FontWeight.bold,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4),
                        MyText("I'll get back to you as soon as possible.", color: Colors.white),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ctrl.isDark.value ? const Color(0xFF0D5633) : const Color(0xFF289761),
                  ),
                ),
                // Error state
                ButtonState(
                  stateName: errorState,
                  size: Size(double.maxFinite, isDesktop(context) ? 55 : 45),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyText('Something went wrong! Try again.', color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
