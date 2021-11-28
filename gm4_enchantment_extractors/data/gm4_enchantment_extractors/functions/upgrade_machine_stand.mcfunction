# updates old machine armor stands
# @s = enchantment_extractor armor stand
# located at @s
# run from gm4_enchantment_extractors:main

execute align xyz run summon marker ~0.5 ~1.5 ~0.5 {Tags:["gm4_enchantment_extractor","gm4_machine_marker","smithed.block"],CustomName:'"gm4_enchantment_extractor"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_enchantment_extractor_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_enchantment_extractor_stand"'}
data merge block ~ ~1 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
