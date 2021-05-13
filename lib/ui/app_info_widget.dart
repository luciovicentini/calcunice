import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoButton extends StatefulWidget {
  const AppInfoButton({Key? key}) : super(key: key);

  @override
  _AppInfoButtonState createState() => _AppInfoButtonState();
}

class _AppInfoButtonState extends State<AppInfoButton> {
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    _initCustomLibrary();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.help_outline_rounded),
        onPressed: () {
          showAboutDialog(
            context: context,
            applicationName: _packageInfo.appName,
            applicationVersion:
                '${_packageInfo.version} (${_packageInfo.buildNumber})',
            applicationLegalese: '2021 - Lucio Vicentini',
            applicationIcon: const Image(
              image: AssetImage('assets/app_icon.png'),
              height: 50,
              width: 50,
            ),
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'Calcunice is a nice design basic calculator.',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          );
        },
      );

  void _initCustomLibrary() {
    LicenseRegistry.addLicense(() async* {
      yield const LicenseEntryWithLineBreaks(
          <String>['Icon Attribution Link'], '''
      <a href="https://www.vecteezy.com/free-vector/calculator-icon">Calculator Icon Vectors by Vecteezy</a>
      ''');
    });
  }
}
