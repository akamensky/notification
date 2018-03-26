#import "notification.h"
#import <Cocoa/Cocoa.h>

void show_notification(char* title, char* content) {
    NSString* ns_title = [[NSString alloc] initWithCString:title encoding:NSUTF8StringEncoding];
    NSString* ns_content = [[NSString alloc] initWithCString:content encoding:NSUTF8StringEncoding];

    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    userNotification.title = ns_title;
    userNotification.informativeText = ns_content;
    userNotification.soundName = NSUserNotificationDefaultSoundName;

    NSLog(@"test1");

    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNotification];

    NSLog(@"test2");
}
