# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from amor/modifier/type/link/check
# schedule from here

scoreboard players set $keep_tick.link gm4_ce_keep_tick 0

tag @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative,predicate=gm4_combat_expanded:modified_armor/link] add gm4_ce_linked.check
execute as @p[tag=gm4_ce_linked.check] run function gm4_combat_expanded:armor/modifier/type/link/process/loop_links

execute if score $keep_tick.link gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:armor/modifier/type/link/clock 1t
