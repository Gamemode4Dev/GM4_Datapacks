# @s = player near a campfire
# run from gm4_cozy_campfires:cozy_campfire

# apply effect
effect give @s absorption 720 1 true

# particle using RGB
particle minecraft:entity_effect{color:[1.0,0.773,0.208,0.15]} ~.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0,0.773,0.208,0.15]} ~.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0,0.773,0.208,0.15]} ~-.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0,0.773,0.208,0.15]} ~-.3 ~.8 ~.3 0 0 0 1 1
