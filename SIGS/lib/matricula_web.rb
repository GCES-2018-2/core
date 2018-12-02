module MatriculaWeb
    class Requester
        @@base_url = 'baseurl.com.br'
        
        def self.make_request
            @@base_url
        end
    end

    class Seeder
        def self.courses
            Requester.make_request
        end
    end
end