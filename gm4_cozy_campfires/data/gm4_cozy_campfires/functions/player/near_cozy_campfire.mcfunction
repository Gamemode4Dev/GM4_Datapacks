# @s = player near a campfire
# at @s
# run from gm4_cozy_campfires:campfire/structure/validate

# apply effect
effect give @s absorption 720 1 true

# particle using RGB (count must be 0)
particle minecraft:ambient_entity_effect ~.3 ~.8 ~.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~.3 1 0.773 0.208 1 0