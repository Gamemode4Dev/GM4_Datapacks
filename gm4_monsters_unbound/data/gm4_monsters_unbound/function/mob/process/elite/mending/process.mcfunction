# process mending elite
# @s = mending elite
# at @s
# run from mob/process/elite/check_type

execute as @e[type=#gm4_survival_refightalized:undead,tag=!gm4_mu_elite.mending,distance=..30,limit=12,sort=random] run function gm4_monsters_unbound:mob/process/elite/mending/check_target

tag @s add gm4_mu_self
execute anchored eyes as @e[type=#gm4_survival_refightalized:undead,tag=gm4_mu_target,distance=..30] facing entity @s eyes run function gm4_monsters_unbound:mob/process/elite/mending/check_los_raycast
tag @s remove gm4_mu_self
