#creation
execute as @e[type=armor_stand,tag=!smithed.entity,tag=!gm4_phantom_scarecrow] if items entity @s armor.chest *[enchantments~[{enchantment:"minecraft:binding_curse"}]|enchantments~[{enchantment:"minecraft:vanishing_curse"}]] if items entity @s armor.head #gm4_phantom_scarecrows:skulls run function gm4_phantom_scarecrows:create
execute as @e[type=armor_stand,tag=gm4_phantom_scarecrow,tag=!smithed.entity] run function gm4_phantom_scarecrows:upgrade_path/smithed_compat

#launch cooldown
scoreboard players add @e[type=armor_stand,tag=gm4_phantom_scarecrow,scores={gm4_ps_time=..4}] gm4_ps_time 1
execute as @e[type=armor_stand,tag=gm4_phantom_scarecrow,scores={gm4_ps_time=5..}] at @s positioned ~ ~20 ~ if entity @e[type=phantom,distance=..25] positioned ~ ~-18.5 ~ run function gm4_phantom_scarecrows:shoot

schedule function gm4_phantom_scarecrows:main 16t
