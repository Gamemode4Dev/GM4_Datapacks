#fixes dropped impulse core as well as conveying to the player charge loss
#@s - impulse core item entity from broken player head
#called by impulse_cores:main

#audiovisuals
playsound minecraft:block.beacon.deactivate player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 .25 5 normal @a

#fix entity
data merge entity @s {Item:{tag:{gm4_impulse_core:1b,gm4_impulse_cores:{charge:0},HideFlags:1b,display:{Lore:['[{"translate":"%1$s","with":[{"text":"Charge: ","color":"gray","italic":false},{"translate":"text.gm4.impulse_core.charge"}]},{"text":"0","color":"dark_gray","italic":false}]'],Name:'{"translate":"%1$s","with":["Impulse Core",{"translate":"item.gm4.impulse_core"}],"italic":false}'},SkullOwner:{Id:"05018caf-146c-480a-9738-f13cbbbbf094",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NTc1NzQ2OTkxMjAsInByb2ZpbGVJZCI6ImIwZDRiMjhiYzFkNzQ4ODlhZjBlODY2MWNlZTk2YWFiIiwicHJvZmlsZU5hbWUiOiJ4RmFpaUxlUiIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTdlN2I3ODBkNWZlMDdmOWQ2NGQ1NjlmYjk5YWRiZTE5MjFjYjRjMzNkOTQ0ZWI4MDdhMTBhOWI5NTM4NGZiZiJ9fX0="}]}}}}}
