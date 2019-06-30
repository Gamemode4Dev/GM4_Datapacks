execute unless block ~ 4 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-5,mode:"LOAD",posY:-1,posZ:-5,showair:0b,name:"tower_structures:snowy",showboundingbox:0b}
execute if block ~ 4 ~ bedrock unless block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-3,mode:"LOAD",posY:-1,posZ:-3,showair:0b,name:"tower_structures:snowy2",showboundingbox:0b}
execute if block ~ 4 ~ bedrock if block ~ 3 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-2,mode:"LOAD",posY:-1,posZ:-2,showair:0b,name:"tower_structures:spruce_scaffold",showboundingbox:0b}
setblock ~ ~1 ~ redstone_block
function orbis:structure/finish
