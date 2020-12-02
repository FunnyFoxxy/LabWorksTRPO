lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-05.glade')
ui = bld.objects

test = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "Hi, This a massage",
	secondary_text = "OPpening programm"
}

function ui.btn_new:on_clicked(...)
ui.wnd2:show_all()

test:run()
end

function ui.btn_hide:on_clicked(...)
ui.wnd2:hide()
end



ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()

