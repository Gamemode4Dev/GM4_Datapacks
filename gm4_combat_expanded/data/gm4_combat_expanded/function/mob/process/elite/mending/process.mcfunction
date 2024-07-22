
execute as @e[type=#gm4_combat_expanded:undead,tag=!gm4_ce_elite.mending,distance=..30,limit=12,sort=random] run function gm4_combat_expanded:mob/process/elite/mending/check_target

tag @s add gm4_ce_self
execute anchored eyes as @e[type=#gm4_combat_expanded:undead,tag=gm4_ce_target,distance=..30] facing entity @s eyes run function gm4_combat_expanded:mob/process/elite/mending/check_los_raycast
tag @s remove gm4_ce_self
