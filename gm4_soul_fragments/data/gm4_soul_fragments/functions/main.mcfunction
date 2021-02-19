# runs stuff on respawn
execute as @e[type=player,scores={gm4_sf_rspwn=1..}] at @s run function gm4_soul_fragments:player/revived

# manage players
execute as @a[gamemode=!spectator] at @s run function gm4_soul_fragments:player/submain

# mob holding a soul in a lantern
execute as @e[nbt={CanPickUpLoot:1b},nbt={HandItems:[{id:"minecraft:soul_lantern",Count:1b},{}]}] if data entity @s HandItems[0].tag.gm4_soul_fragments.id at @s run function gm4_soul_fragments:mob/process

# mob that can pick up loot near players
execute as @e[nbt={CanPickUpLoot:1b}] at @s if entity @a[distance=..16,gamemode=!spectator] if predicate gm4_soul_fragments:reveal_item run scoreboard players set @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment,distance=..4] gm4_sf_fire 1

# manage soul fragments
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/process_check

# soul in a lantern on the ground
execute as @e[type=item,nbt={Item:{id:"minecraft:soul_lantern",tag:{gm4_soul_fragments:{}},Count:1b},OnGround:1b}] at @s run function gm4_soul_fragments:soul_lantern/process

# angry soul fragment
execute as @e[type=minecraft:vex,tag=gm4_angry_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/process_angry_fragment

# soul tracker
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_sf_soul_tracker] at @s unless entity @e[type=vex,tag=gm4_angry_soul_fragment,distance=..1] run function gm4_soul_fragments:spawn_fragment

schedule function gm4_soul_fragments:main 16t
