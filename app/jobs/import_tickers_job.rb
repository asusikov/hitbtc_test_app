class ImportTickersJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    self.class.set(:wait => 1.minutes).perform_later(*job.arguments)
  end

  def perform(*args)
    HitbtcImporter.new.import_tickers
    LastTickerNotificator.notificate
  end
end
