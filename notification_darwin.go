package notification

/*
#cgo darwin CFLAGS: -DDARWIN -x objective-c -fobjc-arc
#cgo darwin LDFLAGS: -framework Foundation
#include "notification.h"
*/
import "C"

func show(title, content string, iconBytes *[]byte) {
	cTitle := C.CString(title)
	cContent := C.CString(content)

	C.show_notification(cTitle, cContent, nil, 0)
}
