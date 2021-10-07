scoreboard objectives add gm4_vecto_id dummy

team add gm4_vecto_nocoll
team modify gm4_vecto_nocoll collisionRule never

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
scoreboard players set vecto_shamir gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vecto_shamir:band/v1",name:"[Drop to Fix Item] gm4_vecto_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vecto",metal:{type:"bismuth",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;-359255454,30123560,-1513962184,-616842323],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODAxNDc0OTQ2MSwKICAicHJvZmlsZUlkIiA6ICJiMWMyNWQ0YjMwZDU0N2Y4YTk3NmZlYTllOGU1YzBjMyIsCiAgInByb2ZpbGVOYW1lIiA6ICJvd29FbmRlciIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS82NmM0ODcwYmNiMDdkYWJjMjNiNTZkMzJlNzI5OWI5NTE4ZTU1N2VmMzU2YTNiZGRmNDBkNGM3MDIwYzI3MTdhIgogICAgfQogIH0KfQ=="}]}},CustomModelData:3420121,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#F47989","extra":[{"italic":false,"color":"#F5B478","translate":"%1$s%3427655$s","with":["sm",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.orange"}]}]},{"italic":false,"color":"#F5DD79","translate":"%1$s%3427655$s","with":["ut",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.yellow"}]}]},{"italic":false,"color":"#78F4AE","translate":"%1$s%3427655$s","with":["h ",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.green"}]}]},{"italic":false,"color":"#79D6F5","translate":"%1$s%3427655$s","with":["Ba",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.blue"}]}]},{"italic":false,"color":"#8378F5","translate":"%1$s%3427655$s","with":["nd",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.purple"}]}]},{"italic":false,"color":"#D579F5","translate":"%1$s%3427655$s","with":["",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.magenta"}]}]}],"translate":"%1$s%3427655$s","with":["Bi",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth.red"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Vecto",{"translate":"item.gm4.shamir.vecto"}]}']}}}

schedule function gm4_vecto_shamir:main 4t

# guidebook
summon marker ~ 4568.795477398233 ~ {CustomName:'"gm4_vecto_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"vecto_shamir",page_count:1,line_count:1,module_name:"Vecto Shamir"}}

#$moduleUpdateList
