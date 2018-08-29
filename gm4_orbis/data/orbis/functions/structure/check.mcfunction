# summon structure marker and run a spreadplayers on it to put it on the ground
# although this means structures no longer spawn seed specific, it's an easy way
# to get them on the surface on a random spot
summon area_effect_cloud ~ ~ ~ {Tags:[orbis_structure]}
spreadplayers ~ ~ 0 8 false @e[tag=orbis_structure,limit=1]
# spreadplayers puts them on top of the snow layer so for this on case, tp the marker down
execute as @e[tag=orbis_structure,limit=1] at @s if block ~ ~-1 ~ snow run tp @s ~ ~-1 ~
# store the height in a score and attempt to either spawn a dungeon or a tower
execute store result score height gm4_count run data get entity @e[tag=orbis_structure,limit=1] Pos[1]
execute if score height gm4_count matches ..69 at @e[tag=orbis_structure,limit=1] run function orbis:structure/dungeon/check
execute if score height gm4_count matches 70.. at @e[tag=orbis_structure,limit=1] run function orbis:structure/tower/check
# kill the structure marker
kill @e[tag=orbis_structure]
