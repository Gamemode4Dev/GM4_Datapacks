#start commands for charging impulse core
#@s - impulse core item on beacon
#called by impulse_cores:item/charge/tick

#summon armour stand
execute align xyz run summon minecraft:armor_stand ~.5 ~-.5 ~.5 {Tags:["gm4_impulse_core_charging"],Invulnerable:1b,Invisible:1b,Small:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"05018caf-146c-480a-9738-f13cbbbbf094",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NTc1NzQ2OTkxMjAsInByb2ZpbGVJZCI6ImIwZDRiMjhiYzFkNzQ4ODlhZjBlODY2MWNlZTk2YWFiIiwicHJvZmlsZU5hbWUiOiJ4RmFpaUxlUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTdlN2I3ODBkNWZlMDdmOWQ2NGQ1NjlmYjk5YWRiZTE5MjFjYjRjMzNkOTQ0ZWI4MDdhMTBhOWI5NTM4NGZiZiJ9fX0="}]}}}}],CustomName:'"gm4_impulse_core_charging"'}

#audiovisuals
playsound minecraft:block.portal.trigger player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:poof ~ ~ ~ 1 2 1 .1 250 normal @a
particle minecraft:witch ~ ~ ~ 1 2 1 .1 250 normal @a

summon minecraft:lightning_bolt ~ ~-1.1 ~

#remove item entity and block
setblock ~ ~ ~ minecraft:air
kill @s
