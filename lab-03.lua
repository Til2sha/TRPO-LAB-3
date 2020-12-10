lgi = require'lgi' -- подключение модуля lgi
gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()-- инициализация библиотеки gtk
bld = gtk.Builder()
bld:add_from_file('lab-03.glade')
ui = bld.objects


prov = gtk.CssProvider()
prov:load_from_path('/home/ivan/shared/Lab-03/style.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects
opt = {ui.opt_a, ui.opt_b, ui.opt_c, ui.opt_d, ui.opt_e, ui.opt_f, ui.opt_g, ui.opt_h}

function update()
	x = 0
	y = 0
	z = 0
	if ui.chk_x.active == true then x = 1 end
	if ui.chk_y.active == true then y = 1 end
	if ui.chk_z.active == true then z = 1 end
	
	v = (x * 2 ^ 2) + (y * 2 ^ 1) + (z * 2 ^ 0)
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


ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
