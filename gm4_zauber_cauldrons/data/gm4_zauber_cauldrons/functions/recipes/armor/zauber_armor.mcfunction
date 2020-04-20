# @s=boiling zauber cauldron with enchanted prismarine shard inside.
# at align xyz
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set expected_item_amount gm4_zc_fullness 3

# recipes
execute as @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:golden_chestplate"}},nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}},limit=1] run function gm4_zauber_cauldrons:recipes/armor/chestplate/apply_modifier
execute if score recipe_success gm4_zc_data matches 0 as @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:golden_helmet"}},nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}},limit=1] run function gm4_zauber_cauldrons:recipes/armor/helmet/apply_modifier
execute if score recipe_success gm4_zc_data matches 0 as @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:golden_leggings"}},nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}},limit=1] run function gm4_zauber_cauldrons:recipes/armor/leggings/apply_modifier
execute if score recipe_success gm4_zc_data matches 0 as @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:golden_boots"}},nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}},limit=1] run function gm4_zauber_cauldrons:recipes/armor/boots/apply_modifier

# use water and play sound once a recipe ran
execute if score recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/use_extra_items
execute if score recipe_success gm4_zc_data matches 1 at @s run particle entity_effect ~ ~.4 ~ .1 .1 .1 1 10
execute if score recipe_success gm4_zc_data matches 1 at @s run playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5
execute if score recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/use_water
