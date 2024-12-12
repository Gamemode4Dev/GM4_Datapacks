# @s = command block placed by "gm4_relocators:place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"translate":"block.gm4.custom_crafter","fallback":"Custom Crafter"}'}
summon armor_stand ~ ~-.4 ~ {Small:1b,NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter"],HasVisualFire:1b,CustomName:'"gm4_custom_crafter"',ArmorItems:[{},{},{},{id:"crafting_table",count:1,components:{"mninecraft:custom_model_data":"gm4_custom_crafters:block/custom_crafter"}}]}
