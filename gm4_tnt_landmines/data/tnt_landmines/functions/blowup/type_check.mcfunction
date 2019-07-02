#ran when a landmine is going to blowup
#@s = armed landmine due to go boom
execute as @s[tag=!gm4_no_damage] run function tnt_landmines:blowup/explosive
execute as @s[tag=gm4_no_damage] run function tnt_landmines:blowup/safe
