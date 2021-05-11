class RiotApiSummoner
    include HTTParty
    base_uri 'https://na1.api.riotgames.com'

    def initialize
        @options = { headers: { "X-Riot-Token": 'RGAPI-9c514bcd-cecd-4d42-9dcb-42543c3ff556' } }
    end

    def summoner(name)
        name.gsub! ' ', '%20'
        self.class.get("/lol/summoner/v4/summoners/by-name/#{name}", @options)
    end

    def get_game(summon_id)
        summon_id.gsub! ' ', '%20'
        self.class.get("/lol/spectator/v4/active-games/by-summoner/#{summon_id}", @options)
    end
end
