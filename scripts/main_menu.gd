extends Control

func _ready():
	var bg = ColorRect.new()
	bg.color = Color("#071426")
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)

	var menu = VBoxContainer.new()
	menu.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	menu.offset_left = 35
	menu.offset_right = -35
	menu.offset_top = 80
	menu.offset_bottom = -50
	menu.add_theme_constant_override("separation", 20)
	add_child(menu)

	var title = Label.new()
	title.text = "BENİM FUTBOL HAYATIM"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 30)
	menu.add_child(title)

	var subtitle = Label.new()
	subtitle.text = "Kariyerin burada başlıyor!"
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	menu.add_child(subtitle)

	menu.add_child(_make_button("KARİYER MODU"))
	menu.add_child(_make_button("ÇEVRİM İÇİ MOD"))
	menu.add_child(_make_button("ÖZEL ARKADAŞ LİGİ"))
	menu.add_child(_make_button("ANTRENMAN"))
	menu.add_child(_make_button("FUTBOLCU OLUŞTUR"))
	menu.add_child(_make_button("AYARLAR"))

func _make_button(button_text: String) -> Button:
	var button = Button.new()
	button.text = button_text
	button.custom_minimum_size = Vector2(0, 75)
	button.add_theme_font_size_override("font_size", 20)
	return button