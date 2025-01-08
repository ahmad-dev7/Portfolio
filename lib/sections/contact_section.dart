import 'package:aali_portfolio/components/contact_form.dart';
import 'package:aali_portfolio/components/contact_info_card.dart';
import 'package:aali_portfolio/components/section_header.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = context.width * (isDesktop(context) ? desktopPadding : mobilePadding);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            subtitle: 'GET IN TOUCH',
            title: 'Contact',
            description: MyData.contactSectionIntro,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: context.width - horizontalPadding,
            child: Wrap(
              runSpacing: 30,
              alignment: WrapAlignment.spaceAround,
              children: [
                //* Contact Details Card
                ContactInfoCard(horizontalPadding: horizontalPadding),

                //* Contact Form
                SizedBox(
                  width: isDesktop(context) ? 450 : double.maxFinite,
                  child: const ContactForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
