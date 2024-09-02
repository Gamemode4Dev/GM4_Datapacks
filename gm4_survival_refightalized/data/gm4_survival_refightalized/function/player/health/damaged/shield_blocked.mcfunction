# disable shield if it blocked damage
# @s = damaged player
# at @s
# run from player/health/damaged/run

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"Damage blocked by shield"}

# disable shield
tag @s add gm4_sr_target
execute at @s anchored eyes positioned ^ ^ ^1 summon armor_stand run function gm4_survival_refightalized:player/health/damaged/shield_disable
tag @s remove gm4_sr_target

# revoke advancement
advancement revoke @s only gm4_survival_refightalized:damaged
