data merge block ~ ~ ~ {CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.liquid_tank.slow_falling","fallback":"Slow Falling Potion Tank"},[{"translate":"gui.gm4.liquid_tank","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.slow_falling","fallback":"Slow Falling Potion Tank","font":"gm4:default","color":"#404040"}]]}'}
summon armor_stand ~ ~-.95 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display","smithed.entity","smithed.strict"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,Silent:1,DisabledSlots:4144959,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",count:1,components:{"minecraft:profile":"$liquids/slow_falling"}}]}
data modify entity @s data.gm4_liquid_tanks.liquid_tag set value "gm4_lt_slow_falling"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_slow_falling
tag @s remove gm4_lt_empty
