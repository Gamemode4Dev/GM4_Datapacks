# @s player consuming wormhole_bottle
# at @s
# run from advancement zauber_cauldrons:consume_wormhole_bottle

#effect player with resistance
execute unless entity @s[nbt={ActiveEffects:[{Id:11b,Ambient:0b}]}] run effect give @s minecraft:resistance 1 12 true
#particles and sound for depart
particle minecraft:portal ~ ~.6 ~ .25 .25 .25 0 100
playsound minecraft:entity.enderman.teleport player @a[distance=1..8] ~ ~ ~ 1 .3
#summon marker for teleportation
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_zc_wormhole_target","gm4_zc_new_wormhole_target"],Duration:1}

#chose dimension
execute if score @s gm4_zc_warp_d matches 0 in minecraft:overworld run function zauber_cauldrons:cauldron/wormhole_targeting/teleport_to_dimension
execute if score @s gm4_zc_warp_d matches 1 in minecraft:the_end run function zauber_cauldrons:cauldron/wormhole_targeting/teleport_to_dimension
execute if score @s gm4_zc_warp_d matches -1 in minecraft:the_nether run function zauber_cauldrons:cauldron/wormhole_targeting/teleport_to_dimension

#revoke advancement for next teleport
advancement revoke @s only zauber_cauldrons:consume_wormhole_bottle
