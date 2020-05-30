
schedule function gm4_shiny_items:main 16t

# Blacklist Items
execute at @a as @e[type=item] at @s run function gm4_shiny_items:blacklist_items

# Condition for item to get tag "gm4_can_become_shiny"
execute as @e[type=minecraft:item,tag=!gm4_shiny_blacklist] at @s if entity @e[type=minecraft:experience_orb,distance=..2,tag=!gm4_shiny_blacklist] unless entity @e[distance=..2,nbt={Item:{tag:{unstackable:1b}}}] run tag @s add gm4_can_become_shiny
# Execute at all entities with tag "gm4_can_become_shiny"
execute as @e[tag=gm4_can_become_shiny] at @s run function gm4_shiny_items:as_gm4_can_become_shiny

# Condition for item to get tag "gm4_can_be_absorbed"
execute as @e[type=minecraft:experience_orb] at @s if entity @e[tag=gm4_can_become_shiny,distance=..2] run tag @s add gm4_can_be_absorbed
# Execute at all entities with tag "gm4_can_be_absorbed"
execute as @e[tag=gm4_can_be_absorbed] at @s run function gm4_shiny_items:as_gm4_can_be_absorbed

# Show Particles
execute as @e[type=item,scores={gm4_absorbed_xp=1..}] at @s run particle minecraft:enchant ~ ~.4 ~ .1 .1 .1 .01 1
execute at @e[tag=gm4_shiny_blacklist] if entity @e[type=experience_orb,distance=..3] run particle smoke ~ ~.5 ~ .1 .1 .1 .01 1

# Refund XP
execute as @e[scores={gm4_absorbed_xp=0..}] at @s run function gm4_shiny_items:check_for_stop
