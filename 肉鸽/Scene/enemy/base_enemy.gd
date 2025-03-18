extends CharacterBody2D

const  MAX_SPEED=75
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction =get_direction_to_player()
	velocity= direction*MAX_SPEED
	move_and_slide()
#global_position属性
#表示节点在世界坐标系中的绝对位置（相对于场景根节点）。
#无论节点嵌套在多少层父节点下，global_position始终返回其在全局空间中的坐标。
func get_direction_to_player():
	var player_node=get_tree().get_first_node_in_group('player') as Node2D#获取玩家节点
	if player_node !=null:
		return (player_node.global_position-global_position).normalized() #向量a-向量b  用于获取从当前对象到玩家的全局方向向量 用于控制对象（如敌人）朝玩家移动的方向。
	return Vector2.ZERO #如果玩家存在，返回这个方向；否则返回`Vector2.ZERO`，也就是没有方向
