class StatController < ApplicationController
  def index
    if params[:pop]
      @pop = params[:pop].to_i
    else
      @pop = 50000
    end
    @players = Player.where('pop < ?', @pop)
  end

  def import
    Player.delete_all

endpoint = "https://query.wikidata.org/sparql"
sparql = <<'SPARQL'.chop
SELECT ?association_football_player ?association_football_playerLabel ?countryLabel ?pop WHERE {
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
  ?association_football_player wdt:P106 wd:Q937857.
  ?association_football_player wdt:P27 ?country.
  ?country wdt:P31 wd:Q3624078.
  ?country wdt:P1082 ?pop.
}
SPARQL

client = SPARQL::Client.new(endpoint, :method => :get)
rows = client.query(sparql)

rows.each do |player|
  @player = Player.new
  player.each do |key, val|
    case key.to_s
    when "association_football_player"
      @player.item = val
    when "association_football_playerLabel"
      @player.name = val
    when "countryLabel"
      @player.country = val
    when "pop"
      @player.pop = val
    end
  end
  @player.save
end
  end
end
