# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=#gm4_illusioner_nights:illusioner_convertable,tag=!smithed.entity,tag=!gm4_mm_illusioner_checked,x=0,predicate=gm4_illusioner_nights:illusioner_convert_chance,nbt={PersistenceRequired:0b}] unless data entity @s DeathLootTable at @s run function gm4_illusioner_nights:illusioner_transform
tag @e[type=#gm4_illusioner_nights:illusioner_convertable] add gm4_mm_illusioner_checked
