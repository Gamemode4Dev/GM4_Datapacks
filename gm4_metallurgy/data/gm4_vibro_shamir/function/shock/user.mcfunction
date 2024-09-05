# @s = player who used vibro
# run from shock/activate

# set up player
tag @s add gm4_vibro_user
scoreboard players operation $damage gm4_vibro_shock = @s gm4_vibro_shock

# calculate damage dealt to mobs
execute as @e[team=!gm4_invalid_team,type=!armor_stand,tag=!gm4_vibro_user,distance=..6] at @s run function gm4_vibro_shamir:shock/calculate

# visuals
particle minecraft:cloud ~ ~.3 ~ 0.2 0.2 0.2 0.1 20
particle minecraft:smoke ~ ~.3 ~ 0.3 0.3 0.3 0.02 40
particle minecraft:mycelium ~ ~ ~ 1 1 1 5 50
particle minecraft:dust_color_transition{from_color:[0.239,0.251,0.247],to_color:[1.000,0.996,0.961],scale:1} ~ ~.2 ~ 2 0 2 0 200

playsound minecraft:item.shovel.flatten block @a[distance=..8] ~ ~ ~ 1 0.1
execute if entity @s[tag=gm4_vibro_shock] run playsound minecraft:item.totem.use player @a[distance=..8] ~ ~ ~ 0.1 2

# clean up
tag @s remove gm4_vibro_shock
tag @s remove gm4_vibro_user
