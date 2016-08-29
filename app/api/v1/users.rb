module V1
  class Users < V1::Base
    
    resources :users, desc: "用户" do

      desc "所有用户", {
        entity: V1::Entities::User,
        http_codes: [
          set_status_code(500)
        ]
      }
      get do
        users = User.all
        present users, with: V1::Entities::User
      end

      namespace ":id" do

        desc "获取某个用户的信息", {
          entity: V1::Entities::User,
          http_codes: [
            set_status_code(400),
            set_status_code(500)
          ]
        }
        params do
          use :resource_path_id
        end
        get do
          user = User.find_by_id(params[:id])
          present user, with: V1::Entities::User
        end
      end
    end
    
  end
end