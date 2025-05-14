# Kotoba Recipes to run on AzureML

This forked repository modifies the original to enable the training script to run on an Azure ML compute cluster.
<br>The following files were added to support execution on AzureML.

- `wikidump.ipynb`
    - A sample scipt for creating a sample wiki training dataset
- `prepare-index.ipynb`
    - Generates a pair of idx and bin files
- `pretrain.ipynb`
    - A sample training script

<br>Refer to the [README](./azureml/README.md) in the **azureml** folder for the quick start.

<br>
<hr />

# Kotoba Recipes

# Table of Contents

1. [Installation](#installation)
2. [Instruction Tuning](#instruction-tuning)
3. [LLM Continual Pre-Training](#llm-continual-pre-training)

## Installation

To install the package, run the following command:

```bash
pip install -r requirements.txt
```

If you want to use the library in multi-nodes, you need to install the below packages:

```bash
module load openmpi/4.x.x

pip install mpi4py
```

### FlashAttention

To install the FlashAttention, run the following command: (GPU is required)

```bash
pip install ninja packaging wheel
pip install flash-attn --no-build-isolation
```

### ABCI

If you use [ABCI](https://abci.ai/) to run the experiments, install scripts are available in `kotoba-recipes/install.sh`.

## Instruction Tuning

[scripts/abci/instruction](scripts/abci/instruction) contains the scripts to run instruction tunings on ABCI.

## LLM Continual Pre-Training

Docs is coming soon.
