# check if the current canine armor piece has an existing matching wolf
# @s = player that has canine armor
# at world spawn
# run from armor/check_modifier/equip

# get armor slot and player id
execute store result score $slot gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.slot
scoreboard players operation $curr_id gm4_ce_id = @s gm4_ce_id

# mark 1 matching wolf as checked
scoreboard players set $wolf gm4_ce_data 0
execute as @e[type=wolf,tag=gm4_ce_wolf] if score @s gm4_ce_id = $curr_id gm4_ce_id if score @s gm4_ce_data = $slot gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/canine/wolf_checked

# summon new wolf if there is none
execute if score $wolf gm4_ce_data matches 0 at @s run function gm4_combat_expanded:armor/modifier/type/canine/wolf_spawn
