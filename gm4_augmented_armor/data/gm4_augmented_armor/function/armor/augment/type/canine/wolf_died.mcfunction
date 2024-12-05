# despawn wolves without matching armor pieces, if the matching player is online
# @s = wolf without corresponding armor piece
# at @s
# run from armor/type/canine/process

# find matching armor and set a timer on it
scoreboard players operation $curr_id gm4_aa_id = @s gm4_aa_id
scoreboard players operation $slot gm4_aa_data = @s gm4_aa_augment.canine.slot

execute as @a if score @s gm4_aa_id = $curr_id gm4_aa_id run function gm4_augmented_armor:armor/augment/type/canine/set_cooldown

# set owner UUID to Notch to not display death message
data modify entity @s Owner set value [I;110787060,1156138790,-1514210135,238594805]

# check if nametag should spawn
data modify storage gm4_augmented_armor:temp wolf.spawn_name set from entity @s ArmorItems[3].components."minecraft:custom_name"
data modify storage gm4_augmented_armor:temp wolf.curr_name set from entity @s CustomName
execute store success score $name_changed gm4_aa_data run data modify storage gm4_augmented_armor:temp wolf.spawn_name set from storage gm4_augmented_armor:temp wolf.curr_name
execute if score $name_changed gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/type/canine/spawn_nametag
data remove storage gm4_augmented_armor:temp wolf

# remove wolf
kill @s
