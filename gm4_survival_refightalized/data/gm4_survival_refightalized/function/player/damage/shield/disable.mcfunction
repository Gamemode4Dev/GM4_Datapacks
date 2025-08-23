# damage the player from an axe to disable their shield
# @s = armor stand
# at @s
# run from player/damage/shield/blocked_damage

item replace entity @s weapon.mainhand with iron_axe[weapon={disable_blocking_for_seconds:2}]
damage @p[tag=gm4_sr_target] 0.01 mob_attack by @s
kill @s
