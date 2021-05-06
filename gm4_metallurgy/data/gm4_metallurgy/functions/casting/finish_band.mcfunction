# @s = mould requesting a band
# run from any function in casting/summon_band

# kill band with the same CMD as the CMD of possible recycled band
execute as @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run execute store result score @s gm4_ml_sh_id run data get entity @s Item.tag.CustomModelData
execute as @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] if score @s gm4_ml_sh_id = @e[type=vex,tag=gm4_sand_ring,distance=..0.1,limit=1] gm4_ml_sh_id run kill @s

#select a random item and kill others
tag @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}},sort=random,limit=1] add gm4_ml_selected_band
kill @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}},tag=!gm4_ml_selected_band]

scoreboard players set band_applied gm4_ml_data 1
