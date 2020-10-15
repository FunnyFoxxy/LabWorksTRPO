#!/usr/bin/lua5.3

lgi = require 'lgi'


gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld: add_from_file('lab-03.glade')

prov = gtk.CssProvider()
prov:load_from_path('../lab-03.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui= bld.objects

opt = {ui.opt_a, ui.opt_b, ui.opt_c, ui.opt_d, ui.opt_e, ui.opt_f, ui.opt_g, ui.opt_h,  ui.opt_i, ui.opt_j, ui.opt_k,  ui.opt_l,  ui.opt_m,  ui.opt_n,  ui.opt_o,  ui.opt_p }

function update()	
	x =0 
	y = 0
	z = 0
	g = 0
	if ui.chk_x.active == true then x = 1 end
	if ui.chk_y.active == true then y = 1 end
	if ui.chk_z.active == true then z = 1 end
	if ui.chk_g.active == true then g = 1 end
		v = x + y * 2 + z * 4 + g * 8
		opt[v + 1].active = true
		ui.lab_val.label = v
end

function ui.chk_x:on_clicked(...)
update()
end
function ui.chk_y:on_clicked(...)
update()
end
function ui.chk_z:on_clicked(...)
update()
end
function ui.chk_g:on_clicked(...)
update()
end

ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
