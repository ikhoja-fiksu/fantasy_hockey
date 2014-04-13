every 1.day, :at => '9:47 pm' do
  runner 'ScrapePlayerStatsWorker.perform_async'
end