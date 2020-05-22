// https://github.com/ghacksuserjs/ghacks-user.js/blob/master/user.js
// https://github.com/intika/Librefox#features

user_pref("browser.startup.page", 3);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.preload", false);

// Warn when closing firefox with lots of tabs and windows.
// Mostly helpful for when I accidentally press Ctrl+Q.
user_pref("browser.sessionstore.warnOnQuit", true);

user_pref("privacy.resistFingerprinting", true);
