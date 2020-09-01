# @s = command block placed by gm4_custom_crafters:relocate/replace_head

function gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter"],Fire:200000,CustomName:'"gm4_custom_crafter"',ArmorItems:[{},{},{},{id:"crafting_table",Count:1,tag:{CustomModelData:1}}]}
