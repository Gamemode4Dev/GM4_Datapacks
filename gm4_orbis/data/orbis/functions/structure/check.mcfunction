summon area_effect_cloud ~ ~ ~ {Tags:[orbis_structure]}
spreadplayers ~ ~ 0 8 false @e[tag=orbis_structure,limit=1]
execute as @e[tag=orbis_structure,limit=1] at @s if block ~ ~-1 ~ snow run tp @s ~ ~-1 ~
execute store result score height gm4_count run data get entity @e[tag=orbis_structure,limit=1] Pos[1]
execute if score height gm4_count matches ..69 at @e[tag=orbis_structure,limit=1] run function orbis:structure/dungeon/check
execute if score height gm4_count matches 70.. at @e[tag=orbis_structure,limit=1] run function orbis:structure/tower/check
kill @e[tag=orbis_structure]
