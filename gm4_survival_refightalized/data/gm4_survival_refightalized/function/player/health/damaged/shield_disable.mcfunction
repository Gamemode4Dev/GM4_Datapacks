# damage the player from an axe to disable their shield
# @s = armor stand
# at @s
# run from player/health/damaged/shield_blocked

item replace entity @s weapon.mainhand with iron_axe
damage @p[tag=gm4_sr_target] 0.01 mob_attack by @s
kill @s
