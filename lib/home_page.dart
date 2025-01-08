import 'package:aali_portfolio/components/desktop_navbar.dart';
import 'package:aali_portfolio/components/mobile_navbar.dart';
import 'package:aali_portfolio/components/section_wrapper.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/sections/about_section.dart';
import 'package:aali_portfolio/sections/contact_section.dart';
import 'package:aali_portfolio/sections/experience_section.dart';
import 'package:aali_portfolio/sections/project_section.dart';
import 'package:aali_portfolio/sections/skills_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = !isDesktop(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isMobile ? kToolbarHeight : (kToolbarHeight + 20)),
        child: isMobile ? const MobileNavbar() : const DesktopNavbar(),
      ),
      body: SelectionArea(
        child: SingleChildScrollView(
          controller: ctrl.scrollCtrl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Note
              //* Keys are assigned to sizedBox and not directly to sections, to make sure that sections remains constants throughout the sessions
              //* If keys will be assigned to the sections it will be rebuild every time user scroll to this section

              //? About Section
              SizedBox(key: aboutSectionKey, height: isDesktop(context) ? 20 : 10),
              const SectionWrapper(child: ModifiedAboutSection()),

              //? Skills Section
              SizedBox(key: skillsSectionKey, height: 20),
              const SectionWrapper(child: SkillsSection()),

              //? Learning Section
              SizedBox(key: experienceSectionKey, height: 20),
              const SectionWrapper(child: ExperienceSection()),

              //? Projects Section
              SizedBox(key: projectsSectionKey, height: 20),
              const SectionWrapper(child: ProjectSection()),

              //? Contact Section
              SizedBox(key: contactSectionKey, height: 20),
              const SectionWrapper(child: ContactSection()),

              //* Default bottom would be 200, but When keyboard appears in contact form it will adjust automatically
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 200),
            ],
          ),
        ),
      ),
    );
  }
}
