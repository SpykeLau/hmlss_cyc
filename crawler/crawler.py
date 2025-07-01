import logging


def fetch_news():
    logging.info("Fetching news...")
    return [{"title": "Sample News", "content": "Details"}]


def main():
    articles = fetch_news()
    print(f"Fetched {len(articles)} articles")


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    main()
