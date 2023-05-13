# @s = mob that will take damage from a vibro shockwave
# run from shock/calculate

# apply new health
execute store result score $health gm4_vibro_shock run data get entity @s Health 100
scoreboard players operation $health gm4_vibro_shock -= $shockwave gm4_vibro_shock
execute if score $health gm4_vibro_shock matches 1.. run execute store result entity @s Health float .01 run scoreboard players get $health gm4_vibro_shock
execute if score $health gm4_vibro_shock matches ..0 run kill @s

# knockback mob
## get player pos
data modify storage gm4_vibro_shamir:temp Pos set from entity @a[tag=gm4_vibro_user,limit=1] Pos
execute store result score $target_x gm4_vibro_shock run data get storage gm4_vibro_shamir:temp Pos[0]
execute store result score $target_z gm4_vibro_shock run data get storage gm4_vibro_shamir:temp Pos[2]

## get vector
data modify storage gm4_vibro_shamir:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_vibro_shock run data get storage gm4_vibro_shamir:temp Pos[0]
execute store result score $motion_z gm4_vibro_shock run data get storage gm4_vibro_shamir:temp Pos[2]

scoreboard players operation $motion_x gm4_vibro_shock -= $target_x gm4_vibro_shock
scoreboard players operation $motion_z gm4_vibro_shock -= $target_z gm4_vibro_shock

## set motion
execute store result entity @s[tag=!smithed.strict] Motion[0] double 0.2 run scoreboard players get $motion_x gm4_vibro_shock
execute store result entity @s[tag=!smithed.strict] Motion[2] double 0.2 run scoreboard players get $motion_z gm4_vibro_shock
data modify entity @s[tag=!smithed.strict] Motion[1] set value 0.35d

## clean up
data remove storage gm4_vibro_shamir:temp Pos

# visuals
effect give @s resistance 1 4 true
effect give @s[type=#gm4:undead] instant_health
effect give @s[type=!#gm4:undead] instant_damage

playsound minecraft:entity.player.attack.crit player @a[distance=..8] ~ ~ ~ 1 1.4
particle minecraft:crit ~ ~.5 ~ 0 0 0 .5 20
particle minecraft:damage_indicator ~ ~.5 ~ 0 0 0 .5 5

tag @a[tag=gm4_vibro_user,limit=1] add gm4_vibro_shock
