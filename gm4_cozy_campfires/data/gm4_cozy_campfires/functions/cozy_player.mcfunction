# @s = player near a campfire
# run from gm4_cozy_campfires:cozy_campfire

# apply effect
effect give @s absorption 720 1 true

# particle using RGB (count must be 0)
particle minecraft:ambient_entity_effect ~.3 ~.8 ~.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~-.3 1 0.773 0.208 1 0
particle minecraft:ambient_entity_effect ~-.3 ~.8 ~.3 1 0.773 0.208 1 0

# guidebook unlock page 0
execute if score gm4_guidebook load.status matches 1 run advancement grant @s only gm4_cozy_campfires:guidebook/page_0
