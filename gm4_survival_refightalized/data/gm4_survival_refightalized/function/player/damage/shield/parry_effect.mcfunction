# shield parry effects
# @s = entity that was parried
# at @s
# run from player/damage/shield/parry

# weakness is already applied from the blocking action

stopsound @s player minecraft:entity.player.hurt
effect give @s[distance=..3] nausea 2 0
effect give @s[distance=..3,type=!player] slowness 1 9 true
effect give @s[distance=..3] slowness 2 0 true
$damage @s[distance=..3] $(damage) player_attack by @p[tag=gm4_sr_parrier]
particle minecraft:sweep_attack ~ ~1 ~ 0 0 0 0 1
