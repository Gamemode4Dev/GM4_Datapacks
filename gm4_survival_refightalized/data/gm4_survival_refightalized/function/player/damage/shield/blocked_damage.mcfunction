# disable shield if it blocked damage
# @s = damaged player
# at @s
# run from player/health/damaged/run

# revoke advancement and reset resist score so damage doesn't build up
advancement revoke @s only gm4_survival_refightalized:damaged

# parried
execute if score @s gm4_sr_shield.use_ticks matches ..5 run return run function gm4_survival_refightalized:player/damage/shield/parry

# disable shield
tag @s add gm4_sr_target
execute at @s anchored eyes positioned ^ ^ ^1 summon armor_stand run function gm4_survival_refightalized:player/damage/shield/disable
tag @s remove gm4_sr_target

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"Damage blocked by shield","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
