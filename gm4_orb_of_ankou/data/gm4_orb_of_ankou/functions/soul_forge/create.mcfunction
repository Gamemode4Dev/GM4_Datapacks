# @s = player who used a flint and steel in the nether
# located at fire block that player is looking at
# run from soul_forge/used_flint_and_steel

summon armor_stand ~ ~ ~ {CustomName:'"gm4_soul_forge"',Tags:["gm4_no_edit","gm4_soul_forge"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Pose:{Head:[200.0f,0.0f,0.0f]}}

playsound minecraft:entity.player.breath block @a[distance=..12] ~ ~0.5 ~ 1 0.5
particle minecraft:campfire_signal_smoke ~ ~0.7 ~ 0 2 0 0.05 10 force
particle minecraft:soul ~ ~0.7 ~ 0 2 0 0.05 10 force
advancement grant @s only gm4:create_soul_forge
