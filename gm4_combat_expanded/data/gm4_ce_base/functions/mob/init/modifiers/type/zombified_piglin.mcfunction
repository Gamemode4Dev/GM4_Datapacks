# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/difficulty/check_type

# remove zombie leader bonus
execute if data entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}] run data remove entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}]
