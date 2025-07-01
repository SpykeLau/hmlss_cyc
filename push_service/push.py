import logging


def push_update(message: str):
    logging.info(f"Pushing update: {message}")


def main():
    push_update("Daily update ready")


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    main()
