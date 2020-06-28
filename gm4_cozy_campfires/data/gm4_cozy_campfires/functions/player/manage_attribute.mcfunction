# @s = @a
# at world spawn
# run from gm4_cozy_campfires:main

# apply and remove attribute
attribute @s[tag=gm4_near_cozy_campfire] minecraft:generic.max_health modifier add d11ee12a-2258-4a9a-bfef-ff57fa002e77 gm4_near_cozy_campfire 8 add
attribute @s[tag=!gm4_near_cozy_campfire] minecraft:generic.max_health modifier remove d11ee12a-2258-4a9a-bfef-ff57fa002e77

# revoke tag
tag @a remove gm4_near_cozy_campfire
