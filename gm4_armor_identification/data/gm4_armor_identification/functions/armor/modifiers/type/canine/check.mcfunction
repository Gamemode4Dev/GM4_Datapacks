# run from armor/check_modifier
# @s = player that has canine armor

# check if a wolf for this armor piece already exists
scoreboard players set $wolf gm4_ai_data 0
execute store result score $slot gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.slot
scoreboard players operation $curr_id gm4_ai_id = @s gm4_ai_id

# mark matching wolf as checked
execute as @e[type=wolf,tag=gm4_ai_wolf] if score @s gm4_ai_id = $curr_id gm4_ai_id if score @s gm4_ai_data = $slot gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/canine/wolf_checked

# summon new wolf if there is none
execute if score $wolf gm4_ai_data matches 0 at @s run function gm4_armor_identification:armor/modifiers/type/canine/wolf_spawn
