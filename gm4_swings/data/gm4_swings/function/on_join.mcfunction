scoreboard players set @s gm4_swings.on_join 0

# if not on seat, fail
execute unless entity @s[tag=gm4_swings.swing_sitter] run return fail

# get id
scoreboard players reset $id gm4_swings.id
execute on vehicle if entity @s[type=minecraft:item_display,tag=gm4_swings.swing_seat] run scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# kill seat
tag @s remove gm4_swings.swing_sitter
execute on vehicle if entity @s[type=minecraft:item_display,tag=gm4_swings.swing_seat] run function gm4_swings:seat/kill

# try to remount on the original swing
function gm4_swings:seat/seat_entity
