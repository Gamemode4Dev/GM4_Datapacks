
# scoreboard players reset @s gm4_infinitas_empty_held

execute as @a[tag=gm4_has_infinitas] run function gm4_infinitas_shamir:clock/inventory_check

execute if entity @a[tag=gm4_has_infinitas,limit=1] run schedule function gm4_infinitas_shamir:clock/active 1t
