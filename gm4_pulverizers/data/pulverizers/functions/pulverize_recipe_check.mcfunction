# run from #pulverizers:recipe_check
execute store result score @s gm4_string run data get block ~ ~ ~ Items[0].id

execute if score @s gm4_string matches 14..23 run function pulverizers:recipes/split_14_23
execute if score @s gm4_string matches 24..32 run function pulverizers:recipes/split_24_32