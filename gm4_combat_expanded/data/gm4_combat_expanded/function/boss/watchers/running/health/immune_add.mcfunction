# set boss to be immune to damage
# @s = boss shulker
# at @s
# run from boss/watchers/running/attack/explode_minions/explode_warp/away
# run from boss/watchers/running/attack/shield/process

tag @s add gm4_ce_boss.watcher.immune

execute unless score @s gm4_ce_boss.attack_id matches 6 positioned ~ ~0.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/health/immune_shield
