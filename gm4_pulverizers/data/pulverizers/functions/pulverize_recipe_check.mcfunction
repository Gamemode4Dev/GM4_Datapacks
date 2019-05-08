# @s = pulverizer if block ~ ~ ~ dropper[triggered=false]{Items:[{Slot:0b}]}
# run from #pulverizers:recipe_check
execute store result score @s gm4_string run data get block ~ ~ ~ Items[0].id

execute if score @s gm4_string matches 14..20 run function pulverizers:recipes/14_20
execute if score @s gm4_string matches 21..23 run function pulverizers:recipes/21_23
execute if score @s gm4_string matches 24..26 run function pulverizers:recipes/24_26
execute if score @s gm4_string matches 27..32 run function pulverizers:recipes/27_32
