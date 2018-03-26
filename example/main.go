package main

import (
	"github.com/andlabs/ui"
	"github.com/akamensky/notification"
)

var button *ui.Button

func main() {
	err := ui.Main(func() {
		button = ui.NewButton("Show notification")
		box := ui.NewVerticalBox()
		box.Append(button, false)
		window := ui.NewWindow("Hello", 200, 100, false)
		window.SetMargined(true)
		window.SetChild(box)
		button.OnClicked(func(*ui.Button) {
			ui.QueueMain(func() {
				notification.Show("Notification", "Button clicked")
			})
		})
		window.OnClosing(func(*ui.Window) bool {
			ui.Quit()
			return true
		})
		window.Show()
	})
	if err != nil {
		panic(err)
	}
}
