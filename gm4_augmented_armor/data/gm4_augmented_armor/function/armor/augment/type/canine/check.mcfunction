# check if the current canine armor piece has an existing matching wolf
# @s = player that has canine armor
# at unspecified
# run from armor/check_augment/equip

# get armor slot and player id
execute store result score $slot gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.slot
scoreboard players operation $curr_id gm4_sr_id = @s gm4_sr_id

# mark 1 matching wolf as checked
scoreboard players set $wolf gm4_aa_data 0
execute as @e[type=wolf,tag=gm4_aa_wolf] if score @s gm4_sr_id = $curr_id gm4_sr_id if score @s gm4_aa_data = $slot gm4_aa_data run function gm4_augmented_armor:armor/augment/type/canine/wolf_checked

# summon new wolf if there is none
execute if score $wolf gm4_aa_data matches 0 at @s run function gm4_augmented_armor:armor/augment/type/canine/wolf_spawn
