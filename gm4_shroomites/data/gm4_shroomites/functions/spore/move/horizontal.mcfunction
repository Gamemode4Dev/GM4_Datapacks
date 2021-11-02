# moves a spore one step horizontally
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:spore/move/vertical

# select valid directions
summon marker ~1 ~ ~ {Tags:["gm4_shroomite_path"],CustomName:'"gm4_shroomite_path"'}
summon marker ~-1 ~ ~ {Tags:["gm4_shroomite_path"],CustomName:'"gm4_shroomite_path"'}
summon marker ~ ~ ~1 {Tags:["gm4_shroomite_path"],CustomName:'"gm4_shroomite_path"'}
summon marker ~ ~ ~-1 {Tags:["gm4_shroomite_path"],CustomName:'"gm4_shroomite_path"'}
execute as @e[type=marker,tag=gm4_shroomite_path] at @s if block ~ ~ ~ #gm4:full_collision run function gm4_shroomites:spore/move/step_up

# move in random valid direction
teleport @s @e[type=marker,tag=gm4_shroomite_path,sort=random,limit=1,distance=..1.5]
kill @e[type=marker,tag=gm4_shroomite_path,distance=..1.5]

# environmental effects
execute at @s run function gm4_shroomites:spore/move/postmovement
