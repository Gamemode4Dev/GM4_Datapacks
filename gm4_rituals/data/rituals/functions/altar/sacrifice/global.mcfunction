#commands that run on every sacrifice
#@s - sacrificed entity at altar
#called by rituals:altar/sacrifice/<entity>

#audiovisuals
playsound minecraft:block.fire.extinguish player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:block.fire.extinguish player @a[distance=..20] ~ ~ ~ 100 1 1

particle minecraft:poof ~ ~ ~ 1 1 1 0 30 normal @a

#summon lightning bolt but remove fire block
summon minecraft:lightning_bolt ~ ~-.5 ~

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar,distance=...5] add gm4_rituals_remove_fire
schedule function rituals:altar/sacrifice/remove_fire 20t

#advancement
advancement grant @a[distance=..5] only gm4:rituals_sacrifice

#add to removal tick - disabled
#scoreboard players add $removal_tick gm4_rit_stock 100

#kill entity
data merge entity @s {DeathLootTable:"minecraft:empty"}
data modify entity @s Motion[1] set value 2.0d
kill @s[type=!minecraft:player]
