# apply poison to nearby entities on slime landing
# @s = slime that landed
# at @s
# run from mob/effect/poison_landing/process

execute store result score $cube_size gm4_ce_data run data get entity @s Size

tag @s remove gm4_ce_poison_landing_ready

execute if score $cube_size gm4_ce_data matches 0 run particle block slime_block ~ ~ ~ 0.1 0 0.1 0.1 1
execute if score $cube_size gm4_ce_data matches 1 run particle block slime_block ~ ~ ~ 0.1 0 0.1 0.1 4
execute if score $cube_size gm4_ce_data matches 2 run particle block slime_block ~ ~ ~ 0.5 0 0.5 0.1 9
execute if score $cube_size gm4_ce_data matches 3 run particle block slime_block ~ ~ ~ 1 0 1 0.1 16
execute if score $cube_size gm4_ce_data matches 4.. run particle block slime_block ~ ~ ~ 2 0 2 0.1 25

execute if score $cube_size gm4_ce_data matches 0 run effect give @e[gamemode=!creative,gamemode=!spectator,distance=..1,tag=!smithed.strict,tag=!gm4_ce_immune_poison] poison 1 0
execute if score $cube_size gm4_ce_data matches 1 run effect give @e[gamemode=!creative,gamemode=!spectator,distance=..2,tag=!smithed.strict,tag=!gm4_ce_immune_poison] poison 2 0
execute if score $cube_size gm4_ce_data matches 2 run effect give @e[gamemode=!creative,gamemode=!spectator,distance=..2.5,tag=!smithed.strict,tag=!gm4_ce_immune_poison] poison 2 1
execute if score $cube_size gm4_ce_data matches 3 run effect give @e[gamemode=!creative,gamemode=!spectator,distance=..3,tag=!smithed.strict,tag=!gm4_ce_immune_poison] poison 2 2
execute if score $cube_size gm4_ce_data matches 4.. run effect give @e[gamemode=!creative,gamemode=!spectator,distance=..4,tag=!smithed.strict,tag=!gm4_ce_immune_poison] poison 2 3
