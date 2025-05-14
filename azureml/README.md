# Kotoba Recipes to run on AzureML

This `azureml` folder is mounted on an Azure ML Compute Cluster.
<br>The folders and files in this azureml directory were copied from the original repository and modified to run in the Azure ML environment.

`Pretrain.ipynb` is configured to pretrain LLaMA 3–8B.
According to the original repository, you should download the checkpoint files from Hugging Face and store them in the Azure Blob Storage container specified by the `model_dir` parameter in the script.
<br>Also the current configuration assumes the training dataset stored in blob storage folder specified by `train_data`. The acutal file name is specified as `wikidump.jsonl` in the script.