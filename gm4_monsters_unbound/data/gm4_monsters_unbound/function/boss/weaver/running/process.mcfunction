# process weaver boss
# @s = boss shulker
# at @s
# run from boss/weavers/tick_twin
# run from boss/weavers/tick

# tag self as running
tag @s add gm4_mu_boss.weaver.running

# pick new attack if there was none selected
execute unless score @s gm4_mu_boss.attack_id matches 1.. run function gm4_monsters_unbound:boss/weavers/running/pick_attack
# spawning
execute if score @s gm4_mu_boss.attack_id matches 1 run function gm4_monsters_unbound:boss/weavers/running/attack/spawn/process
# process attacks
execute if score @s gm4_mu_boss.attack_id matches 2 run function gm4_monsters_unbound:boss/weavers/running/attack/fireball/process
execute if score @s gm4_mu_boss.attack_id matches 3 run function gm4_monsters_unbound:boss/weavers/running/attack/warp/process
execute if score @s gm4_mu_boss.attack_id matches 4 run function gm4_monsters_unbound:boss/weavers/running/attack/slam/process
execute if score @s gm4_mu_boss.attack_id matches 5 run function gm4_monsters_unbound:boss/weavers/running/attack/summon_minions/process
execute if score @s gm4_mu_boss.attack_id matches 6 run function gm4_monsters_unbound:boss/weavers/running/attack/explode_minions/process
execute if score @s gm4_mu_boss.attack_id matches 7 run function gm4_monsters_unbound:boss/weavers/running/attack/aura/process
# shield
execute if score @s gm4_mu_boss.attack_id matches 8 run function gm4_monsters_unbound:boss/weavers/running/attack/shield/process

# remove tracking tags
tag @s remove gm4_mu_boss.weaver.running
