# @s = item to spawn an entity
# run from spawn_treasure

data modify storage gm4_sunken_treasure:temp spawn set from entity @s Item.tag.gm4_sunken_treasure.spawn

execute if data storage gm4_sunken_treasure:temp spawn{id:"minecraft:squid"} run summon squid
execute if data storage gm4_sunken_treasure:temp spawn{id:"minecraft:guardian"} run summon guardian
execute if data storage gm4_sunken_treasure:temp spawn{id:"minecraft:tropical_fish"} run summon tropical_fish

data remove storage gm4_sunken_treasure:temp spawn
kill @s
