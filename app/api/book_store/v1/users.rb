module BookStore
    module V1
      class Users < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api      
        resource :users do
          desc 'Return list of books'
          get do
            users = User.all
            present users
          end
        end

        resource :users do
          desc 'Return list of books'
          get do
            users = User.all
            present users
          end
        end
      end
    end
  end