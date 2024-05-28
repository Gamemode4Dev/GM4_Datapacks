# @s boiling zauber cauldron with valid structure and item(s) inside.
# at @s (center of block)
# ran from cauldron/structure/valid

# branches off into different module components

# make items not pickupable when a player is looking at a cauldron
execute as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^1.448 if block ~ ~ ~ #minecraft:cauldrons align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=marker,tag=gm4_current_zauber_cauldron,distance=..0.1] align xyz as @e[type=item,dx=0,dy=0,dz=0] run data merge entity @s {PickupDelay:18s}

# check if cauldron has a bottle
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:glass_bottle"}}}}] run scoreboard players set $has_bottle gm4_zc_fullness 1

# set $recipe_success to 0
scoreboard players set $recipe_success gm4_zc_data 0

# tier 4 potions
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:prismarine_crystals"}}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:golden_apple"}}}}] run function gm4_zauber_cauldrons:recipes/potions/select_bottle

# zauber armor
execute unless score $recipe_success gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}}}}] run function gm4_zauber_cauldrons:recipes/armor/select_piece

# zauber crystals
execute unless score $recipe_success gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:sea_lantern"}}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:nether_star"}}}}] run function gm4_zauber_cauldrons:recipes/crystals/select_effect

# enchanted prismarine shard
execute unless score $recipe_success gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:prismarine_shard"}}}}] if entity @a[level=30..,distance=..2,limit=1,sort=nearest,gamemode=!spectator] run function gm4_zauber_cauldrons:recipes/precursors/enchanted_prismarine_shard

# luck from flowers
execute unless score $recipe_success gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:short_grass"}}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}}}}] run function gm4_zauber_cauldrons:recipes/flowers/check_poisonous_flowers

# wormhole in a bottle
execute unless score $recipe_success gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"bottled_vex"}}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}}}}] run function gm4_zauber_cauldrons:recipes/chorus/count_chorus

# magicol
execute unless score $recipe_success gm4_zc_data matches 1.. unless score $disable_magicol gm4_zc_data matches 1.. if score $has_water gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"bottled_vex"}}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}}}}] run function gm4_zauber_cauldrons:recipes/magicol/select_color

# bottled magicol
execute unless score $recipe_success gm4_zc_data matches 1.. unless score $disable_magicol gm4_zc_data matches 1.. if score @s gm4_zc_liquid_level matches 1..3 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid{id:"magicol"} if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}] if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"minecraft:prismarine_crystals"}}}}] run function gm4_zauber_cauldrons:recipes/magicol/bottled/select_bottle

# reset fake players and storage
scoreboard players reset $recipe_success gm4_zc_data
scoreboard players reset $has_bottle gm4_zc_fullness
