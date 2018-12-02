module MatriculaWeb
    require 'net/http'
    require 'json'

    class Requester
        @@base_url = 'https://homologaservicos.unb.br'
        @@use_ssl = true # Set to true if HTTPS and false if HTTP
        @@limit = 10000 # It was informed that, to 'homologaservicos.unb.br', the 10k limit is sufficient to gather all the information 

        def self.make_request(endpoint, limit=@@limit)
            @request_url = @@base_url + endpoint + '?limit=' + limit.to_s
            
            @uri = URI.parse(@request_url)
            
            @request = Net::HTTP::Get.new(@uri.to_s)
            
            @response = Net::HTTP.start(@uri.host, @uri.port, :use_ssl => @@use_ssl) do |http|
                http.request(@request)
            end
            
            @response.body
        end
    end

    class Seeder
        def self.disciplines
            @endpoint = '/dados/academico/oferta/atual/disciplina'
            @json = Requester.make_request(@endpoint)
            JSON.parse(@json)
        end
        
        def self.rooms
            @endpoint = '/dados/academico/oferta/atual/local'
            @json = Requester.make_request(@endpoint)
            JSON.parse(@json)
        end
        
        def self.buildings
            @endpoint = '/dados/academico/oferta/atual/projecao'
            @json = Requester.make_request(@endpoint)
            JSON.parse(@json)
        end
        
        def self.allocations_and_school_rooms
            @endpoint = '/dados/academico/oferta/atual/turma'
            @json = Requester.make_request(@endpoint)
            JSON.parse(@json)
        end
        #TODO: Uncomment the functions below when endpoints are available

        # def self.departments
        #     @endpoint = ''
        #     @json = Requester.make_request(@endpoint)
        #     JSON.parse(@json)
        # end

        # def self.campi
        #     @endpoint = ''
        #     @json = Requester.make_request(@endpoint)
        #     JSON.parse(@json)
        # end
    end
end