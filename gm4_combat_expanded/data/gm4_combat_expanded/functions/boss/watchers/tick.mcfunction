# tick watcher boss
# @s = boss shulker (main)
# at @s
# run from clocks/boss/watchers

# keep boss clock active
scoreboard players set $keep_tick.boss gm4_ce_keep_tick 1

# grab id
scoreboard players operation $running_id gm4_ce_boss.id = @s gm4_ce_boss.id

# process linked twin first
scoreboard players operation $phase gm4_ce_boss = @s gm4_ce_boss.phase
execute if entity @s[tag=gm4_ce_boss.watcher.has_twin] as @e[type=shulker,tag=gm4_ce_boss.watcher.secondary] if score @s gm4_ce_boss.secondary_id = $running_id gm4_ce_boss.id at @s run function gm4_combat_expanded:boss/watchers/tick_twin

# regain id and put in storage
execute store result storage gm4_combat_expanded:temp boss.running_id int 1 run scoreboard players operation $running_id gm4_ce_boss.id = @s gm4_ce_boss.id

# process health
execute store result score $health gm4_ce_boss run data get entity @s Health
execute unless score $health gm4_ce_boss matches 960 if score @s gm4_ce_boss.phase matches 1.. run function gm4_combat_expanded:boss/watchers/running/health/update
execute if score $health gm4_ce_boss matches 960 if score $twin_health_change gm4_ce_boss matches 1.. run function gm4_combat_expanded:boss/watchers/running/health/update
scoreboard players reset $twin_health_change gm4_ce_boss

# update health bar
function gm4_combat_expanded:boss/watchers/running/health/bossbar with storage gm4_combat_expanded:temp boss

# don't process if boss just died
execute if score @s gm4_ce_boss.health matches ..0 run return 0

# only fully process when the boss needs to act again
scoreboard players remove @s gm4_ce_boss.tick_delay 1
execute unless score @s gm4_ce_boss.tick_delay matches 1.. run function gm4_combat_expanded:boss/watchers/running/process

data remove storage gm4_combat_expanded:temp boss
