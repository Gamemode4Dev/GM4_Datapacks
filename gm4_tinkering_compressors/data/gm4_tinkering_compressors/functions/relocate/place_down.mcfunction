# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"translate":"container.gm4.tinkering_compressor","fallback":"Tinker Amount"}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_tinkering_compressor"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor"',ArmorItems:[{},{},{},{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":3420001,"minecraft:profile":"$tinkering_compressor"}}],HandItems:[{id:"minecraft:stone_button",count:1,components:{"minecraft:custom_model_data":3420002}}],Pose:{RightArm:[0f, 0f, 0f]}}
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
