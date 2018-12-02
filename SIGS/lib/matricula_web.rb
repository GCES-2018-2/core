module MatriculaWeb
    @@base_url = ''
    
    def make_request
        @@base_url
    end

    module Seeder
        def courses
            make_request
        end
    end
end