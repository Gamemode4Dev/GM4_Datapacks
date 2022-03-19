# run from armor/active/canine/check
# @s = new wolf

tag @s remove gm4_ce_new_wolf
scoreboard players operation @s gm4_ce_id = $curr_id gm4_ce_id
scoreboard players operation @s gm4_ce_data = $slot gm4_ce_data
data modify entity @s Owner set from storage gm4_combat_evolved:temp uuid
