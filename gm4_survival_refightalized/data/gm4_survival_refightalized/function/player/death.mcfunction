
# reset scores
scoreboard players set @s gm4_sr_stat.deaths 0
scoreboard players set @s gm4_sr_armor.reduction 0
scoreboard players set @s gm4_sr_armor.reduction_timer 0
scoreboard players set @s gm4_sr_health.quick_regeneration_health 0
scoreboard players set @s gm4_sr_health.quick_regeneration_timer 0
scoreboard players set @s gm4_sr_health.restoration 0

# remove armor reduction so player respawns with full armor in case of KeepInventory
attribute @s generic.armor modifier remove gm4_survival_refightalized:armor_reduced
