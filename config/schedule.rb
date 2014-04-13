every 1.day, :at => '9:30 pm' do
  runner 'ScrapePlayerStatsWorker.perform_async'
end