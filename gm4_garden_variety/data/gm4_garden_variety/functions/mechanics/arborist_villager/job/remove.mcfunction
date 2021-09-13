# removes a villagers job if they have not been locked
# @s = @s[tag=gm4_gv_arborist,tag=!gm4_gv_locked_job]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/job/missing_job_site


# reset villager
data modify entity @s CustomName set value ''
data modify entity @s VillagerData.profession set value "minecraft:none"
data modify entity @s Offers.Recipes set value []
data modify entity @s Brain.memories."minecraft:job_site" set value {}
tag @s remove gm4_gv_arborist
