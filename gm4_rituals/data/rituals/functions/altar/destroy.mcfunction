#destroys altar
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar] if a block of the altar has been destroyed
#called by rituals:altar/checks

#audiovisuals
playsound minecraft:entity.zombie_villager.converted player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:entity.zombie_villager.converted player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:entity.zombie_villager.converted player @a[distance=..20] ~ ~ ~ 100 0 1

summon minecraft:lightning_bolt ~ ~-1 ~
summon minecraft:evoker_fangs ~1 ~-1 ~
summon minecraft:evoker_fangs ~-1 ~-1 ~
summon minecraft:evoker_fangs ~ ~-1 ~1
summon minecraft:evoker_fangs ~ ~-1 ~-1

#destroy all blocks
fill ~1 ~3 ~1 ~-1 ~-1 ~-1 minecraft:air destroy

#kill entity
kill @s[type=!minecraft:player]
