extends Control

const BG := Color("#071426")
const PANEL := Color("#10243d")
const ACCENT := Color("#24d17e")
const TEXT := Color("#f4f7fb")
const MUTED := Color("#a8b7c9")

func _ready() -> void:
	_build_menu()

func _build_menu() -> void:
	var background := ColorRect.new()
	background.color = BG
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(background)

	var content := VBoxContainer.new()
	content.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	content.offset_left = 42
	content.offset_top = 70
	content.offset_right = -42
	content.offset_bottom = -55
	content.add_theme_constant_override("separation", 22)
	add_child(content)

	var title := Label.new()
	title.text = "BENİM FUTBOL HAYATIM"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 35)
	title.add_theme_color_override("font_color", TEXT)
	content.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Kariyerin burada başlıyor"
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_font_size_override("font_size", 19)
	subtitle.add_theme_color_override("font_color", MUTED)
	content.add_child(subtitle)

	var spacer := Control.new()
	spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	content.add_child(spacer)

	_add_menu_button(content, "KARİYER MODU", "15 yaşında futbol yolculuğuna başla")
	_add_menu_button(content, "ÇEVRİM İÇİ MOD", "Arkadaşlarınla sahaya çık")
	_add_menu_button(content, "ÖZEL ARKADAŞ LİGİ", "Kendi ligini kur ve yönet")
	_add_menu_button(content, "ANTRENMAN", "Yeteneklerini geliştir")
	_add_menu_button(content, "FUTBOLCU OLUŞTUR", "Kendi oyuncunu tasarla")
	_add_menu_button(content, "AYARLAR", "Oyun tercihlerini düzenle")

func _add_menu_button(parent: VBoxContainer, heading: String, detail: String) -> void:
	var button := Button.new()
	button.custom_minimum_size = Vector2(0, 104)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.text = heading + "\n" + detail
	button.add_theme_font_size_override("font_size", 19)
	button.add_theme_color_override("font_color", TEXT)

	var style := StyleBoxFlat.new()
	style.bg_color = PANEL
	style.corner_radius_top_left = 18
	style.corner_radius_top_right = 18
	style.corner_radius_bottom_left = 18
	style.corner_radius_bottom_right = 18
	button.add_theme_stylebox_override("normal", style)

	button.pressed.connect(_on_menu_pressed.bind(heading))
	parent.add_child(button)

func _on_menu_pressed(heading: String) -> void:
	print("Seçilen menü: ", heading)