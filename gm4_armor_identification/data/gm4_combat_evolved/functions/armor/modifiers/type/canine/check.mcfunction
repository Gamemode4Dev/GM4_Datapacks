# run from armor/check_modifier
# @s = player that has canine armor

# check if a wolf for this armor piece already exists
scoreboard players set $wolf gm4_ce_data 0
execute store result score $slot gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.slot
scoreboard players operation $curr_id gm4_ce_id = @s gm4_ce_id

# mark matching wolf as checked
execute as @e[type=wolf,tag=gm4_ce_wolf] if score @s gm4_ce_id = $curr_id gm4_ce_id if score @s gm4_ce_data = $slot gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_checked

# summon new wolf if there is none
execute if score $wolf gm4_ce_data matches 0 at @s run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_spawn
