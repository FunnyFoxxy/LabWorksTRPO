#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-02.glade')

ui = bld.objects

ui.wnd.title = 'lab-02'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

function ui.btn_pls:on_clicked(...)
a = tonumber(ui.enterBoxA.text)
b = tonumber(ui.enterBoxB.text)
ui.lbl_res.label = a + b
end
function ui.btn_sub:on_clicked(...)
a = tonumber(ui.enterBoxA.text)
b = tonumber(ui.enterBoxB.text)
ui.lbl_res.label = a - b
end
function ui.btn_mul:on_clicked(...)
a = tonumber(ui.enterBoxA.text)
b = tonumber(ui.enterBoxB.text)
ui.lbl_res.label = a * b
end
function ui.btn_del:on_clicked(...)
a = tonumber(ui.enterBoxA.text)
b = tonumber(ui.enterBoxB.text)
if  b == 0 then
ui.lbl_res.label = "Нельзя делить на ноль"
else 
ui.lbl_res.label = a / b
end		
end
gtk.main()
