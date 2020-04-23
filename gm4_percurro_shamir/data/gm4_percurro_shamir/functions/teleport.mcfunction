# @s = player hitting a mob with a percurro shamir
# at ^ ^ ^4
# run from any one of the functions in  check_teleport_destination/

# teleport to target coordinate
tp @s ~ ~ ~

# adjust facing
execute at @s facing entity @e[type=area_effect_cloud,tag=gm4_percurro_depart,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# remove marker area_effect_cloud
kill @e[type=area_effect_cloud,tag=gm4_percurro_depart]

# visuals and sounds
particle minecraft:campfire_cosy_smoke ~ ~ ~ .1 1 .1 0.03 3
playsound minecraft:entity.illusioner.cast_spell master @a ~ ~ ~ 1 1.2
