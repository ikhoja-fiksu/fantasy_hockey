desc "This task scrapes players from Kimono"
task :scrape_player_stats => :environment do
	ScrapePlayerStatsWorker.perform_async
end