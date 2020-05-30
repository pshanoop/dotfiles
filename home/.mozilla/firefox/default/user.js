/* global user_pref */

user_pref("browser.startup.page", 3);

// These "highlights" are just rangom pages:
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtab.preload", false);

// Redundant and unused, that's what the main bar is for:
user_pref("browser.newtabpage.activity-stream.showSearch");

user_pref(
  "browser.newtabpage.pinned",
  JSON.parse([
    {
      url: "https://www.fastmail.com/",
      label: "fastmail",
      customScreenshotURL:
        "https://www.fastmail.com/images/press/logos/fastmail-icon.png",
    },
    { url: "https://news.ycombinator.com/", label: "hn" },
    { url: "https://www.notion.so/", label: "notion" },
    {
      url: "https://web.whatsapp.com/",
      label: "web.whatsapp",
      customScreenshotURL:
        "https://cdn0.iconfinder.com/data/icons/social-media-square-4/1024/whatsapp-512.png",
    },
    {
      url: "https://translate.google.com/",
      label: "translate.google",
      customScreenshotURL:
        "https://www.shareicon.net/data/2017/04/11/883747_text_512x512.png",
    },
    {
      url: "https://stackoverflow.com/",
      label: "so",
      customScreenshotURL:
        "https://cdn3.iconfinder.com/data/icons/inficons/512/stackoverflow.png",
    },
    {
      url: "https://app.slack.com/client/T0ACV8FAN",
      label: "app.slack",
      customScreenshotURL:
        "https://a.slack-edge.com/80588/marketing/img/meta/slack_hash_256.png",
    },
    {
      url: "https://calendar.google.com/calendar/r",
      label: "Calendar",
      customScreenshotURL:
        "https://cdn2.iconfinder.com/data/icons/fletro-long-shadow-google-service/512/Google_Calendar.png",
    },
  ])
);

// Warn when closing firefox with lots of tabs and windows.
// Mostly helpful for when I accidentally press Ctrl+Q.
user_pref("browser.sessionstore.warnOnQuit", true);

user_pref("privacy.resistFingerprinting", true);
