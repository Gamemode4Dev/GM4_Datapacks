#creates altar
#@s - @a[gamemode=!spectator,scores={gm4_rit_sneak=1..}] if spawn checks passed
#called by rituals:altar/check_spawn

#audiovisuals
playsound minecraft:ui.stonecutter.take_result player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:ui.stonecutter.take_result player @a[distance=..20] ~ ~ ~ 100 0 1
playsound minecraft:entity.cat.beg_for_food player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:entity.cat.beg_for_food player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:entity.ravager.stunned player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:falling_dust minecraft:redstone_wire ~1 ~1 ~ .1 .1 .1 0 10 normal @a
particle minecraft:falling_dust minecraft:redstone_wire ~-1 ~1 ~ .1 .1 .1 0 10 normal @a
particle minecraft:falling_dust minecraft:redstone_wire ~ ~1 ~1 .1 .1 .1 0 10 normal @a
particle minecraft:falling_dust minecraft:redstone_wire ~ ~1 ~-1 .1 .1 .1 0 10 normal @a
particle minecraft:block minecraft:red_sandstone ~1 ~1.5 ~ 0 0 0 .5 30 normal @a
particle minecraft:block minecraft:red_sandstone ~-1 ~1.5 ~ 0 0 0 .5 30 normal @a
particle minecraft:block minecraft:red_sandstone ~ ~1.5 ~1 0 0 0 .5 30 normal @a
particle minecraft:block minecraft:red_sandstone ~ ~1.5 ~-1 0 0 0 .5 30 normal @a
particle minecraft:portal ~ ~ ~ 1 1 1 1 500 normal @a

summon minecraft:lightning_bolt ~ ~ ~

#advancement
advancement grant @s only gm4:rituals_altar_creation
execute if block ~1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] if block ~-1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] if block ~ ~-1 ~1 minecraft:red_sandstone_stairs[waterlogged=true] if block ~ ~-1 ~-1 minecraft:red_sandstone_stairs[waterlogged=true] run advancement grant @s only gm4:rituals_altar_creation_water

#summon entity
summon minecraft:area_effect_cloud ~ ~ ~ {Age:-2147483648,Duration:-1,WaitTime:-2147483648,Tags:["gm4_rituals_altar"],CustomName:'"gm4_rituals_altar"'}
