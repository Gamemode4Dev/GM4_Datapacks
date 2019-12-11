# @s = a beehive
# at @s
# called by hive/create_hive and hive/spawn_hive_loot

# summon bee
summon vex ~ ~-.4 ~ {LifeTicks:1050,Tags:["gm4_new_bee","gm4_roaming_bee"],CustomName:'{"translate":"%1$s","with":["Bee","entity.gm4.bee"]}',Health:1,Attributes:[{Name:"generic.maxHealth",Base:1},{Name:"generic.followRange",Base:0},{Name:"generic.attackDamage",Base:0},{Name:"generic.knockbackResistance",Base:1f},{Name:"generic.attackDamage",Base:0}],Silent:1b,DeathLootTable:"minecraft:empty",DeathTime:-81,HandItems:[{id:"minecraft:player_head",Count:1,tag:{SkullOwner: {Id: "d33e210d-2458-459f-ffe4-ff579a0d2e7c", Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1Njc1MjU5MTEwMTEsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lYmUzODQxODQxYmFjZDc5MmM5NWU4ZmYzYjc3MmUwMDQzNzJjNThlN2I3MWJlZGU5MzBjYjBkOGRmMTVjNTBlIn19fQ=="}]}}}}],HandDropChances:[0.0f,0.0f],ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:0b}],Silent:1b}
# assign beehive roaming point
execute as @e[type=vex,distance=..1,tag=gm4_new_bee] run function ambrosia:beehavior/initialise_roaming_bee
