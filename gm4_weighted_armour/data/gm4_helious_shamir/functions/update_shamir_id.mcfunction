# @s = tool with freshly applied helious shamir
# at world spawn
# run by metallurgy once the shamir was applied

# repair shamirs that were made during 1.13-1.15 (fixes typo)
data modify entity @s Item.tag.gm4_metallurgy.active_shamir set value "helious"
data modify entity @s Item.tag.display.Lore[-1] set value '{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Helious",{"translate":"item.gm4.shamir.helious"}]}'
