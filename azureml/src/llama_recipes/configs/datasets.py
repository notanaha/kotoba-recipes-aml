@dataclass
class wikipedia_dataset:
    dataset: str = "wikipedia_dataset"
    context_size: int = 4096
    train_split: str = "train"
    test_split: str = "val"
    train_data_path: str = ""
    val_data_path: str = ""