# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from armor/modifier/type/archer/activate
# schedule from here

# archer
execute as @a[tag=gm4_ce_wearing_archer] run scoreboard players operation @s gm4_ce_used_bow += @s gm4_ce_used_crossbow
execute as @a[tag=gm4_ce_wearing_archer,scores={gm4_ce_used_bow=1..}] at @s run function gm4_combat_expanded:armor/modifier/type/archer/find_arrow
scoreboard players reset @a gm4_ce_used_bow
scoreboard players reset @a gm4_ce_used_crossbow

execute if entity @a[tag=gm4_ce_wearing_archer] run schedule function gm4_combat_expanded:armor/modifier/type/archer/clock 1t
