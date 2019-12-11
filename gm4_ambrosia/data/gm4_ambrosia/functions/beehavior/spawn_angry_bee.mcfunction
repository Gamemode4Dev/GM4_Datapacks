# @s = a beehive
# at @s
# called by hive/process_hive or hive/destroy_hive

# summon bee
summon vex ~ ~-.4 ~ {LifeTicks:240,Tags:["gm4_new_bee","gm4_roaming_bee","gm4_angry_bee"],CustomName:'{"translate":"%1$s","with":["Bee","entity.gm4.bee"]}',Health:3,Attributes:[{Name:"generic.maxHealth",Base:1},{Name:"generic.attackDamage",Base:0.1},{Name:"generic.knockbackResistance",Base:1f}],Silent:1b,DeathLootTable:"minecraft:empty",DeathTime:-81,HandItems:[{id:"minecraft:player_head",Count:1,tag:{SkullOwner: {Id: "e33d214d-2458-499f-ffe4-ff589a0d2e7c", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1NjgwNDQzNzYyMzEsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS83OWJkZGNkM2IxMTVjY2ZiYTgxYTBlYmZjMTVkMWFiYzNjYjRiOTJjMTkyMjU1ZWZmMGRiNzgyNWQzOGVjYzFkIn19fQ=="}]}}}}],HandDropChances:[0.0f,0.0f],ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:0b}],Silent:1b}
# assign beehive roaming point
execute as @e[type=vex,distance=..1,tag=gm4_new_bee] run function gm4_ambrosia:beehavior/initialise_angry_bee
