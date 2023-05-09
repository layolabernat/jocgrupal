extends Node


var nombre_morts : int = 0 setget canvi_morts
var UI : CanvasLayer
var LabelMorts : Label

func canvi_morts(nous_morts):
	nombre_morts = nous_morts
	LabelMorts.text = str(nombre_morts)
