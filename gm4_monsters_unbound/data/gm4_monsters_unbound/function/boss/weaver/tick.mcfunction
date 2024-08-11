# tick weaver boss
# @s = boss spider
# at @s
# run from clocks/boss/weaver

# keep boss clock active
scoreboard players set $keep_tick.boss.weaver gm4_mu_keep_tick 1

# gain id and put in storage
execute store result storage gm4_monsters_unbound:temp boss.running_id int 1 run scoreboard players operation $running_id gm4_mu_boss.id = @s gm4_mu_boss.id

# process health
execute store result score $health gm4_mu_boss run data get entity @s Health
execute unless score $health gm4_mu_boss = @s gm4_mu_boss.health run function gm4_monsters_unbound:boss/weaver/running/health/update

# update health bar
function gm4_monsters_unbound:boss/weaver/running/health/bossbar with storage gm4_monsters_unbound:temp boss

# only fully process when the boss needs to act again
scoreboard players remove @s gm4_mu_boss.tick_delay 1
execute unless score @s[scores={gm4_mu_boss.health=1..}] gm4_mu_boss.tick_delay matches 1.. run function gm4_monsters_unbound:boss/weaver/running/process

data remove storage gm4_monsters_unbound:temp boss
