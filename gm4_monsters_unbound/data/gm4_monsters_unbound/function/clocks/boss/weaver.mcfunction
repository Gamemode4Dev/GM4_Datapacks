# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from boss/watchers/activation/spawn/head
# schedule from here

scoreboard players set $keep_tick.boss.weaver gm4_mu_keep_tick 0

execute as @e[type=spider,tag=gm4_mu_boss.weaver] at @s run function gm4_monsters_unbound:boss/weaver/tick

execute if score $keep_tick.boss.weaver gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/boss/weaver 1t
