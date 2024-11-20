
data modify storage gm4_combat_expanded:temp wild_magic.id set value "slow_falling"

# Duration
execute store result storage gm4_combat_expanded:temp wild_magic.duration int 1 run random value 15..60

# Level
execute store result storage gm4_combat_expanded:temp wild_magic.level int 1 run scoreboard players set $base gm4_ce_data 0
