desc "This task scrapes players from Kimono"
task :scrape_player_states => :environment do
	ScrapePlayerStatsWorker.perform_async
end