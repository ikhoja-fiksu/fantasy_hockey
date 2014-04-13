every 1.day, :at => '9:20 pm' do
  runner 'ScrapePlayerStatsWorker.perform_async'
end