package notification

/*
#cgo darwin CFLAGS: -DDARWIN -x objective-c -fobjc-arc
#cgo darwin LDFLAGS: -framework Foundation
#include "notification.h"
*/
import "C"

func show(title, content string) {
	C.show_notification(C.CString(title), C.CString(content))
}
