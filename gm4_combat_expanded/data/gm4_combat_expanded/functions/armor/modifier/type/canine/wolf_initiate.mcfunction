# match wolf to armor slot and player id
# @s = new wolf
# at world spawn
# run from armor/type/canine/wolf_spawn

tag @s remove gm4_ce_new_wolf
scoreboard players operation @s gm4_ce_id = $curr_id gm4_ce_id
scoreboard players operation @s gm4_ce_data = $slot gm4_ce_data
data modify entity @s Owner set from storage gm4_combat_expanded:temp uuid

execute store result score $name_len gm4_ce_data run data get storage gm4_combat_expanded:temp tag.display.Name
execute if score $name_len gm4_ce_data matches ..75 run data modify entity @s CustomName set from storage gm4_combat_expanded:temp tag.display.Name
