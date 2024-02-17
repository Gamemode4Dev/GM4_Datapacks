
# keep boss clock active
scoreboard players set $keep_tick.boss gm4_ce_keep_tick 1

# grab id
execute store result storage gm4_combat_expanded:temp boss.running_id int 1 run scoreboard players operation $running_id gm4_ce_boss.id = @s gm4_ce_boss.id

# process health
execute store result score $health gm4_ce_boss run data get entity @s Health
execute unless score $health gm4_ce_boss matches 960 if score @s gm4_ce_boss.phase matches 1.. run function gm4_combat_expanded:boss/running/health/update

# update health bar
function gm4_combat_expanded:boss/running/health/bossbar with storage gm4_combat_expanded:temp boss

# don't process if boss just died
execute if score @s gm4_ce_boss.health matches ..0 run return 0

# only fully process when the boss needs to act again
scoreboard players remove @s gm4_ce_boss.tick_delay 1
execute unless score @s gm4_ce_boss.tick_delay matches 1.. run function gm4_combat_expanded:boss/running/process

data remove storage gm4_combat_expanded:temp boss
