# @s = armor stand with cursed chestplate
# at world spawn
# ran from creation_checks

#check for skulls
execute if entity @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull"}]}] run tag @s add gm4_phantom_scarecrow
execute if entity @s[tag=!gm4_phantom_scarecrow,nbt={ArmorItems:[{},{},{},{id:"minecraft:skeleton_skull"}]}] run tag @s add gm4_phantom_scarecrow
execute if entity @s[tag=!gm4_phantom_scarecrow,nbt={ArmorItems:[{},{},{},{id:"minecraft:zombie_head"}]}] run tag @s add gm4_phantom_scarecrow
#initialise scoreboard
scoreboard players add @s[tag=gm4_phantom_scarecrow] gm4_ps_time 0
#lock slots
data merge entity @s[tag=gm4_phantom_scarecrow] {DisabledSlots:2039583}
