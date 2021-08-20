summon marker ~ ~ ~ {CustomName:'"gm4_soul_glass"',Tags:["gm4_soul_glass"]}
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_soul_glass,limit=1] gm4_sg_levels = @s gm4_sg_levels
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_soul_glass,limit=1] gm4_sg_primary = @s gm4_sg_primary
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_soul_glass,limit=1] gm4_sg_secondary = @s gm4_sg_secondary
kill @s
