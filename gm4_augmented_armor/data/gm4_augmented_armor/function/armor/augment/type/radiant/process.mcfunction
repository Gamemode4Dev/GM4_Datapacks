# process the radiant linked to this player
# @s = radiant block_display
# at linked player
# run from armor/augment/type/radiant/prep

# glowing
execute if score $player_sneaking gm4_aa_data matches 1 unless entity @s[tag=gm4_aa_radiant.glowing] on passengers run data modify entity @s Glowing set value 1b
execute if score $player_sneaking gm4_aa_data matches 1 run tag @s add gm4_aa_radiant.glowing
execute if score $player_sneaking gm4_aa_data matches 0 if entity @s[tag=gm4_aa_radiant.glowing] on passengers run data modify entity @s Glowing set value 0b
execute if score $player_sneaking gm4_aa_data matches 0 run tag @s remove gm4_aa_radiant.glowing

# calculate offset every 3 seconds
scoreboard players add @s gm4_aa_data 1
execute if score @s gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/type/radiant/pick_new_offset
scoreboard players set @s[scores={gm4_aa_data=60..}] gm4_aa_data 0

# remove old radiant light
execute at @s positioned ~ ~-1 ~ unless entity @e[type=marker,tag=gm4_aa_radiant.store_light,distance=..0.5] run fill ~ ~ ~ ~ ~ ~ air replace light[waterlogged=false,level=14]
execute at @s positioned ~ ~-1 ~ unless entity @e[type=marker,tag=gm4_aa_radiant.store_light,distance=..0.5] run fill ~ ~ ~ ~ ~ ~ water replace light[waterlogged=true,level=9]
execute at @s positioned ~ ~-1 ~ run kill @e[type=marker,tag=gm4_aa_radiant.store_light,distance=..0.5]

# tp radiant to above the player
tp @s ~ ~2.5 ~ 0 0

# place new radiant light
execute if block ~ ~-1 ~ light run summon marker ~ ~-1 ~ {Tags:["gm4_aa_radiant.store_light"],CustomName:'{"text":"gm4_aa_radiant_marker"}'}
execute at @s run fill ~ ~-1 ~ ~ ~-1 ~ light[waterlogged=true,level=9] replace water[level=0]
execute at @s run fill ~ ~-1 ~ ~ ~-1 ~ light[level=14] replace #minecraft:air

# tags
tag @s remove gm4_aa_radiant.process
scoreboard players operation @s gm4_aa_keep_tick = $check.radiant gm4_aa_keep_tick
execute on passengers run scoreboard players operation @s gm4_aa_keep_tick = $check.radiant gm4_aa_keep_tick
