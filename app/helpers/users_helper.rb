module UsersHelper

def own_page?
  current_user != @user
end

end
