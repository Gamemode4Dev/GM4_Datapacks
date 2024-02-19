
# kill all entities affiliated with this boss entity
execute store result storage gm4_combat_expanded:temp boss.running_id int 1 run scoreboard players operation $running_id gm4_ce_boss.id = @s gm4_ce_boss.id
execute as @e[tag=gm4_ce_boss] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run kill @s

# remove bossbar
function gm4_combat_expanded:boss/watchers/defeated/remove_bossbar with storage gm4_combat_expanded:temp boss
data remove storage gm4_combat_expanded:temp boss

# kill sentinel if its still alive
execute unless entity @s[tag=gm4_ce_boss.watcher.secondary] as @e[type=shulker,tag=gm4_ce_boss.watcher.secondary] if score @s gm4_ce_boss.secondary_id = $running_id gm4_ce_boss.id at @s run function gm4_combat_expanded:boss/watchers/defeated/kill

# spawn loot
execute unless entity @s[tag=gm4_ce_boss.watcher.secondary] run function gm4_combat_expanded:boss/watchers/defeated/loot
summon experience_orb ~.41 ~.48 ~.14 {Value:240,Motion:[0.18,0.05,-0.15]}
summon experience_orb ~-.38 ~.55 ~.24 {Value:240,Motion:[0.11,0.02,0.11]}
summon experience_orb ~.27 ~.58 ~-.10 {Value:240,Motion:[0.12,0.03,0.18]}
summon experience_orb ~.30 ~.49 ~.28 {Value:240,Motion:[-0.19,0.02,-0.12]}
summon experience_orb ~-.22 ~.52 ~-.18 {Value:240,Motion:[0.13,0.06,0.17]}

summon experience_orb ~-.34 ~.41 ~.14 {Value:467,Motion:[-0.12,0.02,-0.13]}

# sounds and particles
playsound minecraft:entity.vex.death hostile @a[distance=..32] ~ ~ ~ 2 0 1
playsound minecraft:block.beacon.deactivate hostile @a[distance=..32] ~ ~ ~ 0.75 0 1
playsound minecraft:item.trident.thunder hostile @a[distance=..32] ~ ~ ~ 0.5 0.9 1
particle minecraft:reverse_portal ~ ~0.5 ~ 0.15 0.15 0.15 2 128
particle minecraft:witch ~ ~0.5 ~ 0.15 0.15 0.15 2 18
particle block polished_deepslate ~ ~0.5 ~ 0.15 0.15 0.15 0 12
particle block amethyst_block ~ ~0.5 ~ 0.15 0.15 0.15 0 4

# remove shulker
tp @s ~ ~-1000 ~
kill @s
