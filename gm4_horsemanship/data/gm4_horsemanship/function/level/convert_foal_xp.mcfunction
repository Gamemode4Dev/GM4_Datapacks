
scoreboard players operation $convert_foal_xp gm4_horse_data = @s gm4_horse_experience
scoreboard players operation $convert_foal_xp gm4_horse_data < @s gm4_horse_potential.foal

scoreboard players operation @s gm4_horse_potential.foal -= $convert_foal_xp gm4_horse_data

scoreboard players operation @s gm4_horse_experience -= $convert_foal_xp gm4_horse_data
execute if score @s[scores={gm4_horse_level=..14}] gm4_horse_experience matches ..0 run function gm4_horsemanship:level/level_up

execute if score @s gm4_horse_potential.foal matches 1.. run function gm4_horsemanship:level/convert_foal_xp
