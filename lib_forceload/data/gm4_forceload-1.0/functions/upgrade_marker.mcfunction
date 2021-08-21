# @s = area effect cloud dimension marker
# run from check_dimension

kill @e[type=marker,tag=gm4_dimension,distance=..1]
summon marker ~ ~ ~ {Tags:["gm4_dimension","gm4_new_dimension"]}
data modify entity @e[type=marker,tag=gm4_new_dimension,limit=1] CustomName set from entity @s CustomName
scoreboard players operation @e[type=marker,tag=gm4_new_dimension,limit=1] gm4_dimension = @s gm4_dimension
tag @e[type=marker] remove gm4_new_dimension
kill @s
