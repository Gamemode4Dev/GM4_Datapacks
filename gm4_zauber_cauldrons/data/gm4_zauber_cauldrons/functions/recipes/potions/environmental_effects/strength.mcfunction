# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

# place fire
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~0 ~-1 #gm4:replaceable run setblock ~-1 ~0 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~0 ~0 #gm4:replaceable run setblock ~-1 ~0 ~0 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~0 ~1 #gm4:replaceable run setblock ~-1 ~0 ~1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~0 ~0 ~-1 #gm4:replaceable run setblock ~0 ~0 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~0 ~0 ~1 #gm4:replaceable run setblock ~0 ~0 ~1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~0 ~-1 #gm4:replaceable run setblock ~1 ~0 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~0 ~0 #gm4:replaceable run setblock ~1 ~0 ~0 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~0 ~1 #gm4:replaceable run setblock ~1 ~0 ~1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~1 ~-1 #gm4:replaceable run setblock ~-1 ~1 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~1 ~0 #gm4:replaceable run setblock ~-1 ~1 ~0 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~-1 ~1 ~1 #gm4:replaceable run setblock ~-1 ~1 ~1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~0 ~1 ~-1 #gm4:replaceable run setblock ~0 ~1 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~0 ~1 ~1 #gm4:replaceable run setblock ~0 ~1 ~1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~1 ~-1 #gm4:replaceable run setblock ~1 ~1 ~-1 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~1 ~0 #gm4:replaceable run setblock ~1 ~1 ~0 fire destroy
execute if predicate gm4_zauber_cauldrons:cauldron/fire_chance if block ~1 ~1 ~1 #gm4:replaceable run setblock ~1 ~1 ~1 fire destroy

# sound
playsound item.firecharge.use block @a[distance=..8] ~ ~ ~ 0.8 0.6
