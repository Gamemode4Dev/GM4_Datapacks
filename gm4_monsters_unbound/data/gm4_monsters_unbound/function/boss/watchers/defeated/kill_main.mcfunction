# kill boss
# @s = boss shulker (main)
# at @s
# run from boss/watchers/defeated/kill

# remove bossbar
function gm4_monsters_unbound:boss/watchers/defeated/remove_bossbar with storage gm4_monsters_unbound:temp boss
data remove storage gm4_monsters_unbound:temp boss

# kill secondary
execute as @e[type=shulker,tag=gm4_mu_boss.watcher.secondary] if score @s gm4_mu_boss.secondary_id = $running_id gm4_mu_boss.id at @s run function gm4_monsters_unbound:boss/watchers/defeated/kill

# spawn loot
##TODO: add loot from boss
