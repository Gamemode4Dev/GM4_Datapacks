# @template gm4:test_platform
# @dummy ~ ~1 ~

fill ~2 ~1 ~ ~2 ~1 ~2 gray_concrete
give @s item_frame
execute at @s run tp @s ~ ~ ~ facing ~2 ~-1.5 ~1
dummy @s use block ~2 ~1 ~1 west

give @s minecraft:splash_potion[potion_contents="minecraft:invisibility"]
dummy @s use item

await delay 5t
give @s diamond_pickaxe
dummy @s use entity @e[type=item_frame,distance=..3,limit=1]

await entity @s[advancements={gm4:display_frames=true}]
await entity @e[type=item_frame,distance=..3,nbt={Invisible:1b}]
