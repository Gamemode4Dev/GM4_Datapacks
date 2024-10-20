
# weakness is applied on any block
stopsound @s player minecraft:entity.player.hurt
effect give @s nausea 1 0
effect give @s[type=!player] slowness 1 9 true
damage @s 0.01 player_attack by @p[tag=gm4_sr_parrier]
