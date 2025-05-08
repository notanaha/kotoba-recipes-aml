# Copyright (c) Meta Platforms, Inc. and affiliates.
# This software may be used and distributed according to the terms of the Llama 2 Community License Agreement.
import sys
import os

os.makedirs(os.path.join('outputs','cache'), exist_ok=True)

#current_path: str = os.getcwd()
#sys.path.append(f"{current_path}/src")
#sys.path.append(current_path)
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.abspath(os.path.join(script_dir, os.pardir))
sys.path.insert(0, os.path.join(project_root, "src"))
sys.path.insert(0, project_root)


from llama_recipes.finetuning import main

if __name__ == "__main__":
    main()
