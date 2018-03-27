#import "notification_darwin.h"
#import "notification.h"


void show_notification(char* title, char* content, char* iconBytes, int iconLength) {
    if (installNSBundleHook()) {
        NSUserNotification *note = [[NSUserNotification alloc] init];

        if (title) {
            NSString* ns_title = [[NSString alloc] initWithCString:title encoding:NSUTF8StringEncoding];
            note.title = ns_title;
        }

        if (content) {
            NSString* ns_content = [[NSString alloc] initWithCString:content encoding:NSUTF8StringEncoding];
            note.informativeText = ns_content;
        }

        note.soundName = NSUserNotificationDefaultSoundName;

        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:note];
    }

    free(title);
    free(content);
}
