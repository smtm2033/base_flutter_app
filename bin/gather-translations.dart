import 'dart:io';

main() {
  Process.start('flutter', [
    'pub',
    'pub',
    'run',
    'intl_translation:extract_to_arb'
        '--output-dir=../lib/l10n'
        '../lib/src/services/localization/localizations.dart'
  ]);
}
