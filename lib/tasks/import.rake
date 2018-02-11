namespace :import do
  task tickers: :environment do
    if Delayed::Job.all.count == 0
      ImportTickersJob.perform_later
    end
  end
end
