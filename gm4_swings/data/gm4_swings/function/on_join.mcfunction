scoreboard players set @s gm4_swings.on_join 0

# if not on seat, fail
execute unless entity @s[tag=gm4_swings.swing_sitter] run return fail

# teardown
tag @s remove gm4_swings.swing_sitter
scoreboard players reset $id gm4_swings.id
execute on vehicle if entity @s[type=minecraft:item_display,tag=gm4_swings.swing_seat] run function gm4_swings:seat/kill

# try to remount on the original swing
tag @s add gm4_swings.interacter
execute as @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match] at @s run function gm4_swings:seat/sit
tag @s remove gm4_swings.interacter
