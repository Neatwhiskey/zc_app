import 'package:flutter/material.dart';
import 'package:hng/models/organization_model.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/shared.dart';
import 'organization_viewmodel.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.initViewModel(),
      disposeViewModel: false,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Organizations',
                        style: AppTextStyles.heading6
                            .copyWith(color: AppColors.blackColor)),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: !viewModel.isBusy,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: viewModel.organizations.isEmpty
                            ? Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Text(
                                    'You have not joined any organization yet!',
                                    style: AppTextStyles.bodyRegular,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: viewModel.organizations.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      final org = viewModel.organizations[i];

                                      return OrganizationTile(org: org);
                                    },
                                  ),
                                ],
                              ),
                      ),
                      replacement: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => viewModel.navigateToNewOrganization(),
                          leading: const Icon(Icons.add_box_outlined),
                          title: const Text('Add an organization'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Preferences'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.help_outline),
                          title: Text('Help'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => OrganizationViewModel(),
    );
  }
}

class OrganizationTile extends ViewModelWidget<OrganizationViewModel> {
  const OrganizationTile({
    Key? key,
    required this.org,
  }) : super(key: key);

  final OrganizationModel org;

  @override
  Widget build(BuildContext context, OrganizationViewModel viewModel) {
    return ListTile(
      onTap: () => viewModel.onTap(org.id, org.name, org.organizationUrl),
      leading: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.height * 0.06,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: viewModel.currentOrgId == org.id
              ? AppColors.blackColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteColor,
              width: 2,
              style: BorderStyle.solid,
            ),
            color: AppColors.greyishColor,
            borderRadius: BorderRadius.circular(5),
          ),
          clipBehavior: Clip.antiAlias,
          //TODO : Add the org image here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      //TODO : Add the org name here
      title: Text(
        org.name ?? '',
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: 2,
        style: AppTextStyles.heading7.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      subtitle: Container(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          org.organizationUrl ?? '',
          style: AppTextStyles.body3Medium,
        ),
      ),
      trailing: GestureDetector(onTap: () {

      }, child: const Icon(Icons.more_vert)),

    );
  }
}
