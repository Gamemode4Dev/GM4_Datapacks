#@s = item when creating solid ice

#summon areaEffectCloud and kill item
execute at @s align xyz positioned ~.5 ~.5 ~.5 run summon area_effect_cloud ~ ~-1 ~ {Radius:0,Age:-2147483648,CustomName:'"gm4_solid_ice"',Tags:["gm4_solid_ice"],Particle:"block air"}
kill @s
