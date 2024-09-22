# activate link for this player
# @s = player wearing link armor
# at @s
# run from armor/augment/clocked

# first ensure this player is actually alive, otherwise do not allow them into the link
function gm4_survival_refightalized:player/health/calculate_hp
execute unless score @s gm4_sr_health.current matches 1.. run return 0

# check if armor has been given a new custom name
execute store success score $renamed gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_name"
execute if score $renamed gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp format_name_args.name set from storage gm4_augmented_armor:temp components."minecraft:custom_name"
execute if score $renamed gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/type/link/format_name with storage gm4_augmented_armor:temp format_name_args
execute if score $renamed gm4_aa_data matches 1 run data remove storage gm4_augmented_armor:temp format_name_args

# if player is already in a link from a previous link piece skip this
execute if score @s gm4_aa_augment.link.id matches 1.. if score $slot gm4_aa_data matches 0 store success score $change gm4_aa_data run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount set value 0
execute if score @s gm4_aa_augment.link.id matches 1.. if score $slot gm4_aa_data matches 1 store success score $change gm4_aa_data run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount set value 0
execute if score @s gm4_aa_augment.link.id matches 1.. if score $slot gm4_aa_data matches 2 store success score $change gm4_aa_data run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount set value 0
execute if score @s gm4_aa_augment.link.id matches 1.. if score $slot gm4_aa_data matches 3 store success score $change gm4_aa_data run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount set value 0
execute if score @s gm4_aa_augment.link.id matches 1.. run return 0

# loop through links to find the one this player belongs to
scoreboard players set @s gm4_aa_augment.link.id 0
scoreboard players set $wrong_link gm4_aa_data 1
data modify storage gm4_augmented_armor:temp search_links.list set from storage gm4_augmented_armor:data active_links
data modify storage gm4_augmented_armor:temp search_links.find_name set from storage gm4_augmented_armor:temp components."minecraft:custom_name"
function gm4_augmented_armor:armor/augment/type/link/search_links
execute if score $wrong_link gm4_aa_data matches 0 store result score @s gm4_aa_augment.link.id run data get storage gm4_augmented_armor:temp search_links.list[0].id
data remove storage gm4_augmented_armor:temp search_links

# if an id was found no need to put a new entry in storage
execute if score @s gm4_aa_augment.link.id matches 0 run function gm4_augmented_armor:armor/augment/type/link/create_link

# tag player as wearing this armor
tag @s[gamemode=!creative] add gm4_aa_linked

# get max health of this player -max health change from linked piece
function gm4_survival_refightalized:player/health/calculate_hp
execute if score $slot gm4_aa_data matches 0 store result score @s gm4_aa_augment.link.max_health run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount -1
execute if score $slot gm4_aa_data matches 1 store result score @s gm4_aa_augment.link.max_health run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount -1
execute if score $slot gm4_aa_data matches 2 store result score @s gm4_aa_augment.link.max_health run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount -1
execute if score $slot gm4_aa_data matches 3 store result score @s gm4_aa_augment.link.max_health run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount -1
scoreboard players operation @s gm4_aa_augment.link.max_health += @s gm4_sr_health.max

# store slot this players linked armor is in
execute store result score $slot gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.slot
scoreboard players operation @s gm4_aa_augment.link.slot = $slot gm4_aa_data

# start clock
execute unless score $keep_tick.link gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/link 1t
