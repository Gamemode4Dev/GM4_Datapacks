# process elite that got hit
# @s = elite that got hit
# at @s
# run from mob/process/elite/on_hit/run

execute if entity @s[tag=gm4_mu_elite.vorpal] if predicate {condition:"minecraft:random_chance",chance:0.65} run function gm4_monsters_unbound:mob/process/elite/vorpal/warp/run
execute if entity @s[tag=gm4_mu_elite.zephyr] run function gm4_monsters_unbound:mob/process/elite/zephyr/hit_when_charging
