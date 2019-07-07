#finish commands for charging impulse core
#@s - impulse core item on beacon
#called by impulse_cores:item/charge/tick

#audiovisuals
particle minecraft:poof ~ ~ ~ 1 2 1 .1 250 normal @a
particle minecraft:flame ~ ~ ~ 1 2 1 .1 250 normal @a

#summon item
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_impulse_core:1b,gm4_impulse_cores:{charge:0},HideFlags:1b,display:{Lore:['[{"translate":"%1$s","with":[{"text":"Charge: ","color":"gray","italic":false},{"translate":"text.gm4.impulse_core.charge"}]},{"text":"0","color":"dark_gray","italic":false}]'],Name:'{"translate":"%1$s","with":["Impulse Core",{"translate":"item.gm4.impulse_core"}],"italic":false}'},SkullOwner:{Id:"05018caf-146c-480a-9738-f13cbbbbf094",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NTc1NzQ2OTkxMjAsInByb2ZpbGVJZCI6ImIwZDRiMjhiYzFkNzQ4ODlhZjBlODY2MWNlZTk2YWFiIiwicHJvZmlsZU5hbWUiOiJ4RmFpaUxlUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTdlN2I3ODBkNWZlMDdmOWQ2NGQ1NjlmYjk5YWRiZTE5MjFjYjRjMzNkOTQ0ZWI4MDdhMTBhOWI5NTM4NGZiZiJ9fX0="}]}}}},Tags:["gm4_ic_impulse_core_charged_fail"],Glowing:1b}
team join gm4_ic_fail @e[type=minecraft:item,tag=gm4_ic_impulse_core_charged_fail,distance=..1]

#kill entity
kill @s
