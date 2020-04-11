# @s = player consuming wormhole_bottle
# at @s
# run from advancement zauber_cauldrons:consume_wormhole_bottle

#revoke advancement for next teleport
advancement revoke @s only gm4_zauber_cauldrons:consume_wormhole_bottle

#survival/adventure: check whether wormhole in offhand was consumed
scoreboard players set offhand_warp gm4_zc_data 0
execute store result score offhand_warp gm4_zc_data if entity @s[scores={gm4_zc_warp_od=-1..1},gamemode=!creative] run loot spawn ~ -1024 ~ fish zauber_cauldrons:check_consumed_bottle ~ 0 ~ offhand

#creative: there is no way to detect whether mainhand or offhand was consumed
execute if entity @s[gamemode=creative] store success score offhand_warp gm4_zc_data unless entity @s[scores={gm4_zc_warp_md=-1..1}]

#copy the correct scores into fake players wormhole_x, wormhole_y, wormhole_z, wormhole_d
execute if score offhand_warp gm4_zc_data matches 0 run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/use_mainhand
execute if score offhand_warp gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/use_offhand

#affect player with resistance
execute unless data entity @s ActiveEffects[{Id:11b,Ambient:0b}] run effect give @s resistance 1 12 true

#particles and sound for depart
particle portal ~ ~.6 ~ .25 .25 .25 0 100
playsound entity.enderman.teleport player @a[distance=0.001..8] ~ ~ ~ 1 .3

#summon marker for teleportation
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_zc_wormhole_target","gm4_zc_new_wormhole_target"],Duration:1}

#teleport the player to the wormhole's destination using the marker
tag @s add gm4_zc_wormhole_consumer
execute as @e[type=area_effect_cloud,tag=gm4_zc_new_wormhole_target,limit=1] run function gm4_zauber_cauldrons:cauldron/wormhole_targeting/set_position
tag @s remove gm4_zc_wormhole_consumer
