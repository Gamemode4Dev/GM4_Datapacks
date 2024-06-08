# spawn a new silverfish from infesting bite
# @s = silverfish
# at @s
# run from mob/process/attack_effect/infesting_attack

execute store result entity @s Motion[0] double 0.01 run random value -25..25
execute store result entity @s Motion[1] double 0.01 run random value 10..20
execute store result entity @s Motion[2] double 0.01 run random value -25..25

particle minecraft:block{block_state:"minecraft:stone"} ~ ~ ~ 0.15 0.15 0.15 0.5 10
playsound minecraft:entity.silverfish.ambient player @a ~ ~ ~ 0.8 0.65

function gm4_combat_expanded:mob/init/initiate
