# @s = command block placed by gm4_enchantment_extractors:relocate/place_down_check

function gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"block.gm4.enchantment_extractor"}]}'}
summon armor_stand ~ ~-1.2 ~ {CustomName:'"GM4 Enchantment Extractor"',Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1,Tags:["gm4_enchantment_extractor","gm4_no_edit"],ArmorItems:[{},{},{},{id:enchanting_table,Count:1,tag:{CustomModelData:1}}],DisabledSlots:2039583}
playsound entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 1 0.7 1
