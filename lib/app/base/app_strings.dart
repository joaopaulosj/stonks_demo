class AppStrings {
  static const appName = 'Stonks Demo';

  static String homeGreeting(String name) => 'Welcome back $name 👋';

  static const String homeTodayTitle = 'TODAY';
  static const String homeTotalPercentTitle = 'TOTAL %';
  static const String homeTotalValueTitle = 'TOTAL \$';
  static const String homeChartTabDay = '1D';
  static const String homeChartTabWeek = '1W';
  static const String homeChartTabMonth = '1M';
  static const String homeChartTabThreeMonths = '3M';
  static const String homeChartTabYear = '1Y';
  static const String homeChartTabAll = 'ALL';
  static const String homeBuyingPowerTitle = 'Buying Power';
  static const String homePortfolioTitle = 'Portfolio';
  static const String homeTopPostsTitle = 'Top Posts';
  static const String homeMenuHome = 'HOME';
  static const String homeMenuChats = 'CHATS';
  static const String homeMenuMentions = 'MENTIONS';
  static const String homeMenuBrowse = 'BROWSE';

  static String chatReplies(int count) {
    if (count > 1) {
      return '$count replies';
    } else {
      return '1 reply';
    }
  }

  static const String chatTradeButton = 'Trade';
  static const String chatMembersText = '18,923 members';
  static const String chatUnread = 'Unread';
  static const String chatFieldHint = 'Type a Message';
}
