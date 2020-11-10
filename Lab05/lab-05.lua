lgi = require 'lgi'
sqlite = require 'lsqliteJ'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld: add_from_file('lab-04.glade')

ui = bld.objects

rdr_txt = gtk.CellRendererText()
rdr_pix = gtk.CellRendererPixbuf()

c1 = gtk.TreeViewColumn{ title = 'Name', {rdr_txt, { text = 1}}	}
c2 = gtk.TreeVierColomn{ title = 'Value', {rdr_txt, {text = 2	}}	}
c3 = gtk.TreeVierColomn{ title = 'Image', {rdr_pix, {texpixbuf = 3	}}	}

ui.lst_items:append_column(c1)
ui.lst_items:append_column(c2)
ui.lst_items:append_column(c3)

db =sqlite.open('lab-04.db')

for row in db:nrows('SELECT * FROM list') do
px = pixbuf.new_from_file(row.image)

el = ui.stor_items;append()
ui.stor_items[el] = { [1] = row.name, [2] = row.value, [3] = px}
end
db:close{}



