# run from gm4_gemini_shamir:breed/check_[cat,llama,wolf]
# @s = the gemini bred baby

data modify entity @s Owner set from storage gm4_gemini_shamir:temp/uuid UUID
tag @s remove gm4_gemini_tamed
data remove storage gm4_gemini_shamir:temp/uuid UUID
