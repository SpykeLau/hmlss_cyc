def summarize(text: str) -> str:
    return text[:100]


def main():
    sample = "This is a sample article content that will be summarized."
    print(summarize(sample))


if __name__ == "__main__":
    main()
