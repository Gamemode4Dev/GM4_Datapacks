execute unless block ~ 4 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-8,mode:"LOAD",posY:-7,posZ:-8,showair:0b,name:"dangerous_dungeons:default",showboundingbox:0b}
execute if block ~ 4 ~ bedrock run setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-8,mode:"LOAD",posY:-7,posZ:-5,showair:0b,name:"dangerous_dungeons:default2",showboundingbox:0b}
setblock ~ ~1 ~ redstone_block
function orbis:structure/finish
