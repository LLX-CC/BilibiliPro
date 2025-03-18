extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()
	pass # Replace with function body.

#相机跟随玩家移动
#适用场景：
#跟随玩家：某个对象（如摄像机、AI 追踪者）始终跟随玩家的位置。
#传送或复活：某个对象（如复活点）需要出现在玩家的位置。
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# 获取所有属于 "player" 组的节点
		var player_nodes = get_tree().get_nodes_in_group("player")
		# 确保至少有一个 "player" 组的节点，避免数组越界
		if player_nodes.size() > 0:
			var player = player_nodes[0]
			if player is Node2D:
				global_position = player.global_position
