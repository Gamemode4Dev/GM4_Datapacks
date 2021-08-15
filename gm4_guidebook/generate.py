import pandas
import json
import os

FILE_NAMESPACE = "gm4_guidebook/"
WIKI_LINK = "https://wiki.gm4.co/wiki/"
WEBSITE_LINK = "https://gm4.co/modules/"
CMD_PREFIX = 3421000
AUTHOR = "Audrey"

HANDS = ("mainhand", "offhand")
PAGE_COUNT = 50

INV = {
	"mainhand": "SelectedItem",
	"offhand": "Inventory[{Slot:-106b}]"
}

DOC_ID = "1ToBBaGTEinkEVff60-zvP6Zbf8-9mJULhjQWriuiU0c"
DOC_SHEET = "Data"
DOC_URL = f"https://docs.google.com/spreadsheets/d/{DOC_ID}/gviz/tq?tqx=out:csv&sheet={DOC_SHEET}"

def write_json(path, content):
    filename = f"{path}.json"
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        json.dump(content, file, indent=2)
        file.write("\n")

def undefined(o):
    return (o != o)

data = pandas.read_csv(DOC_URL)
module_data = []

for module, modifier in data.groupby("Module"):
    for _, row in modifier.iterrows():
        [module_name, index, wiki_base, load_id, source, pages, stored_pages] = row
        module = module.replace("\\n   "," ").replace("\\","").replace(" ","_")
        module_id = module.lower()
        if undefined (wiki_base):
            wiki = module
        else:
            wiki = wiki_base + "/" + module
        wiki_link = WIKI_LINK + wiki
        if undefined(load_id):
            load_id = module_id
        module_data.append([module_id, module_name, index, wiki_link, load_id, source, pages, stored_pages])

for hand in HANDS:
    item_modifiers = []
    slot = INV[hand]

    def populate_terms(i, terms):
        for module in module_data:
            if not undefined(module[5]):
                module_id = module[0]
                nbt = "{gm4_guidebook:{id:\"" + module_id + "\"}}"
                term = {"condition": "minecraft:entity_properties","entity": "this","predicate": {"equipment": {f"{hand}": {"items": ["minecraft:written_book"],"nbt": f"{nbt}"}},"player": {"advancements": {f"gm4_{module_id}:guidebook/page_{i}": True}}}}
                terms.append(term)

    i = 1
    while (i < PAGE_COUNT + 1):
        terms = []
        populate_terms(i, terms)
        modifier = {"function": "minecraft:copy_nbt","source": "this","ops": [{"source": f"{slot}.tag.gm4_guidebook.stored_pages[{i}]","target": f"pages[{i}]","op": "replace" }], "conditions": [{"condition":"minecraft:alternative", "terms":terms}]}
        item_modifiers.append(modifier)
        i += 1
        
    write_json(FILE_NAMESPACE + "data/gm4_guidebook/item_modifiers/page_library/" + hand, item_modifiers)

module_data.reverse()

with open(FILE_NAMESPACE + "installed_modules.txt", "w") as file:
    for module in module_data:
        source = module[5]
        if not undefined(source):
            module_id = module[0]
            module_name = module[1]
            index = str(int(module[2]))
            wiki_link = module[3]
            website_link = WEBSITE_LINK + module[4].replace("_", "-")
            load_id = module[4]
            line_count = str(module_name.count('\\n') + 1)
            
            line = 'execute if score gm4_' + load_id + ' load.status matches 1.. run data modify storage gm4_guidebook:register ' + source + ' append value {id:"' + module_id + '",num_id:' + index + ',LootTable:"gm4_' + module_id +':items/guidebook",line_count:'+ line_count + ',line:[\'{"text":"• ' + module_name + '","color":"#4AA0C7","clickEvent":{"action":"run_command","value":"/trigger gm4_guide set ' + index + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Select Guidebook"},{"translate":"text.gm4.guidebook.select"}],"italic":true,"color":"gold"}]}}\',\'{"text":" "}\',\'{"text":"☶","bold":true,"color":"dark_purple","clickEvent":{"action":"open_url","value":"'+ wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}}\',\'{"text":" "}\',\'{"text":"◆","bold":true,"color":"blue","clickEvent":{"action":"open_url","value":"'+ website_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Download Module"},{"translate":"text.gm4.guidebook.download"}],"italic":true,"color":"gold"}]}}\']}'
            file.write(line + "\n")

for module in module_data:
    [module_id, module_name, index, wiki_link, load_id, source, pages, stored_pages] = module
    if not undefined(source):
        module_name = module_name.replace("\\n   "," ").replace("\\","")
        if undefined(index):
            index = 0
        custom_model_data = str(int(CMD_PREFIX + index))
        if undefined(pages):
            pages = ["[\"\",{\"text\":\"◀ \",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger gm4_guide set -1\"},\"hoverEvent\":{\"action\":\"show_text\",\"contents\":[{\"translate\":\"%1$s%3427655$s\",\"with\":[{\"text\":\"Return to Table of Contents\"},{\"translate\":\"text.gm4.guidebook.return_to_table_of_contents\"}],\"italic\":true,\"color\":\"gold\"}]}},{\"translate\":\"%1$s%3427655$s\",\"with\":[{\"text\":\"Back\"},{\"translate\":\"text.gm4.guidebook.back\"}],\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger gm4_guide set -1\"},\"hoverEvent\":{\"action\":\"show_text\",\"contents\":[{\"translate\":\"%1$s%3427655$s\",\"with\":[{\"text\":\"Return to Table of Contents\"},{\"translate\":\"text.gm4.guidebook.return_to_table_of_contents\"}],\"italic\":true,\"color\":\"gold\"}]}},{\"text\":\"\\n\\nThis book is not yet written\"}]"]
        if undefined(stored_pages):
            stored_pages = []
        pages = str(pages)
        stored_pages = str(stored_pages)

        nbt = '{CustomModelData:' + custom_model_data + ',gm4_guidebook:{id:\"' + module_id + '\",stored_pages:' + stored_pages + '},pages:' + pages + ',title:\"' + module_name + '\",author:' + AUTHOR + ',generation:3}'
        contents = {"pools": [{"rolls": 1,"entries": [{"type": "minecraft:item","name": "minecraft:written_book","functions": [{"function": "minecraft:set_nbt","tag": f"{nbt}"}]}]}]}
        path = "gm4_" + load_id + "/data/gm4_" + module_id + "/loot_tables/items/guidebook"
        
        write_json(path, contents)
