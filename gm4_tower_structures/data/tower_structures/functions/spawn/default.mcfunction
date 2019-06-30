execute unless block ~ 4 ~ bedrock unless block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-3,mode:"LOAD",posY:-1,posZ:-3,showair:0b,name:"tower_structures:default",showboundingbox:0b}
execute unless block ~ 4 ~ bedrock if block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-4,mode:"LOAD",posY:-1,posZ:-4,showair:0b,name:"tower_structures:default2",showboundingbox:0b}
execute if block ~ 4 ~ bedrock unless block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-2,mode:"LOAD",posY:-1,posZ:-2,showair:0b,name:"tower_structures:default3",showboundingbox:0b}
execute if block ~ 4 ~ bedrock if block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-4,mode:"LOAD",posY:-1,posZ:-4,showair:0b,name:"tower_structures:default4",showboundingbox:0b}
setblock ~ ~1 ~ redstone_block
function orbis:structure/finish
