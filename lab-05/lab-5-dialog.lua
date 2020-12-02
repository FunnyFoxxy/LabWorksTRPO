lgi = require 'lgi'

gtk = lgi.Gtk

gtk.init()

test = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "Hi, This a massage",
	secondary_text = "OPpening programm"
}

test:run()
