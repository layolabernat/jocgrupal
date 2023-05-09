extends CanvasLayer


func _ready():
	Global.UI = self
	Global.LabelMorts = $LabelMorts
	$LabelMorts.text = str(Global.nombre_morts)
