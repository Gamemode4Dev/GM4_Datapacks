# @s=golden_boots in cauldron
# at align xyz
# run from recipe/armor/zauber_armor.mcfunction

execute if score recipe_success gm4_zc_data matches 0 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:glistering_melon_slice",Count:1b}}] run function gm4_zauber_cauldrons:recipes/armor/boots/health_boost
execute if score recipe_success gm4_zc_data matches 0 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:blaze_powder",Count:1b}}] run function gm4_zauber_cauldrons:recipes/armor/boots/attack_boost
execute if score recipe_success gm4_zc_data matches 0 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:rabbit_foot",Count:1b}}] run function gm4_zauber_cauldrons:recipes/armor/boots/speed_boost
execute if score recipe_success gm4_zc_data matches 0 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:ender_eye",Count:1b}}] run function gm4_zauber_cauldrons:recipes/armor/boots/knockback_resistance
