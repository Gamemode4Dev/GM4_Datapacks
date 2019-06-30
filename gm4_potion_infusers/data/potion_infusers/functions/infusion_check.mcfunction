#@s = potion tank
#run from main

tag @s[tag=gm4_pi_infuser] remove gm4_pi_infuser

execute if entity @s[tag=gm4_lt_night_vision] run function #potion_infusers:infuse_check/night_vision
execute if entity @s[tag=gm4_lt_fire_resistance] run function #potion_infusers:infuse_check/fire_resistance
execute if entity @s[tag=gm4_lt_invisibility] run function #potion_infusers:infuse_check/invisibility
execute if entity @s[tag=gm4_lt_leaping] run function #potion_infusers:infuse_check/leaping
execute if entity @s[tag=gm4_lt_strong_leaping] run function #potion_infusers:infuse_check/strong_leaping
execute if entity @s[tag=gm4_lt_swiftness] run function #potion_infusers:infuse_check/swiftness
execute if entity @s[tag=gm4_lt_strong_swiftness] run function #potion_infusers:infuse_check/strong_swiftness
execute if entity @s[tag=gm4_lt_slowness] run function #potion_infusers:infuse_check/slowness
execute if entity @s[tag=gm4_lt_strong_slowness] run function #potion_infusers:infuse_check/strong_slowness
execute if entity @s[tag=gm4_lt_turtle_master] run function #potion_infusers:infuse_check/turtle_master
execute if entity @s[tag=gm4_lt_strong_turtle_master] run function #potion_infusers:infuse_check/strong_turtle_master
execute if entity @s[tag=gm4_lt_water_breathing] run function #potion_infusers:infuse_check/water_breathing
execute if entity @s[tag=gm4_lt_healing] run function #potion_infusers:infuse_check/healing
execute if entity @s[tag=gm4_lt_strong_healing] run function #potion_infusers:infuse_check/strong_healing
execute if entity @s[tag=gm4_lt_harming] run function #potion_infusers:infuse_check/harming
execute if entity @s[tag=gm4_lt_strong_harming] run function #potion_infusers:infuse_check/strong_harming
execute if entity @s[tag=gm4_lt_poison] run function #potion_infusers:infuse_check/poison
execute if entity @s[tag=gm4_lt_strong_poison] run function #potion_infusers:infuse_check/strong_poison
execute if entity @s[tag=gm4_lt_regeneration] run function #potion_infusers:infuse_check/regeneration
execute if entity @s[tag=gm4_lt_strong_regeneration] run function #potion_infusers:infuse_check/strong_regeneration
execute if entity @s[tag=gm4_lt_strength] run function #potion_infusers:infuse_check/strength
execute if entity @s[tag=gm4_lt_strong_strength] run function #potion_infusers:infuse_check/strong_strength
execute if entity @s[tag=gm4_lt_weakness] run function #potion_infusers:infuse_check/weakness
execute if entity @s[tag=gm4_lt_slow_falling] run function #potion_infusers:infuse_check/slow_falling
execute if entity @s[tag=gm4_lt_floating] run function #potion_infusers:infuse_check/floating
