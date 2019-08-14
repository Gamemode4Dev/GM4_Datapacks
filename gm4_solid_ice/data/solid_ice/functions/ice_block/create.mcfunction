#@s = item when creating solid ice

#center it and summon areaEffectCloud
execute at @s run summon leash_knot ~ ~-.5 ~ {Tags:["gm4_create_solid_ice"]} 
execute at @e[type=leash_knot,tag=gm4_create_solid_ice] run summon area_effect_cloud ~ ~ ~ {Radius:0,Age:-2147483648,CustomName:'"gm4_solid_ice"',Tags:["gm4_solid_ice"],Particle:"block air"}
kill @s
kill @e[type=leash_knot,tag=gm4_create_solid_ice]
