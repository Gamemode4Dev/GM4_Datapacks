#creation
execute as @e[type=armor_stand,tag=!gm4_phantom_scarecrow] run function phantom_scarecrows:creation_checks
#launch cooldown
scoreboard players add @e[type=armor_stand,tag=gm4_phantom_scarecrow,scores={gm4_ps_time=..4}] gm4_ps_time 1
execute as @e[type=armor_stand,tag=gm4_phantom_scarecrow,scores={gm4_ps_time=5..}] at @s positioned ~ ~20 ~ if entity @e[type=phantom,distance=..25] positioned ~ ~-18.5 ~ run function phantom_scarecrows:shoot
