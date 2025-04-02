# start arrow burst for skeleton zephyr elite
# @s = zephyr elite
# at @s
# run from mob/process/elite/zephyr/process

tag @s add gm4_mu_elite.zephyr_skeleton_burst
scoreboard players set @s gm4_mu_data 0
execute unless score $keep_tick.elite_process_zephyr gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/zephyr_process 2t
