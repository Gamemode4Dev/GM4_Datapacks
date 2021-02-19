# @s = player who's died / raycast from player placing a soul in a lantern / soul tracker from angry soul fragment from a soul in a lantern / soul in a lantern on the ground near their linked player or away from any players / mob who's grabbed a soul in a lantern
# at @s
# from player/died or main or soul_lantern/process or mob/eject_fragment

# play visuals/sounds if called by soul in a lantern or player
execute if entity @s[type=minecraft:player] run particle minecraft:soul ~ ~1.5 ~ .2 0 .2 .03 5 normal
execute if entity @s[type=minecraft:item] run particle minecraft:soul ~ ~.3 ~ .3 0 .2 .03 5 normal
execute if entity @s[type=area_effect_cloud] run particle minecraft:soul ~ ~.3 ~ .3 0 .2 .03 5 normal
execute if entity @s[type=minecraft:player] run playsound minecraft:block.chorus_flower.grow player @a[distance=..16] ~ ~ ~ .9 1.5
execute if entity @s[type=!minecraft:player] run playsound minecraft:block.chorus_flower.grow neutral @a[distance=..16] ~ ~ ~ .9 1.5

# summon soul fragment
summon area_effect_cloud ~ ~.2 ~ {Radius:0,Age:-2147483648,Duration:2147483647,CustomName:'"gm4_soul_fragment"',Tags:["gm4_soul_fragment","gm4_new_soul_fragment"],Particle:"block air"}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,limit=1,sort=nearest,distance=...3] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_new_soul_fragment] remove gm4_new_soul_fragment

# revert to regular lantern if called by soul in a lantern
execute if entity @s[type=item] run function gm4_soul_fragments:soul_lantern/wipe

# kill @s if called by gm4_sf_soul_tracker or gm4_sf_ray
execute if entity @s[type=area_effect_cloud] run kill @s
