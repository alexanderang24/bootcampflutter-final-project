class NewsModel {
  final String title;
  final String subtitle;
  final String category;
  final String time;
  final String image;
  final String estimate;

  NewsModel({
    this.category,
    this.estimate,
    this.image,
    this.subtitle,
    this.time,
    this.title,
  });
}

List<NewsModel> popularList = [
  NewsModel(
    estimate: "3",
    category: "Bitcoin",
    time: "2 hours ago",
    title: "What Correction? On-Chain Outlook for Bitcoin Still Bright After 10% Drop",
    image: "https://ichef.bbci.co.uk/news/976/cpsprodpb/6127/production/_117317842_065760657.jpg",
    subtitle:
        "Just days ago, Bitcoin was trading at \$9,800, just days away from decisively passing \$10,000. Now, the cryptocurrency is trading at \$9,200, having collapsed on the back of fears of Satoshi Nakamoto dumping his cryptocurrency",
  ),
  NewsModel(
    estimate: "5",
    category: "Cryptocurrency",
    time: "1 hour ago",
    title: "Ark’s Cathie Wood Blames Crypto Crash on ‘ESG Movement’",
    image: "https://static.coindesk.com/wp-content/uploads/2021/05/Cathie-Wood-680x426.jpg?format=webp",
    subtitle:
        "“A lot of institutional buying went on pause” due to concerns about mining’s environmental impact, the influential fund manager said at Consensus 2021.",
  ),
  NewsModel(
    estimate: "5",
    category: "Bitcoin & Ethereum",
    time: "1 hour ago",
    title: "Bitcoin and Ethereum are now, decentralized apps are the future",
    image: "https://asset.kompas.com/crops/1NA5alLHWMHaBEgaTB6HxH27KUg=/22x234:534x576/750x500/data/photo/2020/08/23/5f41d2e287728.jpg",
    subtitle:
        "As the world lurches through another cryptocurrency hype cycle, it's wise—and refreshing—to take a break from the wildly swinging price charts of Bitcoin, Ethereum, and any number of other crypto coins, to consider how we got here and where this zany industry may be headed.",
  ),
  NewsModel(
    estimate: "6",
    category: "Bitcoin",
    time: "1 hour ago",
    title: "Bitcoin Drops, Stocks Rally Ahead of Biden’s Budget Announcement",
    image: "https://static.coindesk.com/wp-content/uploads/2020/11/Joe_Biden_48605397927-710x458.jpg?format=webp",
    subtitle: "Bitcoin is nursing losses on Friday despite hopes of more inflation-boosting U.S. stimulus to come.",
  ),
];

List<NewsModel> recentList = [
  NewsModel(
    estimate: "5",
    category: "Binance Smart Chain",
    time: "7 hours ago",
    title: "BurgerSwap Hit by Flash Loan Attack Netting Over \$7M",
    image: "https://static.coindesk.com/wp-content/uploads/2016/08/Theft-710x458.jpg?format=webp",
    subtitle: "Decentralized finance (DeFi) protocol BurgerSwap suffered a flash loan attack that saw hackers make off with around \$7.2 million of altcoins.",
  ),
  NewsModel(
    estimate: "7",
    category: "Cryptocurrency",
    time: "2 hours ago",
    title: "Cryptocurrency 'Haram' di Iran Setelah Sebabkan Listrik Padam",
    image: "https://pict-a.sindonews.net/dyn/620/pena/news/2021/05/28/178/439462/cryptocurrency-haram-di-iran-setelah-sebabkan-listrik-padam-vwq.jpg",
    subtitle: "Iran mengumumkan larangan empat bulan untuk aktivitas penambangan cryptocurrency seperti Bitcoin , lantaran memakan energi yang sangat besar.",
  ),
  NewsModel(
    estimate: "3",
    category: "Dogecoin",
    time: "4 hours ago",
    title: "Terungkap Alasan Elon Musk Dukung Dogecoin Dibanding Bitcoin Dkk",
    image: "https://www.financemagnates.com/wp-content/uploads/2021/03/DogeCoin-header-min.jpg",
    subtitle: "CEO Tesla Elon Musk terang-terangan mendukung dogecoin dibanding bitcoin maupun uang kripto lainnya.",
  ),
  NewsModel(
    estimate: "5",
    category: "Ethereum",
    time: "4 hours ago",
    title: "Ethereum Blockchain’s Ether (ETH) Coin Is Still Adhering to Its 2021 Uptrend Despite Plunging 60 Percent From All-Time Highs",
    image: "https://cdn.wccftech.com/wp-content/uploads/2021/05/Ethereum-740x417.jpg",
    subtitle:
        "Ethereum blockchain’s Ether coin made history a few weeks back when it recorded a new all-time high on the back of a ferocious and relentless rally, which saw its price surge by 500 percent! ",
  ),
  NewsModel(
    estimate: "7",
    category: "Binance Coin",
    time: "6 hours ago",
    title: "What is Binance Coin? Price, news, market cap and more",
    image: "https://cdn.mos.cms.futurecdn.net/2MuEZzYqqtKq63a5rQrSyX-970-80.jpg.webp",
    subtitle:
        "If you're wondering 'What is Binance Coin?' that's probably because you've seen it riding high in the list of top cryptocurrency performers in recent months. ",
  ),
];
