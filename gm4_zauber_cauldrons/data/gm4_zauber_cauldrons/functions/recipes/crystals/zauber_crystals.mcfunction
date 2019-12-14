#@s=boiling zauber cauldron with sea lantern and nether star inside.
#at align xyz
#run from cauldron/recipe_checks

#set expected fullness for these recipes
scoreboard players set expected_item_amount gm4_zc_fullness 3
#recipes
execute if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:protection",lvl:4s}]}}}] at @s run function gm4_zauber_cauldrons:recipes/crystals/protection
execute if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:blast_protection",lvl:4s}]}}}] at @s run function gm4_zauber_cauldrons:recipes/crystals/blast_protection
execute if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:fire_protection",lvl:4s}]}}}] at @s run function gm4_zauber_cauldrons:recipes/crystals/fire_protection
execute if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:projectile_protection",lvl:4s}]}}}] at @s run function gm4_zauber_cauldrons:recipes/crystals/projectile_protection

#use water and play sound once a recipe ran
execute if score recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/use_extra_items
execute if score recipe_success gm4_zc_data matches 1 at @s run particle entity_effect ~ ~.4 ~ .1 .1 .1 1 10
execute if score recipe_success gm4_zc_data matches 1 at @s run playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5
execute if score recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/use_water

#reset fake players
scoreboard players reset expected_item_amount gm4_zc_fullness
