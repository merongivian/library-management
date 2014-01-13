module SpecHelpers
  module Authentication
    def sign_up(user)
      visit new_user_registration_path
    	fill_in "Name", with: user.name
    	fill_in "Email", with: user.email
    	fill_in "Password", with: user.password
    	fill_in "Password confirmation", with: user.password
    	click_button 'Sign up'
    end

    def sign_in(user)
      visit new_user_session_path
    	fill_in "Email", with: user.email
    	fill_in "Password", with: user.password
    	click_button 'Sign in'
    end
  end
end