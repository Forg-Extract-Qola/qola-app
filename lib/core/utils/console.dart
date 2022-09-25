
class Console {
  static printInfo(String text) => print('\x1B[34m$text\x1B[0m');
  static printSuccess(String text) => print('\x1B[32m$text\x1B[0m');
  static printWarning(String text) => print('\x1B[33m$text\x1B[0m');
  static printError(String text) => print('\x1B[31m[ERROR]$text\x1B[0m');
}