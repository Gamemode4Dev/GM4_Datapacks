# this is a temporary script to download all used skin files used throughout the gm4 project into the project
import base64
import json
import urllib.request
from PIL import Image
import os
import hashlib
# import webbrowser  

with open("gm4/skin_cache.json", "r+") as f:
    skins = json.load(f)["skins"]
    
    for skin in skins:
        value = skin["value"]
        d = json.loads(base64.b64decode(value).decode('utf-8'))
        url = d["textures"]["SKIN"]["url"]
        # webbrowser.open(url, new=2, autoraise=True)
        urllib.request.urlretrieve(url, "TEMP.png")
        img = Image.open(r"TEMP.png")
        img.show()
        print(skin["name"])
        erroring = True
        done = False
        while erroring:
            try:
                resp = input(">>")
                if resp == "EXIT":
                    done = True
                    break
                if resp == "UNKNOWN":
                    skin["name"] = "UNKNOWN"
                    erroring = False
                    continue
                if resp == "SKIP":
                    erroring = False
                    continue
                module, name = resp.split(":")
                subdirs = name.rsplit('/')
                if len(subdirs) > 1:
                    subdirs.pop()
                    subdirs = "/".join(subdirs)
                else:
                    subdirs = ""
                os.makedirs(f"{module}/data/{module}/skins/{subdirs}", exist_ok=True)
                img.save(f"{module}/data/{module}/skins/{name}.png")
                skin["name"] = name
                skin["hash"] = hashlib.sha1(img.tobytes()).hexdigest() # type: ignore
            except Exception as e:
                print(e)
            else:
                erroring = False
        if done:
            break
                
    
    f.seek(0)
    json.dump(skins, f, indent=2)
