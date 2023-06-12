# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor"}'}
summon armor_stand ~ ~-1.2 ~ {CustomName:'"GM4 Enchantment Extractor"',Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1,Tags:["gm4_enchantment_extractor","gm4_no_edit"],ArmorItems:[{},{},{},{id:"minecraft:enchanting_table",Count:1,tag:{CustomModelData:3420001}}],DisabledSlots:2039583}
playsound entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 1 0.7 1
