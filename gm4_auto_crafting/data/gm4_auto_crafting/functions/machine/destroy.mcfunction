# destroys the auto_crafter
# @s = auto_crafter marker
# located at @s
# run from gm4_auto_crafting:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-1.44 ~ run kill @e[type=armor_stand,tag=gm4_auto_crafter_stand,limit=1,distance=..0.1]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","text":"Set Recipe Shape"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","text":"Set Recipe Shape"},{"font":"gm4:inverted_spacing","text":"Set Recipe Shape"},{"font":"gm4:offscreen","text":"Set Recipe Shape"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.auto_crafter"},{"font":"gm4:half_scale","text":"Set Recipe Shape"},{"font":"gm4:inverted","text":"Set Recipe Shape"},{"font":"gm4:inverted_spacing","text":"Set Recipe Shape"},{"color":"#373737","font":"minecraft:default","text":"Set Recipe Shape"}],"text":"Set Recipe Shape"}]},{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","translate":"container.gm4.auto_crafter"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","translate":"container.gm4.auto_crafter"},{"font":"gm4:inverted_spacing","translate":"container.gm4.auto_crafter"},{"font":"gm4:offscreen","translate":"container.gm4.auto_crafter"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.auto_crafter"},{"font":"gm4:half_scale","translate":"container.gm4.auto_crafter"},{"font":"gm4:inverted","translate":"container.gm4.auto_crafter"},{"font":"gm4:inverted_spacing","translate":"container.gm4.auto_crafter"},{"color":"#373737","font":"minecraft:default","translate":"container.gm4.auto_crafter"}],"translate":"container.gm4.auto_crafter"}]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block crafting_table ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_auto_crafting:items/auto_crafter
