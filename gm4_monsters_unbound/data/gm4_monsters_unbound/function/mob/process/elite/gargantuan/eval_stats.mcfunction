# set gargantuan elite stats
# @s = gargantuan elite
# at @s
# run from mob/process/elite/gargantuan/update_stats

$attribute @s generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.giant.health_reduction_stats $(speed) add_multiplied_total
$attribute @s generic.attack_damage modifier add gm4_monsters_unbound:elite_buff.giant.health_reduction_stats $(damage) add_multiplied_total
$attribute @s generic.knockback_resistance modifier add gm4_monsters_unbound:elite_buff.giant.health_reduction_stats $(knockback_resistance) add_value
