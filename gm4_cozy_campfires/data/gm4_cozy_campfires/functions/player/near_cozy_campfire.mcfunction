# @s = player near a campfire
# at @s
# run from gm4_cozy_campfires:campfire/structure/validate

tag @s add gm4_near_cozy_campfire

# the attribute is not applied here as the attribute command only accepts a
# single entity. Therefore it is more efficient to bundle all attribute calls
# within a single function that is called "as @a". See main and
# gm4_cozy_campfires:player/manage_attribute

# particle using RGB (count must be 0)
particle minecraft:ambient_entity_effect ~.3 ~.8 ~.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~.3 1 0.773 0.208 1 0
