
execute store result score $age gm4_horse_data run data get entity @s Age
execute if score $age gm4_horse_data matches ..-1 run return run function gm4_horsemanship:dev/log_foal

tellraw @p "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

tellraw @p [{text:"| Tracked Horse: "},{selector:"@s"}]
tellraw @p [{text:"Stamina: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_need.stamina"},"color":"white"},{text:"/"},{"score":{"name":"@s","objective":"gm4_horse.stamina_cap"}}]

tellraw @p ""

scoreboard players set $potential_loss.mult gm4_horse_data 1
execute unless score @s gm4_horse_need.brushing matches 50.. run scoreboard players add $potential_loss.mult gm4_horse_data 1
execute if entity @s[tag=gm4_horse.tired] run scoreboard players add $potential_loss.mult gm4_horse_data 1
execute unless score @s gm4_horse_need.graze matches 1.. run scoreboard players add $potential_loss.mult gm4_horse_data 1

scoreboard players operation $xp_conversion gm4_horse_data = @s gm4_horse_potential.realized
scoreboard players operation $xp_conversion gm4_horse_data /= @s gm4_horse_potential.total
scoreboard players operation $xp_conversion gm4_horse_data > #25 gm4_horse_data

tellraw @p [{text:"Level: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_level"},"color":"white"},\
{text:" XP: "},{"score":{"name":"@s","objective":"gm4_horse_experience"},"color":"white"},\
{text:" Potential: "},{"score":{"name":"@s","objective":"gm4_horse_potential.total"},"color":"white"},{text:"/1125 | "},{"score":{"name":"@s","objective":"gm4_horse_potential.realized"},"color":"white"},\
{"text":" (","color":"dark_gray"},{"score":{"name":"@s","objective":"gm4_horse_comfort"},"color":"dark_gray"},{"text":"% | ","color":"dark_gray"},{"score":{"name":"$potential_loss.mult","objective":"gm4_horse_data"},"color":"dark_gray"},{"text":"x | ","color":"dark_gray"},{"score":{"name":"$xp_conversion","objective":"gm4_horse_data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}\
]

tellraw @p ""

tellraw @p [{text:"Graze: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_need.graze"},"color":"white"},\
{text:"/2160 | Brush: "},{"score":{"name":"@s","objective":"gm4_horse_need.brushing"},"color":"white"},\
{text:"/1500 | On Leash: "},{"score":{"name":"@s","objective":"gm4_horse_need.on_leash"},"color":"white"},\
{text:"/1125 | Fed Treat: "},{"score":{"name":"@s","objective":"gm4_horse_need.fed_treat"},"color":"white"},\
{text:"/15"},\
]
