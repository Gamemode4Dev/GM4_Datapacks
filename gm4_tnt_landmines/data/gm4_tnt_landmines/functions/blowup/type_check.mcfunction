# @s = detonated landmine
# run from tick

execute if entity @s[tag=!gm4_no_damage] run function gm4_tnt_landmines:blowup/explosive
execute if entity @s[tag=gm4_no_damage] run function gm4_tnt_landmines:blowup/safe
