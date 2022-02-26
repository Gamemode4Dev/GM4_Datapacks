
summon falling_block 29999998 1 7133 {BlockState:{Name:"minecraft:air"},NoGravity:1b,Time:1,Tags:["test"]}
execute as @e[type=falling_block,tag=test,limit=1] run function gm4_armor_identification:sand_2
