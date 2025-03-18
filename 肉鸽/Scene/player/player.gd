extends CharacterBody2D

var MAX_SPEED:int=300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement=get_movement_vector()
	var direction=movement.normalized()#归一化处理（1，1）得到1
	velocity=direction*MAX_SPEED
	move_and_slide()
func get_movement_vector():
	#获取行动坐标 左-1，右1，同时0；自定义动作需绑定使用
	var x_movement=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	var y_movement=-(Input.get_action_strength("ui_up")-Input.get_action_strength("ui_down"))#godot 上为负，下为正
	return Vector2(x_movement,y_movement)
