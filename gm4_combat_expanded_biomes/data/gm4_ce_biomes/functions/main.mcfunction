schedule function gm4_ce_base:main 16t

# | Mobs
# process cloaked creepers
execute as @e[type=creeper,tag=gm4_ce_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_ce_base:mob/process/cloaked_creeper
# zombie spores
execute as @e[type=item,tag=gm4_ce_spore] at @s run function gm4_ce_base:mob/process/spore/advance
item replace entity @e[type=#gm4_ce_base:zombie_types,tag=gm4_ce_spore_zombie,predicate=gm4_ce_base:technical/on_fire] armor.head with air
