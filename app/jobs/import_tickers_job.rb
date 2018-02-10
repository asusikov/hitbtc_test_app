class ImportTickersJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    self.class.set(:wait => 5.minutes).perform_later(*job.arguments)
  end

  def perform(*args)
    HitbtcImporter.new.import_tickers
  end
end
