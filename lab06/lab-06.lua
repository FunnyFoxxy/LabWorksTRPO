lgi = require 'lgi'
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
pixbuf = lgi.GbkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld: add_from_file('lab-06.glade')

ui = bld.objects

rdr_txt = gtk.CellRendererText{}
rdr_pix = gtk.CellRendererPixbuf{}

c1 = gtk.TreeViewColomn{ title = 'Name', {rdr_txt, {text = 1}}	}
c1 = gtk.TreeViewColomn{ title = 'Value', {rdr_txt, {text = 2}}	}
c1 = gtk.TreeViewColomn{ title = 'Image', {rdr_txt, {pixbuf = 3}}	}

ui.list_items:append_column(c1)
ui.list_items:append_colomn(c2)
ui.list_items:append_colomn(c3)

db = sqlite.open('lab-06.db')
for row in db:nrows('SELECT * FROM list') do
px = pixbuf.new_from_file(row.image)

el = ui.stor_items;append()
ui.stor_items[el] = {[i] = row.name, [2] = row.value, [3] = px}
end

db:close()
gtk.main() 

