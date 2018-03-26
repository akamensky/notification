#import "notification_darwin.h"
#import "notification.h"


void show_notification(char* title, char* content) {
    NSString* ns_title = [[NSString alloc] initWithCString:title encoding:NSUTF8StringEncoding];
    NSString* ns_content = [[NSString alloc] initWithCString:content encoding:NSUTF8StringEncoding];

    if (installNSBundleHook()) {
        NSUserNotification *note = [[NSUserNotification alloc] init];
        note.title = ns_title;
        note.informativeText = ns_content;
        note.soundName = NSUserNotificationDefaultSoundName;

        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:note];
    }

    free(title);
    free(content);
}
