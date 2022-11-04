

summon marker ~ ~ ~ {Tags:["gm4_infinitas_uuid_generator"]}
data modify storage gm4_infinitas_shamir:bucket UUID set from entity @e[type=marker,tag=gm4_infinitas_uuid_generator,limit=1] UUID

execute if entity @s[tag=gm4_infinitas_delay_replace_empty] run function gm4_infinitas_shamir:delayed_replace/empty
execute if entity @s[tag=gm4_infinitas_delay_replace_fish] run function gm4_infinitas_shamir:delayed_replace/fish
execute if score $lava_infinitas gm4_ml_data matches 1 if entity @s[tag=gm4_infinitas_delay_replace_lava] run function gm4_infinitas_shamir:delayed_replace/lava
execute if entity @s[tag=gm4_infinitas_delay_replace_milk] run function gm4_infinitas_shamir:delayed_replace/milk
execute if entity @s[tag=gm4_infinitas_delay_replace_powder_snow] run function gm4_infinitas_shamir:delayed_replace/powder_snow
execute if entity @s[tag=gm4_infinitas_delay_replace_water] run function gm4_infinitas_shamir:delayed_replace/water

kill @e[type=marker,tag=gm4_infinitas_uuid_generator]
data remove storage gm4_infinitas_shamir:bucket UUID
