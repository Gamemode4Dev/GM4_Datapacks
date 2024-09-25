# prepare everything needed to process psychic armor
# @s = player wearing armor
# at @s
# run from clocks/temp/psychic

scoreboard players set $keep_tick.psychic gm4_aa_keep_tick 1

tag @s add gm4_aa_target
execute store result score $player_creative gm4_aa_data if entity @s[gamemode=creative]

# grab armor data
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

function gm4_augmented_armor:armor/augment/type/psychic/get_relevant_data
execute store result score $psychic.count gm4_aa_data run data get storage gm4_augmented_armor:temp psychic.data

# check for crouching
scoreboard players set $stats_set gm4_aa_data 0
execute if predicate gm4_augmented_armor:technical/crouching run function gm4_augmented_armor:armor/augment/type/psychic/set_stats_crouching
execute if score $stats_set gm4_aa_data matches 0 run function gm4_augmented_armor:armor/augment/type/psychic/set_stats

# rotate the spawn location
scoreboard players add @s gm4_aa_augment.psychic.degree 5
scoreboard players remove @s[scores={gm4_aa_augment.psychic.degree=360..}] gm4_aa_augment.psychic.degree 360
execute store result storage gm4_augmented_armor:temp psychic.deg int 1 run scoreboard players get @s gm4_aa_augment.psychic.degree

# get all swords that match this players id
scoreboard players operation $player_id gm4_aa_id = @s gm4_aa_id
execute as @e[type=item_display,tag=gm4_aa_psychic.sword,distance=..12] if score @s gm4_aa_id = $player_id gm4_aa_id run tag @s add gm4_aa_psychic.check_sword

# find location for the first sword
function gm4_augmented_armor:armor/augment/type/psychic/eval_deg with storage gm4_augmented_armor:temp psychic

# cleanup
tag @s remove gm4_aa_target
data remove storage gm4_augmented_armor:temp psychic
data remove storage gm4_augmented_armor:temp Items
